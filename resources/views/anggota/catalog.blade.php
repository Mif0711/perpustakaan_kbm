@extends('layouts.app')

@section('title', 'Katalog Buku')

@section('content')
    <div class="mb-6 flex flex-col sm:flex-row sm:items-end sm:justify-between gap-2">
        <div>
            <h2 class="text-xl font-extrabold text-slate-900">Jelajahi Katalog 🔎</h2>
            <p class="text-sm text-slate-500 mt-0.5">Temukan buku yang ingin kamu pinjam lalu isi keranjang</p>
        </div>
        <a href="{{ route('anggota.cart.index') }}" class="btn btn-soft w-fit">🛒 Buka Keranjang</a>
    </div>

    <!-- Filter & Search -->
    <form method="GET" action="{{ route('anggota.catalog') }}" class="card p-4 mb-6 flex flex-wrap gap-3 items-end">
        <div class="flex-1 min-w-[220px]">
            <label class="label">Pencarian</label>
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Judul atau kode buku...">
        </div>
        <div class="min-w-[200px]">
            <label class="label">Kategori</label>
            <select name="category">
                <option value="">Semua Kategori</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" @selected(request('category') == $category->id)>{{ $category->nama_kategori }}</option>
                @endforeach
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Filter</button>
        <a href="{{ route('anggota.catalog') }}" class="btn btn-ghost">Reset</a>
    </form>

    <!-- Grid Buku -->
    @if($books->count() > 0)
    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
        @foreach($books as $book)
        <a href="{{ route('anggota.books.show', $book) }}" class="group card overflow-hidden hover:shadow-xl hover:-translate-y-1 transition-all duration-200">
            <div class="relative">
                @if($book->cover && file_exists(public_path('storage/'.$book->cover)))
                    <img src="{{ asset('storage/' . $book->cover) }}" class="w-full h-52 object-cover">
                @else
                    <div class="w-full h-52 bg-gradient-to-br from-slate-100 to-slate-200 flex items-center justify-center text-slate-300">
                        <svg class="w-12 h-12" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                    </div>
                @endif
                @if($book->tersedia > 0)
                    <span class="absolute top-2.5 right-2.5 badge bg-emerald-500 text-white shadow-md">Tersedia</span>
                @else
                    <span class="absolute top-2.5 right-2.5 badge bg-rose-500 text-white shadow-md">Habis</span>
                @endif
            </div>
            <div class="p-3.5">
                <p class="text-sm font-bold text-slate-800 line-clamp-2 leading-snug mb-1">{{ $book->judul }}</p>
                <p class="text-[11px] text-slate-400 mb-2.5 truncate">{{ $book->author->nama_penulis ?? '-' }}</p>
                <span class="badge bg-amber-50 text-amber-700">{{ $book->category->nama_kategori ?? '-' }}</span>
            </div>
        </a>
        @endforeach
    </div>

    <div class="mt-6">{{ $books->links() }}</div>
    @else
    <div class="card p-14 text-center">
        <div class="text-5xl mb-4">🔍</div>
        <p class="text-sm font-semibold text-slate-500">
            @if(request('search') || request('category'))
                Buku yang kamu cari nggak ketemu — coba kata kunci lain ya!
            @else
                Belum ada buku di perpustakaan.
            @endif
        </p>
    </div>
    @endif
@endsection
