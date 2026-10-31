<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config('app.name', 'Perpustakaan KBM') }} - @yield('title', 'Login')</title>
    <script src="{{ asset('assets/tailwind.js') }}"></script>
    <script defer src="{{ asset('assets/alpine.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/fonts.css') }}">
    <style type="text/tailwindcss">
        body { @apply font-sans antialiased; }

        input[type="text"], input[type="email"], input[type="number"], input[type="password"],
        input[type="search"], input[type="url"], input[type="tel"], select, textarea {
            @apply w-full rounded-xl border border-amber-200/70 bg-amber-50/50 px-3.5 py-2.5 text-sm text-slate-800 placeholder:text-slate-400 outline-none transition shadow-sm
                hover:bg-white hover:border-amber-300 focus:bg-white focus:border-amber-500 focus:ring-2 focus:ring-amber-100;
        }
        .btn-primary {
            @apply w-full inline-flex items-center justify-center gap-2 rounded-xl px-4 py-3 text-sm font-bold text-white transition
                bg-gradient-to-r from-amber-700 to-orange-600 shadow-lg shadow-amber-700/30 hover:from-amber-800 hover:to-orange-700 active:scale-[.98];
        }
        /* Matikan tombol tampilkan sandi bawaan Microsoft Edge agar tidak dobel dengan tombol mata aplikasi */
        input[type="password"]::-ms-reveal,
        input[type="password"]::-ms-clear { display: none; }
    </style>
</head>
<body class="bg-stone-950 text-white min-h-screen p-0">
    <div class="min-h-screen flex flex-col lg:flex-row">
        <!-- Panel kiri: branding -->
        <div class="relative lg:w-[45%] p-10 lg:p-16 flex flex-col justify-between overflow-hidden bg-gradient-to-br from-amber-700 via-amber-900 to-stone-950">
            <!-- dekorasi -->
            <div class="absolute -top-24 -right-24 w-96 h-96 rounded-full bg-white/10 blur-2xl pointer-events-none"></div>
            <div class="absolute bottom-0 -left-20 w-72 h-72 rounded-full bg-amber-400/30 blur-3xl pointer-events-none"></div>
            <svg class="absolute inset-0 w-full h-full opacity-[0.06] pointer-events-none" viewBox="0 0 800 600" fill="none">
                <circle cx="650" cy="80" r="180" stroke="white" stroke-width="2"/>
                <circle cx="100" cy="500" r="120" stroke="white" stroke-width="2"/>
                <path d="M0 300h800M400 0v600" stroke="white" stroke-width="1.5"/>
            </svg>

            <div class="relative">
                <span class="inline-flex items-center gap-2 text-xs font-bold uppercase tracking-[.2em] bg-white/15 backdrop-blur px-3 py-1.5 rounded-full">
                    📚 Sekolah · Baca Sehat
                </span>
            </div>

            <div class="relative py-10">
                <h1 class="text-4xl lg:text-5xl font-extrabold leading-tight tracking-tight">
                    Pinjam buku, <br>tumbuh <span class="text-amber-300">cerita.</span> ✨
                </h1>
                <p class="mt-4 text-white/80 max-w-md text-sm leading-relaxed">
                    Aplikasi perpustakaan digital untuk siswa, guru & staff — katalog online,
                    pengajuan peminjaman, dan riwayat bacaan dalam satu tempat.
                </p>
                <div class="mt-8 flex gap-3 text-xs font-semibold">
                    <span class="bg-white/15 backdrop-blur px-3 py-1.5 rounded-full">Katalog Online</span>
                    <span class="bg-white/15 backdrop-blur px-3 py-1.5 rounded-full">Keranjang Pinjam</span>
                    <span class="bg-white/15 backdrop-blur px-3 py-1.5 rounded-full">Riwayat & Denda</span>
                </div>
            </div>

            <p class="relative text-xs text-white/60">&copy; {{ date('Y') }} {{ config('app.name', 'Perpustakaan KBM') }}</p>
        </div>

        <!-- Panel kanan: form -->
        <div class="flex-1 bg-[#f7f1e7] text-slate-800 flex items-center justify-center p-6 sm:p-10">
            <div class="w-full max-w-md">
                @yield('content')
            </div>
        </div>
    </div>
</body>
</html>
