<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $settings['nama_perpustakaan'] ?? 'Perpustakaan KBM' }} - @yield('title', 'Dashboard')</title>
    <script src="{{ asset('assets/tailwind.js') }}"></script>
    <script defer src="{{ asset('assets/alpine-collapse.min.js') }}"></script>
    <script defer src="{{ asset('assets/alpine.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/fonts.css') }}">
    <style type="text/tailwindcss">
        body { font-family: 'Plus Jakarta Sans', ui-sans-serif, system-ui, sans-serif; }
    </style>
    <style>
        /* Matikan tombol tampilkan sandi bawaan Microsoft Edge agar tidak dobel dengan tombol mata aplikasi */
        input[type="password"]::-ms-reveal,
        input[type="password"]::-ms-clear {
            display: none;
        }

        @media print {
            aside, header, .printable-exclude { display: none !important; }
            main { padding: 0 !important; background: white !important; }
            .printable { border: none !important; box-shadow: none !important; }
        }
    </style>
    <style type="text/tailwindcss">
        /* ====== Desain dasar aplikasi ====== */
        body {
            @apply bg-[#f7f1e7] text-slate-800 antialiased font-sans;
        }
        /* Kartu & panel */
        .card {
            @apply bg-white rounded-2xl border border-slate-100 shadow-sm;
        }
        /* Elemen form — dipasang elastis agar halaman lama ikut berubah rapi */
        input[type="text"], input[type="email"], input[type="number"], input[type="password"],
        input[type="search"], input[type="url"], input[type="tel"], input[type="date"],
        select, textarea {
            @apply w-full rounded-xl border border-amber-200/70 bg-white px-3.5 py-2.5 text-sm text-slate-800 placeholder:text-slate-400 shadow-sm outline-none transition
                hover:border-amber-300 focus:border-amber-500 focus:ring-2 focus:ring-amber-100;
        }
        .label { @apply block mb-1.5 text-xs font-semibold uppercase tracking-wide text-slate-400; }
        /* Tabel universal */
        table { @apply w-full text-sm; }
        thead { @apply bg-slate-50/80; }
        thead th { @apply px-4 py-3 text-left text-[11px] font-bold uppercase tracking-wider text-slate-400 whitespace-nowrap; }
        tbody td { @apply px-4 py-3 border-t border-slate-100 align-middle text-slate-600; }
        tbody tr:hover { @apply bg-amber-50/30 transition-colors; }
        /* Badge status */
        .badge { @apply inline-flex items-center gap-1 rounded-full px-2.5 py-0.5 text-[11px] font-bold; }
        /* Tombol utilitas (dipakai push tabel lama) */
        .btn { @apply inline-flex items-center justify-center gap-2 rounded-xl px-4 py-2.5 text-sm font-semibold transition select-none; }
        .btn-primary { @apply bg-gradient-to-r from-amber-700 to-orange-600 text-white shadow-md shadow-amber-700/25 hover:from-amber-800 hover:to-orange-700 active:scale-[.98]; }
        .btn-soft { @apply bg-amber-50 text-amber-700 hover:bg-amber-100; }
        .btn-ghost { @apply bg-slate-100 text-slate-600 hover:bg-slate-200; }
        .btn-danger { @apply bg-rose-50 text-rose-600 hover:bg-rose-100; }
        /* Sidebar */
        .sidebar-link {
            @apply flex items-center gap-3 rounded-xl px-3.5 py-2.5 text-sm font-medium text-slate-300 transition
                hover:bg-white/10 hover:text-white cursor-pointer;
        }
        .sidebar-link.active {
            @apply text-white bg-gradient-to-r from-amber-700 to-orange-600 shadow-lg shadow-amber-950/50;
        }
        .sidebar-link.active svg { @apply text-white; }
        .sidebar-sub {
            @apply block rounded-lg px-3 py-2 text-[13px] text-slate-300 transition hover:bg-white/5 hover:text-white;
        }
        .sidebar-sub.active { @apply text-white font-semibold bg-white/10; }
    </style>
</head>
<body>
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <aside class="w-72 flex-none bg-[#1f1409] bg-gradient-to-b from-[#33220f] via-[#241809] to-amber-950/80 flex flex-col sticky top-0 h-screen border-r border-white/5">
            <!-- Brand -->
            <div class="h-16 flex items-center justify-center gap-2.5 border-b border-white/5">
                <span class="w-9 h-9 rounded-xl bg-gradient-to-br from-amber-600 to-orange-500 flex items-center justify-center shadow-lg shadow-amber-600/30">
                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                </span>
                @php
                    $namaPerpus = $settings['nama_perpustakaan'] ?? 'Perpustakaan KBM';
                    $kataPertama = explode(' ', trim($namaPerpus))[0];
                    $sisaKata = trim(str_replace($kataPertama, '', $namaPerpus));
                @endphp
                <span class="text-lg font-extrabold tracking-tight text-white">
                    {{ $kataPertama }} <span class="text-amber-300 font-semibold">{{ $sisaKata }}</span>
                </span>
            </div>

            <nav class="flex-1 px-3 py-4 space-y-1 overflow-y-auto">
                <p class="px-3 pb-2 text-[10px] font-bold uppercase tracking-[.18em] text-slate-500">
                    {{ auth()->user()->role === 'admin' ? 'Menu Admin' : (auth()->user()->role === 'petugas' ? 'Menu Petugas' : 'Menu Anggota') }}
                </p>

                @if(auth()->user()->role === 'admin')
                    <!-- ============ MENU ADMIN ============ -->
                    <a href="{{ route('admin.dashboard') }}" class="sidebar-link {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        Dashboard
                    </a>

                    <!-- Master Data Dropdown -->
                    <div x-data="{ open: @json(request()->routeIs('admin.categories.*') || request()->routeIs('admin.authors.*') || request()->routeIs('admin.publishers.*') || request()->routeIs('admin.shelves.*') || request()->routeIs('admin.books.*')) }">
                        <button @click="open = !open" class="w-full flex items-center justify-between sidebar-link">
                            <span class="flex items-center gap-3">
                                <svg class="w-5 h-5 flex-none" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                                Master Data
                            </span>
                            <svg :class="open ? 'rotate-90' : ''" class="w-4 h-4 transition-transform" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
                        </button>
                        <div x-show="open" x-collapse class="mt-1 ml-4 space-y-0.5 border-l border-white/10 pl-3">
                            <a href="{{ route('admin.categories.index') }}" class="sidebar-sub {{ request()->routeIs('admin.categories.*') ? 'active' : '' }}">Kategori</a>
                            <a href="{{ route('admin.authors.index') }}" class="sidebar-sub {{ request()->routeIs('admin.authors.*') ? 'active' : '' }}">Penulis</a>
                            <a href="{{ route('admin.publishers.index') }}" class="sidebar-sub {{ request()->routeIs('admin.publishers.*') ? 'active' : '' }}">Penerbit</a>
                            <a href="{{ route('admin.shelves.index') }}" class="sidebar-sub {{ request()->routeIs('admin.shelves.*') ? 'active' : '' }}">Rak & Etalase</a>
                            <a href="{{ route('admin.books.index') }}" class="sidebar-sub {{ request()->routeIs('admin.books.*') ? 'active' : '' }}">Buku</a>
                        </div>
                    </div>

                    <a href="{{ route('admin.users.index') }}" class="sidebar-link {{ request()->routeIs('admin.users.index') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                        <span>Manajemen User</span>
                    </a>
                    <a href="{{ route('admin.users.pending') }}" class="sidebar-link {{ request()->routeIs('admin.users.pending') ? 'active' : '' }}">
                        <span class="flex items-center gap-3 flex-1">
                            <svg class="w-5 h-5 flex-none" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            <span>Persetujuan Akun</span>
                        </span>
                        @php $pendingAccountsCount = \App\Models\User::where('status', 'pending')->count(); @endphp
                        @if($pendingAccountsCount > 0)
                            <span class="inline-flex items-center justify-center min-w-[20px] h-5 px-1.5 rounded-full text-[11px] font-bold bg-gradient-to-r from-rose-500 to-orange-500 text-white shadow shadow-rose-500/30">{{ $pendingAccountsCount > 99 ? '99+' : $pendingAccountsCount }}</span>
                        @endif
                    </a>

                    <!-- Laporan Dropdown -->
                    <div x-data="{ open: @json(request()->routeIs('admin.reports.*')) }">
                        <button @click="open = !open" class="w-full flex items-center justify-between sidebar-link">
                            <span class="flex items-center gap-3">
                                <svg class="w-5 h-5 flex-none" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                                Laporan
                            </span>
                            <svg :class="open ? 'rotate-90' : ''" class="w-4 h-4 transition-transform" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path></svg>
                        </button>
                        <div x-show="open" class="mt-1 ml-4 space-y-0.5 border-l border-white/10 pl-3">
                            <a href="{{ route('admin.reports.books') }}" class="sidebar-sub {{ request()->routeIs('admin.reports.books') ? 'active' : '' }}">Laporan Buku</a>
                            <a href="{{ route('admin.reports.transactions') }}" class="sidebar-sub {{ request()->routeIs('admin.reports.transactions') ? 'active' : '' }}">Laporan Transaksi</a>
                            <a href="{{ route('admin.reports.fines') }}" class="sidebar-sub {{ request()->routeIs('admin.reports.fines') ? 'active' : '' }}">Laporan Denda</a>
                        </div>
                    </div>

                    <a href="{{ route('admin.settings.index') }}" class="sidebar-link {{ request()->routeIs('admin.settings.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path></svg>
                        Pengaturan
                    </a>

                @elseif(auth()->user()->role === 'petugas')
                    <!-- ============ MENU PETUGAS ============ -->
                    <a href="{{ route('petugas.dashboard') }}" class="sidebar-link {{ request()->routeIs('petugas.dashboard') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        Dashboard
                    </a>

                    <p class="px-3 pt-4 pb-2 text-[10px] font-bold uppercase tracking-[.18em] text-slate-500">Operasional</p>

                    <a href="{{ route('loans.requests') }}" class="sidebar-link {{ request()->routeIs('loans.requests') ? 'active' : '' }}">
                        <span class="flex items-center gap-3 flex-1">
                            <svg class="w-5 h-5 flex-none" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
                            <span>Pengajuan Masuk</span>
                        </span>
                        @php
                            $pendingCount = \App\Models\Loan::where('status', 'pending')->where('source', 'anggota')->count();
                        @endphp
                        @if($pendingCount > 0)
                            <span class="inline-flex items-center justify-center min-w-[20px] h-5 px-1.5 rounded-full text-[11px] font-bold bg-gradient-to-r from-rose-500 to-orange-500 text-white shadow shadow-rose-500/30">{{ $pendingCount }}</span>
                        @endif
                    </a>

                    <a href="{{ route('members.index') }}" class="sidebar-link {{ request()->routeIs('members.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                        Data Anggota
                    </a>
                    <a href="{{ route('loans.index') }}" class="sidebar-link {{ request()->routeIs('loans.index') || request()->routeIs('loans.create') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4"></path></svg>
                        Peminjaman Manual
                    </a>
                    <a href="{{ route('returns.index') }}" class="sidebar-link {{ request()->routeIs('returns.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-3 3m0 0l-3-3m3 3V4"></path></svg>
                        Pengembalian
                    </a>
                    <a href="{{ route('fines.index') }}" class="sidebar-link {{ request()->routeIs('fines.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Denda
                    </a>

                @elseif(auth()->user()->role === 'anggota')
                    <!-- ============ MENU ANGGOTA ============ -->
                    <a href="{{ route('anggota.dashboard') }}" class="sidebar-link {{ request()->routeIs('anggota.dashboard') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        Dashboard
                    </a>

                    <p class="px-3 pt-4 pb-2 text-[10px] font-bold uppercase tracking-[.18em] text-slate-500">Layanan</p>

                    <a href="{{ route('anggota.catalog') }}" class="sidebar-link {{ request()->routeIs('anggota.catalog') || request()->routeIs('anggota.books.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                        Katalog Buku
                    </a>
                    <a href="{{ route('anggota.cart.index') }}" class="sidebar-link {{ request()->routeIs('anggota.cart.*') ? 'active' : '' }}">
                        <span class="flex items-center gap-3 flex-1">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                            <span>Keranjang Saya</span>
                        </span>
                        @php
                            $cartCount = auth()->user()->cart ? auth()->user()->cart->items()->sum('jumlah') : 0;
                        @endphp
                        @if($cartCount > 0)
                            <span class="inline-flex items-center justify-center min-w-[20px] h-5 px-1.5 rounded-full text-[11px] font-bold bg-gradient-to-r from-rose-500 to-orange-500 text-white shadow shadow-rose-500/30">{{ $cartCount }}</span>
                        @endif
                    </a>
                    <a href="{{ route('anggota.loans.index') }}" class="sidebar-link {{ request()->routeIs('anggota.loans.index') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                        Status Peminjaman
                    </a>
                    <a href="{{ route('anggota.loans.history') }}" class="sidebar-link {{ request()->routeIs('anggota.loans.history') ? 'active' : '' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Riwayat Pinjam
                    </a>
                @endif

                <!-- Akun -->
                <p class="px-3 pt-4 pb-2 text-[10px] font-bold uppercase tracking-[.18em] text-slate-500">Akun</p>
                <form method="POST" action="{{ route('logout') }}" class="px-0">
                    @csrf
                    <button type="submit" class="sidebar-link w-full" title="Logout">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                        Keluar
                    </button>
                </form>
            </nav>

            <!-- Kartu user di bawah sidebar -->
            <div class="m-3 p-3 rounded-2xl bg-white/5 border border-white/10 flex items-center gap-3">
                <div class="w-9 h-9 rounded-full bg-gradient-to-br from-amber-500 to-orange-600 text-white flex items-center justify-center font-bold uppercase shadow-md shadow-amber-900/40 overflow-hidden flex-none">
                    @if(auth()->user()->foto)
                        <img src="{{ asset('storage/' . auth()->user()->foto) }}" class="w-full h-full object-cover">
                    @else
                        {{ substr(auth()->user()->name, 0, 1) }}
                    @endif
                </div>
                <div class="min-w-0">
                    <p class="text-sm font-semibold text-white truncate">{{ auth()->user()->name }}</p>
                    <p class="text-[11px] text-amber-300 capitalize">{{ auth()->user()->role }}</p>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col min-w-0">
            <!-- Header -->
            <header class="h-16 bg-white/80 backdrop-blur-md border-b border-slate-200/70 flex items-center justify-between px-6 sticky top-0 z-20">
                <h1 class="text-base font-bold text-slate-800"><span class="text-amber-700">#</span> @yield('title', 'Dashboard')</h1>
                <div class="flex items-center gap-3">
                    <div class="text-right hidden sm:block">
                        <p class="text-sm font-semibold text-slate-800 leading-tight">{{ auth()->user()->name }}</p>
                        <p class="text-[11px] text-slate-400 capitalize">{{ auth()->user()->role }}</p>
                    </div>
                    <div class="w-9 h-9 rounded-full bg-gradient-to-br from-amber-500 to-orange-600 text-white flex items-center justify-center font-bold uppercase shadow-md shadow-amber-200 overflow-hidden">
                        @if(auth()->user()->foto)
                            <img src="{{ asset('storage/' . auth()->user()->foto) }}" class="w-full h-full object-cover">
                        @else
                            {{ substr(auth()->user()->name, 0, 1) }}
                        @endif
                    </div>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="p-2 rounded-lg text-slate-400 hover:text-rose-500 hover:bg-rose-50 transition" title="Logout">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                        </button>
                    </form>
                </div>
            </header>

            <!-- Page Content -->
            <main class="flex-1 p-6 overflow-y-auto">
                @if(session('success'))
                    <div class="mb-4 rounded-xl border border-emerald-200 bg-emerald-50 text-emerald-700 text-sm font-medium px-4 py-3">✅ {{ session('success') }}</div>
                @endif
                @if(session('error'))
                    <div class="mb-4 rounded-xl border border-rose-200 bg-rose-50 text-rose-700 text-sm font-medium px-4 py-3">⚠️ {{ session('error') }}</div>
                @endif
                @if($errors->any())
                    <div class="mb-4 rounded-xl border border-rose-200 bg-rose-50 text-rose-700 text-sm px-4 py-3">
                        <ul class="list-disc list-inside space-y-0.5 font-medium">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                @yield('content')
            </main>
        </div>
    </div>
</body>
</html>
