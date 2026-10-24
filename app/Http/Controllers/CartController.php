<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Loan;
use App\Models\LoanDetail;
use App\Models\Fine;
use App\Models\Member;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function index()
    {
        $cart = $this->getOrCreateCart();
        $cart->load(['items.book.author', 'items.book.category']);
        
        $settings = Setting::pluck('value', 'key')->toArray();
        $maxBooks = (int)($settings['maksimal_jumlah_buku'] ?? 3);
        
        $totalItems = $cart->items->sum('jumlah');
        
        $unpaidFines = 0;
        $activeLoans = 0;
        
        if (auth()->user()->member_id) {
            $unpaidFines = Fine::where('member_id', auth()->user()->member_id)
                ->where('status', 'belum_bayar')
                ->count();
            
            $activeLoans = Loan::where('member_id', auth()->user()->member_id)
                ->whereIn('status', ['dipinjam', 'terlambat', 'pending'])
                ->count();
        }
        
        $canCheckout = ($totalItems > 0) && 
                       ($unpaidFines == 0) && 
                       (($activeLoans + $totalItems) <= $maxBooks);
        
        return view('anggota.cart', compact('cart', 'totalItems', 'maxBooks', 'unpaidFines', 'activeLoans', 'canCheckout'));
    }
    
    public function add(Request $request, Book $book)
    {
        $cart = $this->getOrCreateCart();
        
        if ($book->tersedia < 1) {
            return back()->with('error', "Buku '{$book->judul}' stoknya habis.");
        }
        
        $existing = $cart->items()->where('book_id', $book->id)->first();
        if ($existing) {
            return back()->with('error', 'Buku ini sudah ada di keranjang Anda.');
        }
        
        $settings = Setting::pluck('value', 'key')->toArray();
        $maxBooks = (int)($settings['maksimal_jumlah_buku'] ?? 3);
        $currentTotal = $cart->items->sum('jumlah');
        
        $activeLoans = 0;
        if (auth()->user()->member_id) {
            $activeLoans = Loan::where('member_id', auth()->user()->member_id)
                ->whereIn('status', ['dipinjam', 'terlambat', 'pending'])
                ->count();
        }
        
        if (($activeLoans + $currentTotal + 1) > $maxBooks) {
            $msg = "Batas maksimal peminjaman adalah {$maxBooks} buku. Anda sedang meminjam {$activeLoans} buku dan sudah memiliki {$currentTotal} buku di keranjang.";
            return back()->with('error', $msg);
        }
        
        CartItem::create([
            'cart_id' => $cart->id,
            'book_id' => $book->id,
            'jumlah' => 1,
        ]);
        
        return redirect()->route('anggota.cart.index')->with('success', "Buku '{$book->judul}' ditambahkan ke keranjang.");
    }
    
    public function update(Request $request, CartItem $item)
    {
        $request->validate([
            'jumlah' => 'required|integer|min:1'
        ]);
        
        if ($item->cart->user_id !== auth()->id()) {
            abort(403, 'Akses ditolak.');
        }
        
        $book = $item->book;
        
        if ($request->jumlah > $book->tersedia) {
            return back()->with('error', "Stok '{$book->judul}' hanya tersisa {$book->tersedia} eksemplar.");
        }
        
        $item->update(['jumlah' => $request->jumlah]);
        
        return back()->with('success', 'Jumlah buku diperbarui.');
    }
    
    public function remove(CartItem $item)
    {
        if ($item->cart->user_id !== auth()->id()) {
            abort(403, 'Akses ditolak.');
        }
        
        $item->delete();
        
        return back()->with('success', 'Buku dihapus dari keranjang.');
    }
    
    public function clear()
    {
        $cart = $this->getOrCreateCart();
        $cart->items()->delete();
        
        return back()->with('success', 'Keranjang dikosongkan.');
    }
    
    /**
     * CHECKOUT: Anggota mengajukan peminjaman
     */
    public function checkout(Request $request)
    {
        $user = auth()->user();
        $cart = $this->getOrCreateCart();
        $cart->load('items.book');
        
        // Validasi 1: Keranjang tidak boleh kosong
        if ($cart->items->isEmpty()) {
            return back()->with('error', 'Keranjang Anda kosong.');
        }
        
        // Validasi 2: Anggota harus punya data member (terlink)
        // Jika belum ada, auto-create sebagai fallback
        if (!$user->member_id) {
            $member = Member::create([
                'kode_member' => 'MBR-' . strtoupper(Str::random(6)),
                'nama' => $user->name,
                'jenis_kelamin' => 'L',
                'alamat' => 'Belum dilengkapi',
                'email' => $user->email,
                'tanggal_daftar' => now(),
                'status' => 'aktif',
            ]);
            $user->update(['member_id' => $member->id]);
            $user->refresh();
        }
        
        $settings = Setting::pluck('value', 'key')->toArray();
        $maxBooks = (int)($settings['maksimal_jumlah_buku'] ?? 3);
        
        // Validasi 3: Cek denda belum lunas
        $unpaidFines = Fine::where('member_id', $user->member_id)
            ->where('status', 'belum_bayar')
            ->count();
        if ($unpaidFines > 0) {
            return back()->with('error', 'Anda memiliki denda belum lunas. Lunasi terlebih dahulu sebelum meminjam.');
        }
        
        // Validasi 4: Cek batas maksimal buku
        $totalItems = $cart->items->sum('jumlah');
        $activeLoans = Loan::where('member_id', $user->member_id)
            ->whereIn('status', ['dipinjam', 'terlambat', 'pending'])
            ->count();
        
        if (($activeLoans + $totalItems) > $maxBooks) {
            return back()->with('error', "Pengajuan melebihi batas maksimal ({$maxBooks} buku). Anda sedang meminjam {$activeLoans} buku dan mengajukan {$totalItems} buku.");
        }
        
        // Validasi 5: Cek stok semua buku di cart
        foreach ($cart->items as $item) {
            if ($item->book->tersedia < $item->jumlah) {
                return back()->with('error', "Stok buku '{$item->book->judul}' tidak mencukupi. Tersisa {$item->book->tersedia} eksemplar.");
            }
        }
        
        // Validasi 6: Cek duplikat pengajuan
        $pendingLoanBookIds = Loan::where('member_id', $user->member_id)
            ->where('status', 'pending')
            ->with('details:loan_id,book_id')
            ->get()
            ->pluck('details.*.book_id')
            ->flatten()
            ->unique()
            ->toArray();
        
        foreach ($cart->items as $item) {
            if (in_array($item->book_id, $pendingLoanBookIds)) {
                return back()->with('error', "Anda sudah mengajukan peminjaman untuk buku '{$item->book->judul}' dan masih menunggu persetujuan.");
            }
        }
        
        // Mulai Database Transaction
        try {
            DB::beginTransaction();
            
            $loan = Loan::create([
                'kode_pinjam' => 'PJN-' . strtoupper(Str::random(8)),
                'member_id' => $user->member_id,
                'user_id' => $user->id,
                'tanggal_pinjam' => now(),
                'tanggal_kembali' => now(),
                'status' => 'pending',
                'source' => 'anggota',
                'catatan' => $request->catatan,
            ]);
            
            foreach ($cart->items as $item) {
                LoanDetail::create([
                    'loan_id' => $loan->id,
                    'book_id' => $item->book_id,
                    'jumlah' => $item->jumlah,
                    'kondisi' => 'baik',
                ]);
            }
            
            $cart->items()->delete();
            
            DB::commit();
            
            return redirect()->route('anggota.loans.index')
                ->with('success', 'Pengajuan peminjaman berhasil dikirim! Silakan tunggu persetujuan petugas.');
            
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Terjadi kesalahan sistem saat mengajukan peminjaman. Silakan coba lagi.');
        }
    }
    
    private function getOrCreateCart(): Cart
    {
        return auth()->user()->getCart();
    }
}