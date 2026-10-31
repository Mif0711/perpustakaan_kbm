@extends('layouts.app')

@section('title', 'Dashboard Admin')

@section('content')
    <!-- Kartu statistik -->
    <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-5 gap-4 mb-6">
        <!-- Total Buku -->
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-amber-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-amber-100 text-amber-700 flex items-center justify-center text-lg mb-3">📚</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $totalBuku ?? 0 }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Total Buku (Eksemplar)</div>
            </div>
        </div>
        <!-- Total Anggota -->
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-sky-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-sky-100 text-sky-600 flex items-center justify-center text-lg mb-3">🧑‍🎓</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $totalAnggota ?? 0 }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Anggota Terdaftar</div>
            </div>
        </div>
        <!-- Buku Dipinjam -->
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-orange-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-orange-100 text-orange-600 flex items-center justify-center text-lg mb-3">🚀</div>
                <div class="text-2xl font-extrabold text-slate-900">{{ $bukuDipinjam ?? 0 }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Sedang Dipinjam</div>
            </div>
        </div>
        <!-- Denda -->
        <div class="card p-5 relative overflow-hidden">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-amber-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-amber-100 text-amber-600 flex items-center justify-center text-lg mb-3">💰</div>
                <div class="text-2xl font-extrabold text-slate-900">Rp {{ number_format($dendaBelumLunas ?? 0, 0, ',', '.') }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">Denda Tertunggak</div>
            </div>
        </div>
        <!-- Validasi Akun -->
        <a href="{{ route('admin.users.pending') }}" class="card p-5 relative overflow-hidden transition hover:-translate-y-0.5 hover:shadow-lg {{ ($menungguPersetujuan ?? 0) > 0 ? 'ring-2 ring-amber-300' : '' }}">
            <div class="absolute -right-4 -top-4 w-20 h-20 rounded-full bg-yellow-100/60 blur-xl"></div>
            <div class="relative">
                <div class="w-10 h-10 rounded-xl bg-yellow-100 text-yellow-600 flex items-center justify-center text-lg mb-3">⏳</div>
                <div class="text-2xl font-extrabold {{ ($menungguPersetujuan ?? 0) > 0 ? 'text-amber-500' : 'text-slate-900' }}">{{ $menungguPersetujuan ?? 0 }}</div>
                <div class="text-xs font-semibold text-slate-400 mt-0.5">{{ ($menungguPersetujuan ?? 0) > 0 ? 'Menunggu persetujuan →' : 'Akun menunggu validasi' }}</div>
            </div>
        </a>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-5">
        <!-- Aktivitas terbaru -->
        <div class="card lg:col-span-2">
            <div class="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
                <h3 class="text-sm font-bold text-slate-700 flex items-center gap-2">
                    <span class="w-2 h-2 rounded-full bg-gradient-to-r from-amber-600 to-orange-500"></span>
                    Aktivitas Peminjaman Terbaru
                </h3>
            </div>
            <div class="p-5 space-y-3">
                @forelse ($aktivitasTerbaru ?? [] as $item)
                    <div class="flex items-center justify-between rounded-xl bg-slate-50/70 hover:bg-amber-50/60 transition px-4 py-3">
                        <div class="flex items-center gap-3">
                            <span class="w-9 h-9 rounded-full bg-gradient-to-br from-amber-500 to-orange-600 text-white flex items-center justify-center font-bold uppercase text-xs flex-none">
                                {{ strtoupper(substr($item->member->nama ?? 'N', 0, 1)) }}
                            </span>
                            <div>
                                <p class="text-sm font-semibold text-slate-700">{{ $item->member->nama ?? 'N/A' }}</p>
                                <p class="text-[11px] text-slate-400">Kode: {{ $item->kode_pinjam }}</p>
                            </div>
                        </div>
                        @php $status = $item->status; @endphp
                        <span class="badge {{ $status === 'dipinjam' ? 'bg-orange-100 text-orange-600' : ($status === 'pending' ? 'bg-amber-100 text-amber-600' : ($status === 'rejected' ? 'bg-rose-100 text-rose-600' : 'bg-emerald-100 text-emerald-600')) }}">
                            {{ ($status === 'dikembalikan' ? '✔ ' : ($status === 'pending' ? '⏳ ' : ($status === 'rejected' ? '✖ ' : '📖 '))) }} {{ $status }}
                        </span>
                    </div>
                @empty
                    <p class="text-sm text-slate-400 text-center py-8">Belum ada aktivitas 🫥</p>
                @endforelse
            </div>
        </div>

        <!-- Aksi cepat -->
        <div class="card p-5">
            <h3 class="text-sm font-bold text-slate-700 mb-4 flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-gradient-to-r from-amber-600 to-orange-500"></span>
                Aksi Cepat
            </h3>
            <div class="space-y-2.5">
                <a href="{{ route('admin.books.index') }}" class="flex items-center justify-between rounded-xl bg-slate-50 hover:bg-amber-50 hover:text-amber-800 px-4 py-3 transition text-sm font-semibold text-slate-600 group">
                    <span>📚 Kelola Buku</span>
                    <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
                </a>
                <a href="{{ route('members.index') }}" class="flex items-center justify-between rounded-xl bg-slate-50 hover:bg-amber-50 hover:text-amber-800 px-4 py-3 transition text-sm font-semibold text-slate-600 group">
                    <span>🧑‍🎓 Data Anggota</span>
                    <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
                </a>
                <a href="{{ route('loans.index') }}" class="flex items-center justify-between rounded-xl bg-slate-50 hover:bg-amber-50 hover:text-amber-800 px-4 py-3 transition text-sm font-semibold text-slate-600 group">
                    <span>📖 Transaksi Peminjaman</span>
                    <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
                </a>
                <a href="{{ route('admin.reports.transactions') }}" class="flex items-center justify-between rounded-xl bg-slate-50 hover:bg-amber-50 hover:text-amber-800 px-4 py-3 transition text-sm font-semibold text-slate-600 group">
                    <span>📊 Laporan Transaksi</span>
                    <svg class="w-4 h-4 text-slate-300 group-hover:text-amber-500" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
                </a>
            </div>
        </div>
    </div>
@endsection
