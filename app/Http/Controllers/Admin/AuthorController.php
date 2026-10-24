<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Author;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AuthorController extends Controller
{
    public function index()
    {
        $authors = Author::latest()->paginate(10);
        return view('admin.authors.index', compact('authors'));
    }

    public function create()
    {
        return view('admin.authors.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_penulis' => 'required|string|max:255',
            'biografi' => 'nullable|string',
        ]);

        Author::create([
            'kode_penulis' => 'PEN-' . strtoupper(Str::random(5)),
            'nama_penulis' => $request->nama_penulis,
            'biografi' => $request->biografi,
        ]);

        return redirect()->route('admin.authors.index')->with('success', 'Penulis berhasil ditambahkan.');
    }

    public function edit(Author $author)
    {
        return view('admin.authors.edit', compact('author'));
    }

    public function update(Request $request, Author $author)
    {
        $request->validate(['nama_penulis' => 'required|string|max:255']);
        $author->update($request->all());
        return redirect()->route('admin.authors.index')->with('success', 'Penulis berhasil diperbarui.');
    }

    public function destroy(Author $author)
    {
        $author->delete();
        return redirect()->route('admin.authors.index')->with('success', 'Penulis berhasil dihapus.');
    }
}