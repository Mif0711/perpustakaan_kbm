@extends('layouts.app')

@section('title', $book->judul)
@section('header_title', 'Detail Buku')

@section('content')
    <div class="mb-4">
        <a href="{{ route('anggota.catalog') }}" class="text-xs text-gray-500 hover:text-gray-900 flex items-center">
            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
            Kembali ke Katalog
        </a>
    </div>

    <div class="bg-white border border-gray-100 rounded-lg p-6 mb-6">
        <div class="flex flex-col md:flex-row gap-6">
            <!-- Cover -->
            <div class="md:w-48 flex-shrink-0">
                @if($book->cover)
                    <img src="{{ asset('storage/' . $book->cover) }}" class="w-full h-64 object-cover rounded-lg shadow-md">
                @else
                    <div class="w-full h-64 bg-gray-100 rounded-lg flex items-center justify-center text-gray-300">
                        <svg class="w-20 h-20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                    </div>
                @endif
            </div>
            
            <!-- Info -->
            <div class="flex-1">
                <h2 class="text-2xl font-medium text-gray-900 mb-2">{{ $book->judul }}</h2>
                <p class="text-sm text-gray-500 mb-4">oleh {{ $book->author->nama_penulis ?? 'Tidak diketahui' }}</p>
                
                <div class="grid grid-cols-2 gap-3 text-sm mb-6">
                    <div>
                        <p class="text-xs text-gray-400">Kode Buku</p>
                        <p class="text-gray-700">{{ $book->kode_buku }}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">ISBN</p>
                        <p class="text-gray-700">{{ $book->isbn ?? '-' }}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">Kategori</p>
                        <p class="text-gray-700">{{ $book->category->nama_kategori ?? '-' }}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">Penerbit</p>
                        <p class="text-gray-700">{{ $book->publisher->nama_penerbit ?? '-' }}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">Tahun Terbit</p>
                        <p class="text-gray-700">{{ $book->tahun_terbit }}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">Lokasi Rak</p>
                        <p class="text-gray-700">{{ $book->shelf->nama_rak ?? '-' }}</p>
                    </div>
                </div>
                
                <div class="flex items-center space-x-4 mb-6">
                    <span class="text-xs text-gray-400">Stok:</span>
                    @if($book->tersedia > 0)
                        <span class="px-3 py-1 text-xs rounded-md bg-green-50 text-green-600">Tersedia ({{ $book->tersedia }})</span>
                    @else
                        <span class="px-3 py-1 text-xs rounded-md bg-red-50 text-red-600">Habis</span>
                    @endif
                </div>
                
                <!-- Tombol Aksi -->
                <div class="flex space-x-3">
                    @if($book->tersedia > 0)
                        @if($inCart)
                            <a href="{{ route('anggota.cart.index') }}" class="bg-green-600 text-white px-5 py-2.5 rounded-md text-xs font-medium hover:bg-green-700 inline-flex items-center">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                Sudah di Keranjang
                            </a>
                        @else
                            <form action="{{ route('anggota.cart.add', $book) }}" method="POST">
                                @csrf
                                <button type="submit" class="bg-gray-900 text-white px-5 py-2.5 rounded-md text-xs font-medium hover:bg-gray-800 inline-flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                    Tambah ke Keranjang
                                </button>
                            </form>
                        @endif
                    @else
                        <button disabled class="bg-gray-100 text-gray-400 px-5 py-2.5 rounded-md text-xs font-medium cursor-not-allowed">Stok Habis</button>
                    @endif
                </div>
            </div>
        </div>
        
        <!-- Deskripsi -->
        @if($book->deskripsi)
        <div class="mt-8 pt-6 border-t border-gray-100">
            <h3 class="text-sm font-medium text-gray-800 mb-2">Deskripsi</h3>
            <p class="text-sm text-gray-600 leading-relaxed">{{ $book->deskripsi }}</p>
        </div>
        @endif
    </div>

    <!-- Buku Terkait -->
    @if($relatedBooks->count() > 0)
    <div class="bg-white border border-gray-100 rounded-lg p-6">
        <h3 class="text-sm font-medium text-gray-700 mb-4">Buku Terkait</h3>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            @foreach($relatedBooks as $related)
            <a href="{{ route('anggota.books.show', $related) }}" class="group">
                @if($related->cover)
                    <img src="{{ asset('storage/' . $related->cover) }}" class="w-full h-40 object-cover rounded-lg shadow-sm group-hover:shadow-md transition-shadow mb-2">
                @else
                    <div class="w-full h-40 bg-gray-100 rounded-lg flex items-center justify-center text-gray-300 mb-2">
                        <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                    </div>
                @endif
                <p class="text-xs text-gray-800 font-medium line-clamp-2">{{ $related->judul }}</p>
                <p class="text-xs text-gray-400 mt-1">{{ $related->author->nama_penulis ?? '-' }}</p>
            </a>
            @endforeach
        </div>
    </div>
    @endif
@endsection