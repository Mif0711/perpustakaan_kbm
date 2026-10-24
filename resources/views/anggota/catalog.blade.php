@extends('layouts.app')

@section('title', 'Katalog Buku')
@section('header_title', 'Katalog Buku')

@section('content')
    <div class="mb-6">
        <h2 class="text-lg font-medium text-gray-800 mb-1">Katalog Buku</h2>
        <p class="text-sm text-gray-500">Temukan buku yang ingin Anda pinjam</p>
    </div>

    <!-- Filter & Search -->
    <form method="GET" action="{{ route('anggota.catalog') }}" class="bg-white border border-gray-100 p-4 rounded-lg mb-6 flex flex-wrap gap-3 items-end">
        <div class="flex-1 min-w-[200px]">
            <label class="block text-xs font-medium text-gray-500 mb-1">Pencarian</label>
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Judul atau kode buku..." class="w-full px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
        </div>
        <div class="min-w-[200px]">
            <label class="block text-xs font-medium text-gray-500 mb-1">Kategori</label>
            <select name="category" class="w-full px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
                <option value="">Semua Kategori</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" @selected(request('category') == $category->id)>{{ $category->nama_kategori }}</option>
                @endforeach
            </select>
        </div>
        <button type="submit" class="bg-gray-800 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-700">Filter</button>
        <a href="{{ route('anggota.catalog') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Reset</a>
    </form>

    <!-- Grid Buku -->
    @if($books->count() > 0)
    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
        @foreach($books as $book)
        <a href="{{ route('anggota.books.show', $book) }}" class="group bg-white border border-gray-100 rounded-lg overflow-hidden hover:shadow-md transition-shadow">
            <div>
                @if($book->cover)
                    <img src="{{ asset('storage/' . $book->cover) }}" class="w-full h-56 object-cover">
                @else
                    <div class="w-full h-56 bg-gray-100 flex items-center justify-center text-gray-300">
                        <svg class="w-14 h-14" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                    </div>
                @endif
            </div>
            <div class="p-3">
                <p class="text-sm text-gray-800 font-medium line-clamp-2 mb-1">{{ $book->judul }}</p>
                <p class="text-xs text-gray-400 mb-2">{{ $book->author->nama_penulis ?? '-' }}</p>
                <div class="flex items-center justify-between">
                    <span class="text-xs text-gray-500">{{ $book->category->nama_kategori ?? '-' }}</span>
                    @if($book->tersedia > 0)
                        <span class="px-2 py-0.5 text-xs rounded bg-green-50 text-green-600">Tersedia</span>
                    @else
                        <span class="px-2 py-0.5 text-xs rounded bg-red-50 text-red-600">Habis</span>
                    @endif
                </div>
            </div>
        </a>
        @endforeach
    </div>
    
    <div class="mt-6">{{ $books->links() }}</div>
    @else
    <div class="bg-white border border-gray-100 rounded-lg p-12 text-center">
        <svg class="w-16 h-16 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
        <p class="text-sm text-gray-400">
            @if(request('search') || request('category'))
                Tidak ada buku yang cocok dengan pencarian Anda.
            @else
                Belum ada buku di perpustakaan.
            @endif
        </p>
    </div>
    @endif
@endsection