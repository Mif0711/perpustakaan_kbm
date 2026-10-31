@extends('layouts.app')

@section('title', 'Dashboard Anggota')

@section('content')
    <!-- Sapaan -->
    <div class="card relative overflow-hidden p-6 mb-6 bg-gradient-to-r from-amber-700 via-orange-600 to-amber-900 border-0 !text-white">
        <div class="absolute -right-10 -top-14 w-56 h-56 rounded-full bg-white/10 blur-2xl"></div>
        <div class="absolute right-24 bottom-[-70px] w-44 h-44 rounded-full bg-yellow-300/20 blur-xl"></div>
        <div class="relative flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4">
            <div>
                <p class="text-xs font-bold uppercase tracking-[.2em] text-white/70">Selamat datang 👋</p>
                <h2 class="text-2xl font-extrabold mt-1">{{ auth()->user()->name }}!</h2>
                <p class="text-sm text-white/80 mt-1.5">Jelajahi koleksi perpustakaan dan temukan bacaan favoritmu.</p>
            </div>
            <a href="{{ route('anggota.catalog') }}" class="inline-flex items-center gap-2 justify-center rounded-xl bg-white text-amber-700 px-4 py-2.5 text-sm font-bold shadow-lg hover:bg-amber-50 transition active:scale-[.98] w-fit">
                🔍 Cari Buku
            </a>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-sky-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-sky-100 text-sky-600 flex items-center justify-center text-lg mb-3">📚</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $totalBukuTersedia }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Judul Buku Tersedia</div>
            </div>
        </div>
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-orange-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-orange-100 text-orange-600 flex items-center justify-center text-lg mb-3">📖</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $pinjamanAktif }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Sedang Dipinjam</div>
            </div>
        </div>
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-amber-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-amber-100 text-amber-600 flex items-center justify-center text-lg mb-3">💰</div>
                <div class="text-2xl font-extrabold {{ $dendaBelumLunas > 0 ? 'text-rose-500' : 'text-slate-900' }}">Rp {{ number_format($dendaBelumLunas, 0, ',', '.') }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Denda Belum Lunas</div>
            </div>
        </div>
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-emerald-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-emerald-100 text-emerald-600 flex items-center justify-center text-lg mb-3">🗂️</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $totalRiwayat }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Total Riwayat</div>
            </div>
        </div>
    </div>

    <!-- Buku Terbaru -->
    <div class="card">
        <div class="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
            <h3 class="text-sm font-bold text-slate-700 flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-gradient-to-r from-amber-600 to-orange-500"></span>
                Buku Terbaru
            </h3>
            <a href="{{ route('anggota.catalog') }}" class="text-xs font-bold text-amber-600 hover:text-amber-700">Lihat Semua →</a>
        </div>
        <div class="p-5">
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
                @forelse($bukuTerbaru as $book)
                <a href="{{ route('anggota.books.show', $book) }}" class="group">
                    <div class="relative mb-2.5">
                        @if($book->cover && file_exists(public_path('storage/'.$book->cover)))
                            <img src="{{ asset('storage/' . $book->cover) }}" class="w-full h-44 object-cover rounded-xl shadow-md group-hover:shadow-xl group-hover:-translate-y-1 transition-all duration-200">
                        @else
                            <div class="w-full h-44 bg-gradient-to-br from-slate-100 to-slate-200 rounded-xl flex items-center justify-center text-slate-300 shadow-md group-hover:shadow-xl group-hover:-translate-y-1 transition-all duration-200">
                                <svg class="w-10 h-10" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                            </div>
                        @endif
                        @if($book->tersedia > 0)
                            <span class="absolute top-2 right-2 badge bg-emerald-500 text-white shadow">Tersedia</span>
                        @else
                            <span class="absolute top-2 right-2 badge bg-rose-500 text-white shadow">Habis</span>
                        @endif
                    </div>
                    <p class="text-xs font-bold text-slate-800 line-clamp-2 leading-snug">{{ $book->judul }}</p>
                    <p class="text-[11px] text-slate-400 mt-1 truncate">{{ $book->author->nama_penulis ?? '-' }}</p>
                </a>
                @empty
                <div class="col-span-6 text-center py-8 text-slate-400 text-sm">Belum ada buku tersedia 🫥</div>
                @endforelse
            </div>
        </div>
    </div>
@endsection
