<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\BookReturn;
use App\Models\Fine;
use App\Models\Loan;
use App\Models\LoanDetail;
use App\Models\Member;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class LoanController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        
        $loans = Loan::with(['member', 'user'])
            ->when($search, function($query) use ($search) {
                $query->where('kode_pinjam', 'like', "%{$search}%")
                      ->orWhereHas('member', function($q) use ($search) {
                          $q->where('nama', 'like', "%{$search}%");
                      });
            })
            ->latest()
            ->paginate(10);

        $loans->appends(['search' => $search]);

        return view('loans.index', compact('loans'));
    }

    public function create()
    {
        return view('loans.create');
    }

    public function searchMember(Request $request)
    {
        try {
            $keyword = $request->get('q');
            $member = Member::where('kode_member', 'LIKE', "%{$keyword}%")
                ->orWhere('nama', 'LIKE', "%{$keyword}%")
                ->first();

            if ($member) {
                $unpaidFines = $member->fines()->where('status', 'belum_bayar')->count();
                $isBlocked = $unpaidFines > 0;
                $activeLoans = $member->loans()->where('status', 'dipinjam')->count();
                $maxBooks = (int) (Setting::where('key', 'maksimal_jumlah_buku')->value('value') ?? 3);
                $canBorrow = $activeLoans < $maxBooks;

                return response()->json([
                    'status' => 'success',
                    'data' => [
                        'id' => $member->id,
                        'kode' => $member->kode_member,
                        'nama' => $member->nama,
                        'status' => $member->status,
                        'is_blocked' => $isBlocked,
                        'can_borrow' => $canBorrow,
                        'active_loans' => $activeLoans,
                        'max_books' => $maxBooks
                    ]
                ]);
            }

            return response()->json([
                'status' => 'error', 
                'message' => 'Anggota tidak ditemukan.'
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Server Error: ' . $e->getMessage()
            ], 500);
        }
    }

    public function searchBook(Request $request)
    {
        try {
            $keyword = $request->get('q');
            $books = Book::where('judul', 'LIKE', "%{$keyword}%")
                ->orWhere('kode_buku', 'LIKE', "%{$keyword}%")
                ->where('tersedia', '>', 0)
                ->limit(10)
                ->get();

            if ($books->count() > 0) {
                return response()->json(['status' => 'success', 'data' => $books]);
            }

            return response()->json([
                'status' => 'error', 
                'message' => 'Buku tidak ditemukan atau stoknya habis.'
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Server Error: ' . $e->getMessage()
            ], 500);
        }
    }

    public function store(Request $request)
    {
        $request->validate([
            'member_id' => 'required|exists:members,id',
            'book_ids' => 'required|array|min:1',
            'book_ids.*' => 'exists:books,id',
        ]);

        $member = Member::findOrFail($request->member_id);

        if ($member->status !== 'aktif') {
            return back()->with('error', 'Anggota dalam status nonaktif.')->withInput();
        }

        $unpaidFines = $member->fines()->where('status', 'belum_bayar')->count();
        if ($unpaidFines > 0) {
            return back()->with('error', 'Anggota memiliki denda belum lunas. Tidak bisa meminjam buku.')->withInput();
        }

        $maxBooks = (int) (Setting::where('key', 'maksimal_jumlah_buku')->value('value') ?? 3);
        $maxDays = (int) (Setting::where('key', 'maksimal_hari_pinjam')->value('value') ?? 7);

        $activeLoans = $member->loans()->where('status', 'dipinjam')->count();
        $requestedBooks = count($request->book_ids);

        if (($activeLoans + $requestedBooks) > $maxBooks) {
            return back()->with('error', "Anggota sudah meminjam {$activeLoans} buku. Maksimal {$maxBooks} buku.")->withInput();
        }

        $books = Book::whereIn('id', $request->book_ids)->get();
        foreach ($books as $book) {
            if ($book->tersedia < 1) {
                return back()->with('error', "Buku '{$book->judul}' stoknya sudah habis.")->withInput();
            }
        }

        $loan = Loan::create([
            'kode_pinjam' => 'PJN-' . strtoupper(Str::random(8)),
            'member_id' => $member->id,
            'user_id' => auth()->id(),
            'tanggal_pinjam' => now(),
            'tanggal_kembali' => now()->addDays($maxDays),
            'status' => 'dipinjam',
            'source' => 'petugas',
        ]);

        foreach ($request->book_ids as $bookId) {
            LoanDetail::create([
                'loan_id' => $loan->id,
                'book_id' => $bookId,
                'jumlah' => 1,
                'kondisi' => 'baik',
            ]);
            $book = Book::find($bookId);
            $book->decrement('tersedia');
        }

        return redirect()->route('loans.index')->with('success', 'Transaksi peminjaman berhasil dibuat.');
    }

    // ================== APPROVAL PENGAJUAN ANGGOTA ==================
    
    public function requests()
    {
        $loans = Loan::with(['member', 'details.book'])
            ->where('status', 'pending')
            ->where('source', 'anggota')
            ->latest()
            ->paginate(10);
        
        return view('loans.requests', compact('loans'));
    }
    
    public function approveRequest(Request $request, Loan $loan)
    {
        if ($loan->status !== 'pending') {
            return redirect()->route('loans.requests')->with('error', 'Pengajuan ini sudah diproses.');
        }
        
        $loan->load('details.book');
        
        foreach ($loan->details as $detail) {
            if ($detail->book->tersedia < $detail->jumlah) {
                return back()->with('error', "Stok buku '{$detail->book->judul}' tidak mencukupi. Tersisa {$detail->book->tersedia}.");
            }
        }
        
        $settings = Setting::pluck('value', 'key')->toArray();
        $maxDays = (int)($settings['maksimal_hari_pinjam'] ?? 7);
        
        DB::beginTransaction();
        try {
            $loan->update([
                'status' => 'dipinjam',
                'tanggal_pinjam' => now(),
                'tanggal_kembali' => now()->addDays($maxDays),
                'approved_by' => auth()->id(),
                'approved_at' => now(),
            ]);
            
            foreach ($loan->details as $detail) {
                $book = Book::find($detail->book_id);
                $book->decrement('tersedia', $detail->jumlah);
            }
            
            DB::commit();
            
            return redirect()->route('loans.requests')->with('success', "Pengajuan {$loan->kode_pinjam} disetujui. Buku siap diambil anggota.");
            
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Terjadi kesalahan: ' . $e->getMessage());
        }
    }
    
    public function rejectRequest(Request $request, Loan $loan)
    {
        $request->validate([
            'rejected_reason' => 'required|string|max:255',
        ]);
        
        if ($loan->status !== 'pending') {
            return redirect()->route('loans.requests')->with('error', 'Pengajuan ini sudah diproses.');
        }
        
        $loan->update([
            'status' => 'rejected',
            'rejected_reason' => $request->rejected_reason,
            'rejected_at' => now(),
        ]);
        
        return redirect()->route('loans.requests')->with('success', "Pengajuan {$loan->kode_pinjam} telah ditolak.");
    }

    // ================== FITUR PENGEMBALIAN ==================
    
    public function returnsIndex()
    {
        $loans = Loan::with(['member', 'user'])->where('status', 'dipinjam')->latest()->paginate(10);
        return view('loans.returns', compact('loans'));
    }

    public function processReturn(Loan $loan)
    {
        $loan->load(['member', 'details.book']);
        
        $settings = Setting::pluck('value', 'key')->toArray();
        $dendaPerHari = (int) ($settings['denda_per_hari'] ?? 1000);

        $batasKembali = Carbon::parse($loan->tanggal_kembali);
        $hariIni = Carbon::now();
        
        $terlambatHari = 0;
        $totalDenda = 0;

        if ($hariIni > $batasKembali) {
            $terlambatHari = $batasKembali->diffInDays($hariIni);
            $totalDenda = $terlambatHari * $dendaPerHari;
        }

        return view('loans.process_return', compact('loan', 'terlambatHari', 'totalDenda'));
    }

    public function storeReturn(Request $request, Loan $loan)
    {
        if ($loan->status !== 'dipinjam') {
            return redirect()->route('returns.index')->with('error', 'Buku ini sudah dikembalikan sebelumnya.');
        }

        $settings = Setting::pluck('value', 'key')->toArray();
        $dendaPerHari = (int) ($settings['denda_per_hari'] ?? 1000);

        $batasKembali = Carbon::parse($loan->tanggal_kembali);
        $hariIni = Carbon::now();
        
        $terlambatHari = 0;
        $totalDenda = 0;

        if ($hariIni > $batasKembali) {
            $terlambatHari = $batasKembali->diffInDays($hariIni);
            $totalDenda = $terlambatHari * $dendaPerHari;
        }

        $loan->update([
            'tanggal_dikembalikan' => $hariIni,
            'status' => 'dikembalikan',
        ]);

        foreach ($loan->details as $detail) {
            $book = Book::find($detail->book_id);
            $book->increment('tersedia', $detail->jumlah);
        }

        BookReturn::create([
            'kode_kembali' => 'KBL-' . strtoupper(Str::random(8)),
            'loan_id' => $loan->id,
            'user_id' => auth()->id(),
            'tanggal_kembali' => $hariIni,
            'terlambat_hari' => $terlambatHari,
            'denda' => $totalDenda,
            'catatan' => $request->catatan,
        ]);

        if ($totalDenda > 0) {
            Fine::create([
                'kode_denda' => 'DND-' . strtoupper(Str::random(8)),
                'member_id' => $loan->member_id,
                'loan_id' => $loan->id,
                'jumlah' => $totalDenda,
                'keterangan' => "Denda keterlambatan pengembalian {$terlambatHari} hari (Kode: {$loan->kode_pinjam})",
                'status' => 'belum_bayar',
            ]);
        }

        return redirect()->route('returns.index')->with('success', 'Buku berhasil dikembalikan. Stok buku telah diperbarui.');
    }
}