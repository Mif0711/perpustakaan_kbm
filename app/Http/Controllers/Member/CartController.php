<?php

namespace App\Http\Controllers\Member;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\CartItem;
use App\Models\Loan;
use App\Models\LoanDetail;
use App\Models\Setting;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Throwable;

class CartController extends Controller
{
    private function member()
    {
        return Auth::guard('member')->user();
    }

    public function index()
    {
        $items = CartItem::with(['book.author', 'book.category'])
            ->where('member_id', $this->member()->id)
            ->latest()
            ->get();

        // Hanya item yang bukunya masih ada / tersedia yang bisa dipilih.
        return view('anggota.cart.index', compact('items'));
    }

    public function store(Book $book)
    {
        $member = $this->member();

        if ($book->tersedia < 1) {
            return back()->with('error', "Buku \"{$book->judul}\" sedang tidak tersedia, jadi belum bisa ditambahkan ke keranjang.");
        }

        $alreadyExists = CartItem::where('member_id', $member->id)
            ->where('book_id', $book->id)
            ->exists();

        if ($alreadyExists) {
            return back()->with('info', "Buku \"{$book->judul}\" sudah ada di keranjang kamu.");
        }

        try {
            CartItem::create([
                'member_id' => $member->id,
                'book_id' => $book->id,
            ]);
        } catch (QueryException $e) {
            // Unique constraint (member_id, book_id): aman jika terjadi double click.
            return back()->with('info', "Buku \"{$book->judul}\" sudah ada di keranjang kamu.");
        }

        return back()->with('success', "Buku \"{$book->judul}\" berhasil ditambahkan ke keranjang.");
    }

    public function destroy(Book $book)
    {
        $deleted = CartItem::where('member_id', $this->member()->id)
            ->where('book_id', $book->id)
            ->delete();

        if (! $deleted) {
            return back()->with('error', 'Buku tersebut tidak ada di keranjang kamu.');
        }

        return back()->with('success', "Buku \"{$book->judul}\" dihapus dari keranjang.");
    }

    public function submit(Request $request)
    {
        $member = $this->member();

        $data = $request->validate([
            'item_ids' => 'required|array|min:1',
            'item_ids.*' => 'integer',
        ], [
            'item_ids.required' => 'Pilih minimal satu buku yang ingin diajukan.',
            'item_ids.min' => 'Pilih minimal satu buku yang ingin diajukan.',
        ]);

        // Ambil hanya item milik anggota yang sedang login.
        $items = CartItem::with('book')
            ->where('member_id', $member->id)
            ->whereIn('id', $data['item_ids'])
            ->get();

        if ($items->isEmpty()) {
            return back()->with('error', 'Buku yang dipilih tidak ditemukan di keranjang kamu.');
        }

        if ($member->status !== 'aktif') {
            return back()->with('error', 'Akun anggota kamu sedang tidak aktif, sehingga belum bisa mengajukan peminjaman.');
        }

        if ($member->fines()->where('status', 'belum_bayar')->exists()) {
            return back()->with('error', 'Kamu masih memiliki denda yang belum lunas. Selesaikan denda terlebih dahulu sebelum mengajukan peminjaman.');
        }

        if ($member->loans()->where('status', 'diajukan')->exists()) {
            return back()->with('error', 'Kamu masih memiliki pengajuan yang menunggu persetujuan petugas.');
        }

        $settings = Setting::pluck('value', 'key')->toArray();
        $maxBooks = (int) ($settings['maksimal_jumlah_buku'] ?? 3);
        $maxDays = (int) ($settings['maksimal_hari_pinjam'] ?? 7);

        $activeLoans = $member->loans()->where('status', 'dipinjam')->count();

        if (($activeLoans + $items->count()) > $maxBooks) {
            return back()->with('error', "Kamu sudah meminjam {$activeLoans} buku. Batas peminjaman adalah {$maxBooks} buku, jadi kamu hanya bisa mengajukan ".max(0, $maxBooks - $activeLoans).' buku lagi.');
        }

        $unavailable = $items->filter(fn ($item) => ! $item->book || $item->book->tersedia < 1);

        if ($unavailable->isNotEmpty()) {
            $judul = $unavailable->map(fn ($item) => $item->book->judul ?? 'Buku')->implode(', ');

            return back()->with('error', "Buku berikut sedang tidak tersedia: {$judul}. Hapus dari pilihan atau coba lagi nanti. Tidak ada buku yang diajukan.");
        }

        try {
            $loan = DB::transaction(function () use ($member, $items, $maxDays) {
                // Kunci item keranjang yang dipilih agar klik ganda tidak membuat 2 pengajuan.
                $lockedItems = CartItem::where('member_id', $member->id)
                    ->whereIn('id', $items->pluck('id'))
                    ->lockForUpdate()
                    ->get();

                if ($lockedItems->isEmpty()) {
                    throw new \RuntimeException('Keranjang sudah diproses. Silakan muat ulang halaman.');
                }

                if ($member->loans()->where('status', 'diajukan')->exists()) {
                    throw new \RuntimeException('Kamu masih memiliki pengajuan yang menunggu persetujuan petugas.');
                }

                // Kunci baris buku & validasi stok terbaru.
                $books = Book::whereIn('id', $lockedItems->pluck('book_id'))
                    ->lockForUpdate()
                    ->get()
                    ->keyBy('id');

                foreach ($lockedItems as $item) {
                    $book = $books->get($item->book_id);

                    if (! $book || $book->tersedia < 1) {
                        throw new \RuntimeException('Stok buku "'.($book->judul ?? '-').'" baru saja habis. Silakan perbarui keranjang.');
                    }
                }

                // Gunakan mekanisme peminjaman yang sudah ada, dengan status menunggu persetujuan.
                $loan = Loan::create([
                    'kode_pinjam' => 'PJN-'.strtoupper(Str::random(8)),
                    'member_id' => $member->id,
                    'user_id' => null,
                    'tanggal_pinjam' => now()->toDateString(),
                    'tanggal_kembali' => now()->addDays($maxDays)->toDateString(),
                    'status' => 'diajukan',
                    'catatan' => 'Pengajuan peminjaman dari keranjang anggota.',
                ]);

                foreach ($lockedItems as $item) {
                    LoanDetail::create([
                        'loan_id' => $loan->id,
                        'book_id' => $item->book_id,
                        'jumlah' => 1,
                        'kondisi' => 'baik',
                    ]);
                }

                // Hanya buku yang berhasil diajukan yang dihapus dari keranjang.
                CartItem::whereIn('id', $lockedItems->pluck('id'))->delete();

                return $loan;
            });
        } catch (\RuntimeException $e) {
            return back()->with('error', $e->getMessage());
        } catch (Throwable $e) {
            report($e);

            return back()->with('error', 'Pengajuan gagal diproses. Silakan coba lagi beberapa saat lagi.');
        }

        return redirect()
            ->route('anggota.cart.index')
            ->with('success', "Pengajuan peminjaman berhasil dikirim (kode {$loan->kode_pinjam}). Menunggu persetujuan petugas. Stok belum dikurangi sampai pengajuan disetujui.");
    }
}
