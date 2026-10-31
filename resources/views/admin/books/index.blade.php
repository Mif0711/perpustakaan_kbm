@extends('layouts.app')

@section('title', 'Data Buku')
@section('header_title', 'Manajemen Buku')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Daftar koleksi buku perpustakaan</p>
        <a href="{{ route('admin.books.create') }}" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">+ Tambah Buku</a>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Cover</th>
                    <th class="py-3 px-5 font-medium">Judul & Kode</th>
                    <th class="py-3 px-5 font-medium">Penulis</th>
                    <th class="py-3 px-5 font-medium">Kategori</th>
                    <th class="py-3 px-5 font-medium">Stok</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($books as $book)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5">
                        @if($book->cover)
                            <img src="{{ asset('storage/' . $book->cover) }}" class="w-10 h-12 object-cover rounded">
                        @else
                            <div class="w-10 h-12 bg-gray-100 rounded flex items-center justify-center text-gray-300 text-xs">N/A</div>
                        @endif
                    </td>
                    <td class="py-3 px-5">
                        <p class="text-gray-800 font-medium">{{ $book->judul }}</p>
                        <p class="text-xs text-gray-400">{{ $book->kode_buku }}</p>
                    </td>
                    <td class="py-3 px-5 text-gray-600">{{ $book->author->nama_penulis ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $book->category->nama_kategori ?? '-' }}</td>
                    <td class="py-3 px-5">
                        <span class="text-gray-800 font-medium">{{ $book->tersedia }}</span> / <span class="text-gray-400">{{ $book->jumlah }}</span>
                    </td>
                    <td class="py-3 px-5 text-right space-x-2">
                        <a href="{{ route('admin.books.edit', $book) }}" class="text-gray-500 hover:text-gray-900">Edit</a>
                        <form action="{{ route('admin.books.destroy', $book) }}" method="POST" class="inline-block" onsubmit="return confirm('Hapus buku ini?')">
                            @csrf @method('DELETE')
                            <button type="submit" class="text-red-400 hover:text-red-600">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6" class="py-6 text-center text-gray-400">Belum ada data buku.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    
    <div class="mt-4">{{ $books->links() }}</div>
@endsection