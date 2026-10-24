<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Shelve;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ShelveController extends Controller
{
    public function index()
    {
        $shelves = Shelve::latest()->paginate(10);
        return view('admin.shelves.index', compact('shelves'));
    }

    public function create()
    {
        return view('admin.shelves.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_rak' => 'required|string|max:255',
            'tipe' => 'required|in:rak,etalase',
            'kapasitas' => 'required|integer|min:0',
            'lokasi' => 'nullable|string',
            'deskripsi' => 'nullable|string',
        ]);

        Shelve::create([
            'kode_rak' => 'RAK-' . strtoupper(Str::random(5)),
            'nama_rak' => $request->nama_rak,
            'tipe' => $request->tipe,
            'kapasitas' => $request->kapasitas,
            'lokasi' => $request->lokasi,
            'deskripsi' => $request->deskripsi,
        ]);

        return redirect()->route('admin.shelves.index')->with('success', 'Rak berhasil ditambahkan.');
    }

    public function edit(Shelve $shelf)
    {
        // Nama variabel HARUS $shelf agar cocok dengan parameter route {shelf} (implicit binding)
        return view('admin.shelves.edit', compact('shelf'));
    }

    public function update(Request $request, Shelve $shelf)
    {
        $request->validate([
            'nama_rak' => 'required|string|max:255',
            'tipe' => 'required|in:rak,etalase',
            'kapasitas' => 'required|integer|min:0',
        ]);
        
        $shelf->update($request->all());
        return redirect()->route('admin.shelves.index')->with('success', 'Rak berhasil diperbarui.');
    }

    public function destroy(Shelve $shelf)
    {
        $shelf->delete();
        return redirect()->route('admin.shelves.index')->with('success', 'Rak berhasil dihapus.');
    }
}