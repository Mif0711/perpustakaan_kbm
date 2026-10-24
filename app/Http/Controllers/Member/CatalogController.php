<?php

namespace App\Http\Controllers\Member;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\CartItem;
use App\Models\Category;
use Illuminate\Http\Request;

class CatalogController extends Controller
{
    public function index(Request $request)
    {
        $search = trim((string) $request->input('search'));
        $categoryId = $request->input('category');

        $books = Book::with(['author', 'category'])
            ->when($search !== '', function ($query) use ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('judul', 'like', "%{$search}%")
                        ->orWhere('kode_buku', 'like', "%{$search}%")
                        ->orWhereHas('author', fn ($a) => $a->where('nama', 'like', "%{$search}%"));
                });
            })
            ->when($categoryId, fn ($q) => $q->where('category_id', $categoryId))
            ->latest()
            ->paginate(12)
            ->withQueryString();

        $categories = Category::orderBy('nama_kategori')->get();

        $cartBookIds = CartItem::where('member_id', auth('member')->id())
            ->pluck('book_id')
            ->all();

        return view('anggota.katalog.index', compact('books', 'categories', 'search', 'categoryId', 'cartBookIds'));
    }

    public function show(Book $book)
    {
        $book->load(['author', 'category', 'publisher', 'shelf']);

        $inCart = CartItem::where('member_id', auth('member')->id())
            ->where('book_id', $book->id)
            ->exists();

        return view('anggota.katalog.show', compact('book', 'inCart'));
    }
}
