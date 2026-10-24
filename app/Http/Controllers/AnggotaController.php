<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use App\Models\Loan;
use App\Models\Fine;
use Illuminate\Http\Request;

class AnggotaController extends Controller
{
    public function dashboard()
    {
        $user = auth()->user();
        
        $totalBukuTersedia = Book::where('tersedia', '>', 0)->count();
        
        $pinjamanAktif = 0;
        $dendaBelumLunas = 0;
        $totalRiwayat = 0;
        
        if ($user->member_id) {
            $pinjamanAktif = Loan::where('member_id', $user->member_id)
                ->whereIn('status', ['dipinjam', 'terlambat'])
                ->count();
            
            $dendaBelumLunas = Fine::where('member_id', $user->member_id)
                ->where('status', 'belum_bayar')
                ->sum('jumlah');
            
            $totalRiwayat = Loan::where('member_id', $user->member_id)->count();
        }
        
        $bukuTerbaru = Book::with(['category', 'author'])
            ->where('tersedia', '>', 0)
            ->latest()
            ->take(6)
            ->get();
        
        return view('anggota.dashboard', compact(
            'totalBukuTersedia', 'pinjamanAktif', 'dendaBelumLunas', 'totalRiwayat', 'bukuTerbaru'
        ));
    }
    
    public function catalog(Request $request)
    {
        $search = $request->input('search');
        $category = $request->input('category');
        
        $books = Book::with(['category', 'author', 'publisher'])
            ->when($search, function($query) use ($search) {
                $query->where('judul', 'like', "%{$search}%")
                      ->orWhere('kode_buku', 'like', "%{$search}%");
            })
            ->when($category, function($query) use ($category) {
                $query->where('category_id', $category);
            })
            ->latest()
            ->paginate(12);
            
        $books->appends(['search' => $search, 'category' => $category]);
        
        $categories = Category::orderBy('nama_kategori')->get();
        
        return view('anggota.catalog', compact('books', 'categories'));
    }
    
    public function bookDetail(Book $book)
    {
        $book->load(['category', 'author', 'publisher', 'shelf']);
        
        $relatedBooks = Book::where('category_id', $book->category_id)
            ->where('id', '!=', $book->id)
            ->where('tersedia', '>', 0)
            ->take(4)
            ->get();
        
        $inCart = false;
        $cart = auth()->user()->cart;
        if ($cart) {
            $inCart = $cart->items()->where('book_id', $book->id)->exists();
        }
        
        return view('anggota.books.show', compact('book', 'relatedBooks', 'inCart'));
    }
    
    /**
     * Halaman Status Pengajuan Peminjaman Anggota
     */
    public function loans(Request $request)
    {
        $user = auth()->user();
        
        if (!$user->member_id) {
            return view('anggota.loans.index', ['loans' => collect()]);
        }
        
        $status = $request->input('status');
        
        $loans = Loan::with(['details.book', 'approver'])
            ->where('member_id', $user->member_id)
            ->when($status, function($query) use ($status) {
                $query->where('status', $status);
            })
            ->latest()
            ->paginate(10);
        
        return view('anggota.loans.index', compact('loans'));
    }
    
    /**
     * Halaman Riwayat Peminjaman (semua status)
     */
    public function loanHistory()
    {
        $user = auth()->user();
        
        if (!$user->member_id) {
            return view('anggota.loans.history', ['loans' => collect()]);
        }
        
        $loans = Loan::with(['details.book', 'approver'])
            ->where('member_id', $user->member_id)
            ->whereIn('status', ['dikembalikan', 'rejected'])
            ->latest()
            ->paginate(10);
        
        return view('anggota.loans.history', compact('loans'));
    }
}