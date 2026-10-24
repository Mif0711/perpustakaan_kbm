<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $settings['nama_perpustakaan'] ?? config('app.name', 'Perpus Zabitsa') }} - @yield('title', 'Dashboard')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        /* Matikan tombol tampilkan sandi bawaan Microsoft Edge agar tidak dobel dengan tombol mata aplikasi */
        input[type="password"]::-ms-reveal,
        input[type="password"]::-ms-clear {
            display: none;
        }
        .sidebar-link.active { background-color: #111827; color: #ffffff; }
        .sidebar-link.active svg { color: #ffffff; }
        
        @media print {
            aside, header, .printable-exclude { display: none !important; }
            main { padding: 0 !important; background: white !important; }
            .printable { border: none !important; box-shadow: none !important; }
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-900">
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <aside class="w-64 bg-white border-r border-gray-200 flex flex-col">
            <div class="h-16 flex items-center justify-center border-b border-gray-200">
                @php
                    $namaPerpus = $settings['nama_perpustakaan'] ?? 'Perpus Zabitsa';
                    $kataPertama = explode(' ', trim($namaPerpus))[0];
                    $sisaKata = trim(str_replace($kataPertama, '', $namaPerpus));
                @endphp
                <span class="text-xl font-bold tracking-tight">
                    {{ $kataPertama }}
                    @if($sisaKata) <span class="text-gray-400">{{ $sisaKata }}</span> @endif
                </span>
            </div>
            <nav class="flex-1 p-4 space-y-1 overflow-y-auto">
                
                @if(auth()->user()->role === 'admin')
                    <!-- ============ MENU ADMIN ============ -->
                    <a href="{{ route('admin.dashboard') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        Dashboard
                    </a>

                    <!-- Master Data Dropdown -->
                    <div x-data="{ open: @json(request()->routeIs('admin.categories.*') || request()->routeIs('admin.authors.*') || request()->routeIs('admin.publishers.*') || request()->routeIs('admin.shelves.*') || request()->routeIs('admin.books.*')) }">
                        <button @click="open = !open" class="w-full flex items-center justify-between px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100">
                            <span class="flex items-center">
                                <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                                Master Data
                            </span>
                            <svg :class="open ? 'rotate-90' : ''" class="w-4 h-4 transition-transform" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                        </button>
                        <div x-show="open" class="mt-1 ml-3 space-y-1 border-l border-gray-100 pl-3">
                            <a href="{{ route('admin.categories.index') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.categories.*') ? 'text-gray-900 font-medium' : '' }}">Kategori</a>
                            <a href="{{ route('admin.authors.index') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.authors.*') ? 'text-gray-900 font-medium' : '' }}">Penulis</a>
                            <a href="{{ route('admin.publishers.index') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.publishers.*') ? 'text-gray-900 font-medium' : '' }}">Penerbit</a>
                            <a href="{{ route('admin.shelves.index') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.shelves.*') ? 'text-gray-900 font-medium' : '' }}">Rak & Etalase</a>
                            <a href="{{ route('admin.books.index') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.books.*') ? 'text-gray-900 font-medium' : '' }}">Buku</a>
                        </div>
                    </div>

                    <a href="{{ route('admin.users.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('admin.users.index') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                        Manajemen User
                    </a>
                    <a href="{{ route('admin.users.pending') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('admin.users.pending') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <span>Persetujuan Akun</span>
                        @php $pendingAccountsCount = \App\Models\User::where('status', 'pending')->count(); @endphp
                        @if($pendingAccountsCount > 0)
                            <span class="ml-auto inline-flex items-center justify-center min-w-[20px] h-5 px-1.5 rounded-full text-[11px] font-medium bg-red-100 text-red-600">{{ $pendingAccountsCount > 99 ? '99+' : $pendingAccountsCount }}</span>
                        @endif
                    </a>
                    
                    <!-- Laporan Dropdown -->
                    <div x-data="{ open: @json(request()->routeIs('admin.reports.*')) }">
                        <button @click="open = !open" class="w-full flex items-center justify-between px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100">
                            <span class="flex items-center">
                                <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                                Laporan
                            </span>
                            <svg :class="open ? 'rotate-90' : ''" class="w-4 h-4 transition-transform" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                        </button>
                        <div x-show="open" class="mt-1 ml-3 space-y-1 border-l border-gray-100 pl-3">
                            <a href="{{ route('admin.reports.books') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.reports.books') ? 'text-gray-900 font-medium' : '' }}">Laporan Buku</a>
                            <a href="{{ route('admin.reports.transactions') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.reports.transactions') ? 'text-gray-900 font-medium' : '' }}">Laporan Transaksi</a>
                            <a href="{{ route('admin.reports.fines') }}" class="block px-4 py-2 text-sm rounded-md text-gray-500 hover:bg-gray-100 hover:text-gray-900 {{ request()->routeIs('admin.reports.fines') ? 'text-gray-900 font-medium' : '' }}">Laporan Denda</a>
                        </div>
                    </div>

                    <a href="{{ route('admin.settings.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('admin.settings.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path></svg>
                        Pengaturan
                    </a>
                
                @elseif(auth()->user()->role === 'petugas')
                    <!-- ============ MENU PETUGAS ============ -->
                    <a href="{{ route('petugas.dashboard') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('petugas.dashboard') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        Dashboard
                    </a>

                    <div class="pt-4">
                        <p class="px-4 text-xs font-semibold text-gray-400 uppercase mb-2">Operasional</p>
                    </div>
                    
                    <a href="{{ route('loans.requests') }}" class="flex items-center justify-between px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('loans.requests') ? 'active' : '' }}">
                        <span class="flex items-center">
                            <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
                            Pengajuan Masuk
                        </span>
                        @php
                            $pendingCount = \App\Models\Loan::where('status', 'pending')->where('source', 'anggota')->count();
                        @endphp
                        @if($pendingCount > 0)
                            <span class="bg-red-500 text-white text-xs px-2 py-0.5 rounded-full">{{ $pendingCount }}</span>
                        @endif
                    </a>

                    <a href="{{ route('members.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('members.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                        Data Anggota
                    </a>
                    <a href="{{ route('loans.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('loans.index') || request()->routeIs('loans.create') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4"></path></svg>
                        Peminjaman Manual
                    </a>
                    <a href="{{ route('returns.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('returns.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-3 3m0 0l-3-3m3 3V4"></path></svg>
                        Pengembalian
                    </a>
                    <a href="{{ route('fines.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('fines.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Denda
                    </a>
                
                @elseif(auth()->user()->role === 'anggota')
                    <!-- ============ MENU ANGGOTA ============ -->
                    <a href="{{ route('anggota.dashboard') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('anggota.dashboard') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        Dashboard
                    </a>

                    <div class="pt-4">
                        <p class="px-4 text-xs font-semibold text-gray-400 uppercase mb-2">Layanan</p>
                    </div>

                    <a href="{{ route('anggota.catalog') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('anggota.catalog') || request()->routeIs('anggota.books.*') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                        Katalog Buku
                    </a>
                    <a href="{{ route('anggota.cart.index') }}" class="flex items-center justify-between px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('anggota.cart.*') ? 'active' : '' }}">
                        <span class="flex items-center">
                            <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                            Keranjang Saya
                        </span>
                        @php
                            $cartCount = auth()->user()->cart ? auth()->user()->cart->items()->sum('jumlah') : 0;
                        @endphp
                        @if($cartCount > 0)
                            <span class="bg-red-500 text-white text-xs px-2 py-0.5 rounded-full">{{ $cartCount }}</span>
                        @endif
                    </a>
                    <a href="{{ route('anggota.loans.index') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('anggota.loans.index') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                        Status Peminjaman
                    </a>
                    <a href="{{ route('anggota.loans.history') }}" class="flex items-center px-4 py-2 text-sm rounded-md text-gray-600 hover:bg-gray-100 sidebar-link {{ request()->routeIs('anggota.loans.history') ? 'active' : '' }}">
                        <svg class="w-5 h-5 mr-3" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Riwayat Pinjam
                    </a>
                @endif

            </nav>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            <!-- Header -->
            <header class="h-16 bg-white border-b border-gray-200 flex items-center justify-between px-6">
                <h1 class="text-lg font-medium text-gray-800">@yield('title', 'Dashboard')</h1>
                <div class="flex items-center space-x-4">
                    <div class="text-right">
                        <p class="text-sm font-medium text-gray-900">{{ auth()->user()->name }}</p>
                        <p class="text-xs text-gray-500 capitalize">{{ auth()->user()->role }}</p>
                    </div>
                    <div class="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center text-gray-600 font-bold uppercase overflow-hidden">
                        @if(auth()->user()->foto)
                            <img src="{{ asset('storage/' . auth()->user()->foto) }}" class="w-full h-full object-cover">
                        @else
                            {{ substr(auth()->user()->name, 0, 1) }}
                        @endif
                    </div>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="p-2 text-gray-500 hover:text-gray-900 transition" title="Logout">
                            <svg class="w-5 h-5" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                        </button>
                    </form>
                </div>
            </header>

            <!-- Page Content -->
            <main class="flex-1 p-6 overflow-y-auto bg-gray-50">
                @yield('content')
            </main>
        </div>
    </div>
</body>
</html>