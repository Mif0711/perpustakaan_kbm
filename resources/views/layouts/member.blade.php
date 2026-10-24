<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $settings['nama_perpustakaan'] ?? 'Perpustakaan' }} - @yield('title', 'Katalog Buku')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-gray-50 text-gray-900 min-h-screen flex flex-col">
    @php
        $cartCount = auth('member')->check()
            ? \App\Models\CartItem::where('member_id', auth('member')->id())->count()
            : 0;
    @endphp

    <header class="bg-white border-b border-gray-200 sticky top-0 z-20">
        <div class="max-w-6xl mx-auto px-4 sm:px-6">
            <div class="h-16 flex items-center justify-between gap-3">
                <a href="{{ route('anggota.katalog.index') }}" class="flex items-center gap-2 min-w-0">
                    <span class="w-9 h-9 rounded-md bg-gray-900 text-white flex items-center justify-center flex-none">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                    </span>
                    <span class="truncate text-sm font-semibold text-gray-900">{{ $settings['nama_perpustakaan'] ?? 'Perpustakaan' }}</span>
                </a>

                <nav class="flex items-center gap-1 sm:gap-2">
                    <a href="{{ route('anggota.katalog.index') }}"
                       class="px-3 py-2 rounded-md text-xs sm:text-sm {{ request()->routeIs('anggota.katalog.*') ? 'bg-gray-900 text-white' : 'text-gray-600 hover:bg-gray-100' }}">
                        Katalog
                    </a>
                    <a href="{{ route('anggota.cart.index') }}"
                       class="relative flex items-center gap-2 px-3 py-2 rounded-md text-xs sm:text-sm {{ request()->routeIs('anggota.cart.*') ? 'bg-gray-900 text-white' : 'text-gray-600 hover:bg-gray-100' }}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                        <span class="hidden sm:inline">Keranjang</span>
                        <span class="min-w-[1.25rem] h-5 px-1 rounded-full bg-red-500 text-white text-[10px] font-semibold flex items-center justify-center">{{ $cartCount }}</span>
                    </a>
                </nav>

                <div class="flex items-center gap-2">
                    <div class="hidden sm:block text-right">
                        <p class="text-xs font-medium text-gray-900 truncate max-w-[12rem]">{{ auth('member')->user()->nama }}</p>
                        <p class="text-[10px] text-gray-400">{{ auth('member')->user()->kode_member }}</p>
                    </div>
                    <form method="POST" action="{{ route('anggota.logout') }}">
                        @csrf
                        <button type="submit" class="p-2 text-gray-500 hover:text-gray-900 transition" title="Keluar">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </header>

    <main class="flex-1 w-full max-w-6xl mx-auto px-4 sm:px-6 py-8">
        @if(session('success'))
            <div class="bg-green-50 border border-green-100 text-green-700 text-xs sm:text-sm p-3 rounded-md mb-5">{{ session('success') }}</div>
        @endif

        @if(session('error'))
            <div class="bg-red-50 border border-red-100 text-red-600 text-xs sm:text-sm p-3 rounded-md mb-5">{{ session('error') }}</div>
        @endif

        @if(session('info'))
            <div class="bg-amber-50 border border-amber-100 text-amber-700 text-xs sm:text-sm p-3 rounded-md mb-5">{{ session('info') }}</div>
        @endif

        @if($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-600 text-xs sm:text-sm p-3 rounded-md mb-5">
                <ul class="list-disc list-inside space-y-0.5">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @yield('content')
    </main>

    <footer class="py-6 text-center text-[11px] text-gray-400">
        &copy; {{ date('Y') }} {{ $settings['nama_perpustakaan'] ?? 'Perpustakaan' }} &middot; Area Anggota
    </footer>
</body>
</html>
