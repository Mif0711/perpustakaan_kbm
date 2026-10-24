@extends('layouts.app')

@section('title', 'Laporan Buku')
@section('header_title', 'Laporan Data Buku')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Rekapitulasi stok buku perpustakaan</p>
        <button onclick="window.print()" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Print / PDF</button>
    </div>

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden printable">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode</th>
                    <th class="py-3 px-5 font-medium">Judul</th>
                    <th class="py-3 px-5 font-medium">Kategori</th>
                    <th class="py-3 px-5 font-medium">Total Stok</th>
                    <th class="py-3 px-5 font-medium">Tersedia</th>
                    <th class="py-3 px-5 font-medium">Terpinjam</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($books as $book)
                <tr>
                    <td class="py-3 px-5 text-gray-500">{{ $book->kode_buku }}</td>
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $book->judul }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $book->category->nama_kategori ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $book->jumlah }}</td>
                    <td class="py-3 px-5 text-green-600 font-medium">{{ $book->tersedia }}</td>
                    <td class="py-3 px-5 text-red-600 font-medium">{{ $book->jumlah - $book->tersedia }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="6" class="py-6 text-center text-gray-400">Tidak ada data buku.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
@endsection