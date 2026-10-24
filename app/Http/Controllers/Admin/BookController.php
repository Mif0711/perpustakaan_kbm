<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\Category;
use App\Models\Author;
use App\Models\Publisher;
use App\Models\Shelve;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class BookController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        
        $books = Book::with(['category', 'author', 'publisher', 'shelf'])
            ->when($search, function($query) use ($search) {
                $query->where('judul', 'like', "%{$search}%")
                      ->orWhere('kode_buku', 'like', "%{$search}%");
            })
            ->latest()
            ->paginate(10);

        $books->appends(['search' => $search]);

        return view('admin.books.index', compact('books'));
    }

    public function create()
    {
        $categories = Category::orderBy('nama_kategori')->get();
        $authors = Author::orderBy('nama_penulis')->get();
        $publishers = Publisher::orderBy('nama_penerbit')->get();
        $shelves = Shelve::orderBy('nama_rak')->get();
        
        return view('admin.books.create', compact('categories', 'authors', 'publishers', 'shelves'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'isbn' => 'nullable|string|max:255',
            'category_id' => 'required|exists:categories,id',
            'author_id' => 'required|exists:authors,id',
            'publisher_id' => 'required|exists:publishers,id',
            'shelf_id' => 'nullable|exists:shelves,id',
            'tahun_terbit' => 'required|digits:4|integer|min:1900|max:' . (date('Y') + 1),
            'jumlah' => 'required|integer|min:0',
            'cover' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'deskripsi' => 'nullable|string',
        ]);

        $coverPath = null;
        if ($request->hasFile('cover')) {
            $coverPath = $request->file('cover')->store('covers', 'public');
        }

        Book::create([
            'kode_buku' => 'BK-' . strtoupper(Str::random(6)),
            'judul' => $request->judul,
            'isbn' => $request->isbn,
            'category_id' => $request->category_id,
            'author_id' => $request->author_id,
            'publisher_id' => $request->publisher_id,
            'shelf_id' => $request->shelf_id,
            'tahun_terbit' => $request->tahun_terbit,
            'jumlah' => $request->jumlah,
            'tersedia' => $request->jumlah,
            'cover' => $coverPath,
            'deskripsi' => $request->deskripsi,
        ]);

        return redirect()->route('admin.books.index')->with('success', 'Data buku berhasil ditambahkan.');
    }

    public function edit(Book $book)
    {
        $categories = Category::orderBy('nama_kategori')->get();
        $authors = Author::orderBy('nama_penulis')->get();
        $publishers = Publisher::orderBy('nama_penerbit')->get();
        $shelves = Shelve::orderBy('nama_rak')->get();
        
        return view('admin.books.edit', compact('book', 'categories', 'authors', 'publishers', 'shelves'));
    }

    public function update(Request $request, Book $book)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'isbn' => 'nullable|string|max:255',
            'category_id' => 'required|exists:categories,id',
            'author_id' => 'required|exists:authors,id',
            'publisher_id' => 'required|exists:publishers,id',
            'shelf_id' => 'nullable|exists:shelves,id',
            'tahun_terbit' => 'required|digits:4|integer|min:1900|max:' . (date('Y') + 1),
            'jumlah' => 'required|integer|min:0',
            'cover' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'deskripsi' => 'nullable|string',
        ]);

        $selisih = $request->jumlah - $book->jumlah;
        $tersediaBaru = $book->tersedia + $selisih;
        if ($tersediaBaru < 0) $tersediaBaru = 0;

        $coverPath = $book->cover;
        if ($request->hasFile('cover')) {
            if ($book->cover) Storage::disk('public')->delete($book->cover);
            $coverPath = $request->file('cover')->store('covers', 'public');
        }

        $book->update([
            'judul' => $request->judul,
            'isbn' => $request->isbn,
            'category_id' => $request->category_id,
            'author_id' => $request->author_id,
            'publisher_id' => $request->publisher_id,
            'shelf_id' => $request->shelf_id,
            'tahun_terbit' => $request->tahun_terbit,
            'jumlah' => $request->jumlah,
            'tersedia' => $tersediaBaru,
            'cover' => $coverPath,
            'deskripsi' => $request->deskripsi,
        ]);

        return redirect()->route('admin.books.index')->with('success', 'Data buku berhasil diperbarui.');
    }

    public function destroy(Book $book)
    {
        if ($book->cover) Storage::disk('public')->delete($book->cover);
        $book->delete();
        return redirect()->route('admin.books.index')->with('success', 'Data buku berhasil dihapus.');
    }
}