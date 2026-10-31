@extends('layouts.member')

@section('title', 'Keranjang Buku')

@section('content')
    @php
        $availableIds = $items
            ->filter(fn ($item) => $item->book && $item->book->tersedia > 0)
            ->pluck('id')
            ->map(fn ($id) => (string) $id)
            ->values();
    @endphp

    <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-3 mb-6">
        <div>
            <h1 class="text-xl font-semibold text-gray-900">Keranjang Buku</h1>
            <p class="text-sm text-gray-500 mt-1">Pilih buku yang ingin kamu ajukan untuk dipinjam.</p>
        </div>
        <a href="{{ route('anggota.katalog.index') }}"
           class="inline-flex items-center justify-center gap-2 px-4 py-2 rounded-md text-xs font-medium bg-white border border-gray-200 text-gray-700 hover:bg-gray-50">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
            Jelajahi Buku
        </a>
    </div>

    @if($items->isEmpty())
        <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-10 sm:p-14 text-center">
            <div class="w-16 h-16 mx-auto rounded-full bg-gray-50 flex items-center justify-center text-gray-300 mb-5">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
            </div>
            <h2 class="text-base font-semibold text-gray-900">Keranjang buku kamu masih kosong</h2>
            <p class="text-sm text-gray-500 mt-2">Tambahkan buku dari katalog untuk mulai mengajukan peminjaman.</p>
            <a href="{{ route('anggota.katalog.index') }}"
               class="inline-flex items-center justify-center gap-2 mt-6 px-5 py-2.5 rounded-md text-xs font-medium bg-gradient-to-r from-amber-600 to-orange-500 text-white hover:from-amber-700 hover:to-orange-600">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                Jelajahi Buku
            </a>
        </div>
    @else
        <div x-data="{
                selected: [],
                submitting: false,
                allIds: @js($availableIds),
                get allSelected() { return this.allIds.length > 0 && this.selected.length === this.allIds.length; },
                toggleAll(event) { this.selected = event.target.checked ? [...this.allIds] : []; }
             }">
            <div class="grid lg:grid-cols-3 gap-6">
                <!-- Daftar buku -->
                <div class="lg:col-span-2 space-y-3">
                    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm px-4 py-3 flex items-center justify-between">
                        <label class="flex items-center gap-2.5 cursor-pointer select-none">
                            <input type="checkbox"
                                   class="w-4 h-4 rounded border-gray-300 text-gray-900 focus:ring-gray-900"
                                   :checked="allSelected"
                                   @change="toggleAll($event)"
                                   @if($availableIds->isEmpty()) disabled @endif>
                            <span class="text-sm text-gray-700">Pilih Semua</span>
                        </label>
                        <span class="text-xs text-gray-400">
                            <span x-text="selected.length">0</span> dari {{ $items->count() }} buku dipilih
                        </span>
                    </div>

                    @foreach($items as $item)
                        @php
                            $book = $item->book;
                            $available = $book && $book->tersedia > 0;
                        @endphp
                        <div class="bg-white border rounded-lg p-4 flex gap-4 {{ $available ? 'border-gray-100' : 'border-red-100 bg-red-50/30' }}">
                            <div class="pt-1">
                                <input type="checkbox"
                                       class="w-4 h-4 rounded border-gray-300 text-gray-900 focus:ring-gray-900 disabled:opacity-40"
                                       name="item_ids[]"
                                       form="submitForm"
                                       value="{{ $item->id }}"
                                       x-model="selected"
                                       @if(! $available) disabled @endif>
                            </div>

                            <div class="w-16 sm:w-20 flex-none aspect-[3/4] bg-gray-50 rounded-md overflow-hidden">
                                @if($book && $book->cover)
                                    <img src="{{ asset('storage/' . $book->cover) }}" alt="Sampul {{ $book->judul }}" class="w-full h-full object-cover">
                                @else
                                    <div class="w-full h-full flex items-center justify-center text-gray-200">
                                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                                    </div>
                                @endif
                            </div>

                            <div class="flex-1 min-w-0">
                                <div class="flex flex-wrap items-start justify-between gap-2">
                                    <div class="min-w-0">
                                        <p class="text-[10px] uppercase tracking-wider text-gray-400">{{ $book->category->nama_kategori ?? 'Tanpa kategori' }}</p>
                                        <h2 class="text-sm font-medium text-gray-900 mt-0.5 line-clamp-2">{{ $book->judul ?? 'Buku tidak ditemukan' }}</h2>
                                        <p class="text-xs text-gray-500 mt-0.5">{{ $book->author->nama ?? '-' }}</p>
                                    </div>

                                    <span class="px-2.5 py-1 rounded-full text-[10px] font-semibold {{ $available ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600' }}">
                                        {{ $available ? 'Tersedia' : 'Tidak tersedia' }}
                                    </span>
                                </div>

                                @if(! $available)
                                    <p class="text-[11px] text-red-500 mt-2">Buku ini tidak bisa diajukan sampai stoknya tersedia kembali.</p>
                                @endif

                                <div class="mt-3 flex items-center gap-2">
                                    <a href="{{ route('anggota.katalog.show', $item->book_id) }}"
                                       class="px-3 py-1.5 rounded-md text-[11px] font-medium border border-gray-200 text-gray-600 hover:bg-gray-50">
                                        Detail
                                    </a>

                                    <form method="POST" action="{{ route('anggota.cart.destroy', $item->book_id) }}"
                                          onsubmit="return confirm('Hapus buku ini dari keranjang?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="px-3 py-1.5 rounded-md text-[11px] font-medium border border-red-100 text-red-600 hover:bg-red-50">
                                            Hapus
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>

                <!-- Ringkasan -->
                <div>
                    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-5 lg:sticky lg:top-24">
                        <h2 class="text-sm font-semibold text-gray-900">Ringkasan Pengajuan</h2>

                        <div class="mt-4 space-y-2 text-sm">
                            <div class="flex items-center justify-between">
                                <span class="text-gray-500">Buku di keranjang</span>
                                <span class="text-gray-900">{{ $items->count() }}</span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span class="text-gray-500">Buku dipilih</span>
                                <span class="font-medium text-gray-900"><span x-text="selected.length">0</span> buku</span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span class="text-gray-500">Tidak tersedia</span>
                                <span class="text-red-600">{{ $items->count() - $availableIds->count() }}</span>
                            </div>
                        </div>

                        <p class="text-[11px] leading-relaxed text-gray-400 mt-4 pt-4 border-t border-gray-50">
                            Pengajuan akan diperiksa petugas. Stok buku baru berkurang setelah pengajuan disetujui.
                        </p>

                        <form id="submitForm" method="POST" action="{{ route('anggota.cart.submit') }}" @submit="submitting = true" class="mt-4">
                            @csrf
                            <button type="submit"
                                    :disabled="selected.length === 0 || submitting"
                                    class="w-full inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-md text-xs font-medium bg-gradient-to-r from-amber-600 to-orange-500 text-white hover:from-amber-700 hover:to-orange-600 disabled:bg-gray-100 disabled:text-gray-400 disabled:cursor-not-allowed transition">
                                <svg x-show="submitting" class="w-4 h-4 animate-spin" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"></path>
                                </svg>
                                <span x-text="submitting ? 'Memproses...' : 'Ajukan Peminjaman'">Ajukan Peminjaman</span>
                            </button>
                        </form>

                        <p x-show="selected.length === 0" class="text-[11px] text-amber-600 mt-2 text-center">
                            Pilih minimal satu buku yang tersedia.
                        </p>

                        <a href="{{ route('anggota.katalog.index') }}"
                           class="mt-2 w-full inline-flex items-center justify-center px-4 py-2.5 rounded-md text-xs font-medium border border-gray-200 text-gray-600 hover:bg-gray-50">
                            Tambah Buku Lain
                        </a>
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection
