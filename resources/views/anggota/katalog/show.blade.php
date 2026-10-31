@extends('layouts.member')

@section('title', 'Detail Buku')

@section('content')
    <a href="{{ route('anggota.katalog.index') }}" class="inline-flex items-center gap-1.5 text-xs text-gray-500 hover:text-gray-900 mb-5">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
        Kembali ke Katalog
    </a>

    <div class="grid md:grid-cols-3 gap-6">
        <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4">
            <div class="aspect-[3/4] bg-gray-50 rounded-md overflow-hidden">
                @if($book->cover)
                    <img src="{{ asset('storage/' . $book->cover) }}" alt="Sampul {{ $book->judul }}" class="w-full h-full object-cover">
                @else
                    <div class="w-full h-full flex items-center justify-center text-gray-200">
                        <svg class="w-16 h-16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                    </div>
                @endif
            </div>
        </div>

        <div class="md:col-span-2 bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
            <div class="flex flex-wrap items-start justify-between gap-3">
                <div>
                    <p class="text-[10px] uppercase tracking-wider text-gray-400">{{ $book->category->nama_kategori ?? 'Tanpa kategori' }}</p>
                    <h1 class="text-xl font-semibold text-gray-900 mt-1">{{ $book->judul }}</h1>
                    <p class="text-sm text-gray-500 mt-1">oleh {{ $book->author->nama ?? '-' }}</p>
                </div>
                <span class="px-3 py-1 rounded-full text-[11px] font-semibold {{ $book->tersedia > 0 ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600' }}">
                    {{ $book->tersedia > 0 ? 'Tersedia ('.$book->tersedia.')' : 'Tidak tersedia' }}
                </span>
            </div>

            <dl class="grid sm:grid-cols-2 gap-x-6 gap-y-3 mt-6 text-sm">
                <div><dt class="text-xs text-gray-400">Kode Buku</dt><dd class="text-gray-800 mt-0.5">{{ $book->kode_buku }}</dd></div>
                <div><dt class="text-xs text-gray-400">ISBN</dt><dd class="text-gray-800 mt-0.5">{{ $book->isbn ?: '-' }}</dd></div>
                <div><dt class="text-xs text-gray-400">Penerbit</dt><dd class="text-gray-800 mt-0.5">{{ $book->publisher->nama_penerbit ?? '-' }}</dd></div>
                <div><dt class="text-xs text-gray-400">Tahun Terbit</dt><dd class="text-gray-800 mt-0.5">{{ $book->tahun_terbit }}</dd></div>
                <div><dt class="text-xs text-gray-400">Rak / Etalase</dt><dd class="text-gray-800 mt-0.5">{{ $book->shelf->nama_rak ?? '-' }}</dd></div>
                <div><dt class="text-xs text-gray-400">Jumlah Stok</dt><dd class="text-gray-800 mt-0.5">{{ $book->jumlah }} eksemplar</dd></div>
            </dl>

            @if($book->deskripsi)
                <div class="mt-6 pt-5 border-t border-gray-100">
                    <p class="text-xs font-medium text-gray-400 uppercase tracking-wider mb-2">Deskripsi</p>
                    <p class="text-sm text-gray-600 leading-relaxed">{{ $book->deskripsi }}</p>
                </div>
            @endif

            <div class="mt-6 pt-5 border-t border-gray-100 flex flex-col sm:flex-row gap-2">
                @if($inCart)
                    <a href="{{ route('anggota.cart.index') }}"
                       class="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-md text-xs font-medium bg-gray-100 text-gray-600 hover:bg-gray-200">
                        Buku ini sudah di keranjang — Buka Keranjang
                    </a>
                @elseif($book->tersedia > 0)
                    <form method="POST" action="{{ route('anggota.cart.store', $book) }}">
                        @csrf
                        <button type="submit"
                            class="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-md text-xs font-medium bg-gradient-to-r from-amber-600 to-orange-500 text-white hover:from-amber-700 hover:to-orange-600">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                            Tambah ke Keranjang
                        </button>
                    </form>
                @else
                    <button type="button" disabled class="px-4 py-2.5 rounded-md text-xs font-medium bg-gray-100 text-gray-400 cursor-not-allowed">
                        Stok Habis — Belum Bisa Diajukan
                    </button>
                @endif

                <a href="{{ route('anggota.katalog.index') }}"
                   class="inline-flex items-center justify-center px-4 py-2.5 rounded-md text-xs font-medium border border-gray-200 text-gray-600 hover:bg-gray-50">
                    Jelajahi Buku Lain
                </a>
            </div>
        </div>
    </div>
@endsection
