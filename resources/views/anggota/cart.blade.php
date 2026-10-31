@extends('layouts.app')

@section('title', 'Keranjang Saya')

@section('content')
    <div class="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
            <h2 class="text-xl font-extrabold text-slate-900">Keranjang 🛒</h2>
            <p class="text-sm text-slate-500 mt-0.5">Daftar buku yang ingin kamu ajukan untuk dipinjam</p>
        </div>
        <a href="{{ route('anggota.catalog') }}" class="btn btn-soft">🔍 Jelajahi Katalog</a>
    </div>

    @if(session('success'))
        <div class="mb-4 rounded-xl border border-emerald-200 bg-emerald-50 text-emerald-700 text-sm font-medium px-4 py-3">✅ {{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="mb-4 rounded-xl border border-rose-200 bg-rose-50 text-rose-700 text-sm font-medium px-4 py-3">⚠️ {{ session('error') }}</div>
    @endif

    @if($cart->items->count() > 0)
        <!-- Info Status -->
        <div class="card p-4 mb-4 flex flex-wrap gap-4 items-center">
            <div class="w-10 h-10 rounded-xl bg-sky-100 text-sky-600 flex items-center justify-center text-lg flex-none">📊</div>
            <div class="flex flex-wrap gap-x-6 gap-y-1 text-sm">
                <p class="text-slate-500">Total di keranjang: <strong class="text-slate-900">{{ $totalItems }} buku</strong></p>
                <p class="text-slate-500">Sedang dipinjam: <strong class="text-slate-900">{{ $activeLoans }} buku</strong></p>
                <p class="text-slate-500">Batas maksimal: <strong class="text-slate-900">{{ $maxBooks }} buku</strong></p>
                @if(!$canCheckout)
                    <p class="text-rose-600 font-semibold">Belum bisa mengajukan — lengkapi syarat dulu ⚠️</p>
                @endif
            </div>
        </div>

        <!-- List Cart -->
        <div class="card overflow-hidden mb-4">
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="font-medium">Buku</th>
                        <th class="font-medium text-center">Stok</th>
                        <th class="font-medium text-center">Jumlah</th>
                        <th class="font-medium text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($cart->items as $item)
                    <tr>
                        <td>
                            <div class="flex items-center gap-3">
                                <div class="w-10 h-14 rounded-lg overflow-hidden flex-none bg-slate-100">
                                    @if($item->book->cover && file_exists(public_path('storage/'.$item->book->cover)))
                                        <img src="{{ asset('storage/' . $item->book->cover) }}" class="w-full h-full object-cover">
                                    @else
                                        <div class="w-full h-full flex items-center justify-center text-slate-300">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                                        </div>
                                    @endif
                                </div>
                                <div>
                                    <a href="{{ route('anggota.books.show', $item->book) }}" class="font-semibold text-slate-800 hover:text-amber-700">{{ $item->book->judul }}</a>
                                    <p class="text-[11px] text-slate-400 mt-0.5">{{ $item->book->kode_buku }} · {{ $item->book->author->nama_penulis ?? '-' }}</p>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            @if($item->book->tersedia > 0)
                                <span class="badge bg-emerald-100 text-emerald-600">{{ $item->book->tersedia }}</span>
                            @else
                                <span class="badge bg-rose-100 text-rose-600">Habis</span>
                            @endif
                        </td>
                        <td class="text-center font-semibold text-slate-700">{{ $item->jumlah }}</td>
                        <td class="text-right">
                            <form action="{{ route('anggota.cart.remove', $item) }}" method="POST" onsubmit="return confirm('Hapus buku ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger !px-3 !py-1.5 text-xs">🗑️ Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <!-- FORM CHECKOUT -->
        <div class="card p-5 mb-4">
            <form action="{{ route('anggota.checkout') }}" method="POST">
                @csrf
                <label class="label">Catatan untuk Petugas (opsional)</label>
                <textarea name="catatan" rows="2" class="mb-4" placeholder="mis. akan diambil pada jam istirahat..."></textarea>

                <div class="flex justify-end">
                    @if($canCheckout)
                        <button type="submit" class="btn btn-primary">
                            🚀 Ajukan Peminjaman
                        </button>
                    @else
                        <button disabled class="btn bg-slate-100 text-slate-400 cursor-not-allowed">Ajukan Peminjaman</button>
                    @endif
                </div>
            </form>
        </div>

        <!-- Kosongkan keranjang -->
        <div class="text-center">
            <form action="{{ route('anggota.cart.clear') }}" method="POST" onsubmit="return confirm('Kosongkan keranjang?')">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-ghost text-xs">🧹 Kosongkan Keranjang</button>
            </form>
        </div>

    @else
        <!-- Empty Cart -->
        <div class="card p-14 text-center">
            <div class="text-5xl mb-4">🛒</div>
            <p class="text-sm font-semibold text-slate-500 mb-4">Keranjangmu masih kosong</p>
            <a href="{{ route('anggota.catalog') }}" class="btn btn-primary w-fit">📚 Jelajahi Katalog Buku</a>
        </div>
    @endif
@endsection
