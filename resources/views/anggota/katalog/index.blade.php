@extends('layouts.member')

@section('title', 'Katalog Buku')

@section('content')
    <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-3 mb-6">
        <div>
            <h1 class="text-xl font-semibold text-gray-900">Katalog Buku</h1>
            <p class="text-sm text-gray-500 mt-1">Temukan buku favoritmu, lalu tambahkan ke keranjang untuk diajukan.</p>
        </div>
        <a href="{{ route('anggota.cart.index') }}"
           class="inline-flex items-center justify-center gap-2 px-4 py-2 rounded-md text-xs font-medium bg-white border border-gray-200 text-gray-700 hover:bg-gray-50">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
            Buka Keranjang
        </a>
    </div>

    <form method="GET" action="{{ route('anggota.katalog.index') }}" class="bg-white border border-gray-100 rounded-lg p-4 mb-6 flex flex-col sm:flex-row gap-2">
        <input type="text" name="search" value="{{ $search }}" placeholder="Cari judul, kode buku, atau penulis..."
               class="flex-1 px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
        <select name="category" class="px-3 py-2 border border-gray-200 rounded-md text-sm text-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
            <option value="">Semua Kategori</option>
            @foreach($categories as $category)
                <option value="{{ $category->id }}" @selected((string) $categoryId === (string) $category->id)>{{ $category->nama_kategori }}</option>
            @endforeach
        </select>
        <button type="submit" class="px-4 py-2 rounded-md text-xs font-medium bg-gray-900 text-white hover:bg-gray-800">Cari</button>
        @if($search !== '' || $categoryId)
            <a href="{{ route('anggota.katalog.index') }}" class="px-4 py-2 rounded-md text-xs font-medium border border-gray-200 text-gray-600 hover:bg-gray-50 text-center">Reset</a>
        @endif
    </form>

    @if($books->isEmpty())
        <div class="bg-white border border-gray-100 rounded-lg p-10 text-center">
            <div class="w-12 h-12 mx-auto rounded-full bg-gray-50 flex items-center justify-center text-gray-300 mb-4">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-4.35-4.35M17 11a6 6 0 11-12 0 6 6 0 0112 0z"></path></svg>
            </div>
            <p class="text-sm font-medium text-gray-900">Buku tidak ditemukan</p>
            <p class="text-xs text-gray-500 mt-1">Coba kata kunci lain atau pilih kategori berbeda.</p>
        </div>
    @else
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            @foreach($books as $book)
                @php
                    $inCart = in_array($book->id, $cartBookIds);
                    $available = $book->tersedia > 0;
                @endphp
                <div class="bg-white border border-gray-100 rounded-lg overflow-hidden flex flex-col">
                    <div class="aspect-[3/4] bg-gray-50 relative">
                        @if($book->cover)
                            <img src="{{ asset('storage/' . $book->cover) }}" alt="Sampul {{ $book->judul }}" class="w-full h-full object-cover">
                        @else
                            <div class="w-full h-full flex items-center justify-center text-gray-200">
                                <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                            </div>
                        @endif
                        <span class="absolute top-2 left-2 px-2 py-0.5 rounded-full text-[10px] font-semibold {{ $available ? 'bg-green-600 text-white' : 'bg-gray-800 text-white' }}">
                            {{ $available ? 'Tersedia' : 'Tidak tersedia' }}
                        </span>
                    </div>

                    <div class="p-3 flex-1 flex flex-col">
                        <p class="text-[10px] uppercase tracking-wider text-gray-400">{{ $book->category->nama_kategori ?? 'Tanpa kategori' }}</p>
                        <h2 class="text-sm font-medium text-gray-900 mt-1 line-clamp-2">{{ $book->judul }}</h2>
                        <p class="text-xs text-gray-500 mt-1 line-clamp-1">{{ $book->author->nama ?? '-' }}</p>

                        <div class="mt-3 pt-3 border-t border-gray-50 text-[11px] text-gray-400 flex items-center justify-between">
                            <span>Stok: {{ $book->tersedia }}</span>
                            <span>{{ $book->tahun_terbit }}</span>
                        </div>

                        <div class="mt-3 flex flex-col gap-2">
                            <a href="{{ route('anggota.katalog.show', $book) }}"
                               class="w-full text-center px-3 py-2 rounded-md text-xs font-medium border border-gray-200 text-gray-700 hover:bg-gray-50">
                                Lihat Detail
                            </a>

                            @if($inCart)
                                <a href="{{ route('anggota.cart.index') }}"
                                   class="w-full text-center px-3 py-2 rounded-md text-xs font-medium bg-gray-100 text-gray-500 hover:bg-gray-200">
                                    Sudah di Keranjang
                                </a>
                            @elseif($available)
                                <form method="POST" action="{{ route('anggota.cart.store', $book) }}">
                                    @csrf
                                    <button type="submit"
                                        class="w-full inline-flex items-center justify-center gap-1.5 px-3 py-2 rounded-md text-xs font-medium bg-gray-900 text-white hover:bg-gray-800">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                        Tambah ke Keranjang
                                    </button>
                                </form>
                            @else
                                <button type="button" disabled
                                    class="w-full px-3 py-2 rounded-md text-xs font-medium bg-gray-100 text-gray-400 cursor-not-allowed">
                                    Stok Habis
                                </button>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="mt-6">{{ $books->links() }}</div>
    @endif
@endsection
