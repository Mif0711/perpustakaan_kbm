@extends('layouts.app')

@section('title', 'Dashboard Petugas')

@section('content')
    <!-- Aksi cepat -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <a href="{{ route('loans.create') }}" class="card p-5 flex items-center justify-between transition hover:-translate-y-0.5 hover:shadow-lg hover:border-amber-200 group">
            <span class="flex items-center gap-3 text-sm font-bold text-slate-700">
                <span class="w-10 h-10 rounded-xl bg-amber-100 text-amber-700 flex items-center justify-center text-lg">➕</span>
                Input Peminjaman
            </span>
            <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500 group-hover:translate-x-0.5 transition" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
        </a>
        <a href="{{ route('returns.index') }}" class="card p-5 flex items-center justify-between transition hover:-translate-y-0.5 hover:shadow-lg hover:border-amber-200 group">
            <span class="flex items-center gap-3 text-sm font-bold text-slate-700">
                <span class="w-10 h-10 rounded-xl bg-emerald-100 text-emerald-600 flex items-center justify-center text-lg">↩️</span>
                Proses Pengembalian
            </span>
            <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500 group-hover:translate-x-0.5 transition" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
        </a>
        <a href="{{ route('members.create') }}" class="card p-5 flex items-center justify-between transition hover:-translate-y-0.5 hover:shadow-lg hover:border-amber-200 group">
            <span class="flex items-center gap-3 text-sm font-bold text-slate-700">
                <span class="w-10 h-10 rounded-xl bg-sky-100 text-sky-600 flex items-center justify-center text-lg">🧑‍🎓</span>
                Tambah Anggota
            </span>
            <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500 group-hover:translate-x-0.5 transition" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
        </a>
    </div>

    <!-- Statistik -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-orange-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-orange-100 text-orange-600 flex items-center justify-center text-lg mb-3">🚀</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $bukuDipinjam ?? 0 }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Buku Sedang Dipinjam</div>
            </div>
        </div>
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-sky-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-sky-100 text-sky-600 flex items-center justify-center text-lg mb-3">🧑‍🎓</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $totalAnggota ?? 0 }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Anggota Aktif</div>
            </div>
        </div>
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-amber-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-amber-100 text-amber-600 flex items-center justify-center text-lg mb-3">💰</div>
                <div class="text-2xl font-extrabold text-slate-900">Rp {{ number_format($dendaBelumLunas ?? 0, 0, ',', '.') }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Denda Belum Lunas</div>
            </div>
        </div>
    </div>

    <!-- Transaksi terbaru -->
    <div class="card">
        <div class="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
            <h3 class="text-sm font-bold text-slate-700 flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-gradient-to-r from-amber-600 to-orange-500"></span>
                Transaksi Terbaru
            </h3>
            <a href="{{ route('loans.index') }}" class="text-xs font-bold text-amber-600 hover:text-amber-700">Lihat semua →</a>
        </div>
        <div class="p-5 space-y-3">
            @forelse ($aktivitasTerbaru ?? [] as $item)
                @php
                    $status = $item->status;
                    $batas = \Carbon\Carbon::parse($item->tanggal_kembali);
                    $terlambat = $status === 'dipinjam' && $batas->isPast();
                @endphp
                <div class="flex items-center justify-between rounded-xl bg-slate-50/70 hover:bg-amber-50/60 transition px-4 py-3">
                    <div class="flex items-center gap-3">
                        <span class="w-9 h-9 rounded-full bg-gradient-to-br from-amber-500 to-orange-600 text-white flex items-center justify-center font-bold uppercase text-xs flex-none">
                            {{ strtoupper(substr($item->member->nama ?? 'N', 0, 1)) }}
                        </span>
                        <div>
                            <p class="text-sm font-semibold text-slate-700">{{ $item->member->nama ?? 'N/A' }}</p>
                            <p class="text-[11px] {{ $terlambat ? 'text-rose-500 font-semibold' : 'text-slate-400' }}">
                                Batas kembali: {{ $batas->format('d M Y') }} {{ $terlambat ? '· TERLAMBAT ⚠️' : '' }}
                            </p>
                        </div>
                    </div>
                    <span class="badge {{ $status === 'dipinjam' ? 'bg-orange-100 text-orange-600' : ($status === 'pending' ? 'bg-amber-100 text-amber-600' : ($status === 'rejected' ? 'bg-rose-100 text-rose-600' : 'bg-emerald-100 text-emerald-600')) }}">
                        {{ ($status === 'dikembalikan' ? '✔ ' : ($status === 'pending' ? '⏳ ' : ($status === 'rejected' ? '✖ ' : '📖 '))) }} {{ $status }}
                    </span>
                </div>
            @empty
                <p class="text-sm text-slate-400 text-center py-8">Belum ada transaksi 🫥</p>
            @endforelse
        </div>
    </div>
@endsection
