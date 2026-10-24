@extends('layouts.app')

@section('title', 'Dashboard Anggota')
@section('header_title', 'Dashboard Anggota')

@section('content')
    <div class="mb-6">
        <h2 class="text-lg font-medium text-gray-800">Selamat datang, {{ auth()->user()->name }}! 👋</h2>
        <p class="text-sm text-gray-500 mt-1">Jelajahi koleksi buku perpustakaan dan temukan bacaan favorit Anda.</p>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Buku Tersedia</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">{{ $totalBukuTersedia }}</span>
                <span class="text-xs text-gray-400 ml-2 mb-1">Judul</span>
            </div>
        </div>
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Sedang Dipinjam</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">{{ $pinjamanAktif }}</span>
                <span class="text-xs text-gray-400 ml-2 mb-1">Buku</span>
            </div>
        </div>
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Denda Belum Lunas</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">Rp {{ number_format($dendaBelumLunas, 0, ',', '.') }}</span>
            </div>
        </div>
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Total Riwayat</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">{{ $totalRiwayat }}</span>
                <span class="text-xs text-gray-400 ml-2 mb-1">Transaksi</span>
            </div>
        </div>
    </div>

    <!-- Buku Terbaru -->
    <div class="bg-white border border-gray-100 rounded-lg">
        <div class="px-5 py-4 border-b border-gray-100 flex justify-between items-center">
            <h3 class="text-sm font-medium text-gray-700">Buku Terbaru</h3>
            <a href="{{ route('anggota.catalog') }}" class="text-xs text-gray-500 hover:text-gray-900">Lihat Semua →</a>
        </div>
        <div class="p-5">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
                @forelse($bukuTerbaru as $book)
                <a href="{{ route('anggota.books.show', $book) }}" class="group">
                    <div class="mb-2">
                        @if($book->cover)
                            <img src="{{ asset('storage/' . $book->cover) }}" class="w-full h-48 object-cover rounded-lg shadow-sm group-hover:shadow-md transition-shadow">
                        @else
                            <div class="w-full h-48 bg-gray-100 rounded-lg flex items-center justify-center text-gray-300">
                                <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                            </div>
                        @endif
                    </div>
                    <p class="text-xs text-gray-800 font-medium line-clamp-2">{{ $book->judul }}</p>
                    <p class="text-xs text-gray-400 mt-1">{{ $book->author->nama_penulis ?? '-' }}</p>
                </a>
                @empty
                <div class="col-span-6 text-center py-8 text-gray-400 text-sm">Belum ada buku tersedia.</div>
                @endforelse
            </div>
        </div>
    </div>
@endsection