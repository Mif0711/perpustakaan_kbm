@extends('layouts.auth')

@section('title', 'Daftar')

@section('content')
    <div class="mb-7">
        <h2 class="text-2xl font-extrabold tracking-tight text-slate-900">Daftar akun baru ✍️</h2>
        <p class="mt-1.5 text-sm text-slate-500">Akun baru diperiksa admin terlebih dahulu sebelum bisa login.</p>
    </div>

    <div class="bg-white rounded-2xl border border-slate-100 shadow-xl shadow-amber-100/60 p-6 sm:p-8 space-y-5">
        <div class="rounded-xl bg-amber-50 border border-amber-100 text-amber-800 text-xs font-medium p-3 flex gap-2">
            <span>ℹ️</span>
            <p>Role akun (Admin/Petugas/Anggota) ditentukan oleh admin saat validasi — bukan oleh pendaftar.</p>
        </div>

        @if (session('success'))
            <div class="rounded-xl bg-emerald-50 border border-emerald-100 text-emerald-600 text-xs font-semibold p-3">✅ {{ session('success') }}</div>
        @endif

        @if ($errors->any())
            <div class="rounded-xl bg-rose-50 border border-rose-100 text-rose-600 text-xs p-3">
                <ul class="list-disc list-inside space-y-0.5 font-semibold">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form method="POST" action="{{ route('register.post') }}" class="space-y-5">
            @csrf
            <div>
                <label for="name" class="block text-xs font-bold uppercase tracking-wide text-slate-400 mb-1.5">Nama Lengkap</label>
                <input type="text" id="name" name="name" value="{{ old('name') }}" placeholder="mis. Rangga Aditya" required autofocus>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label for="username" class="block text-xs font-bold uppercase tracking-wide text-slate-400 mb-1.5">Username</label>
                    <input type="text" id="username" name="username" value="{{ old('username') }}" placeholder="mis. rangga" required>
                </div>
                <div>
                    <label for="telepon" class="block text-xs font-bold uppercase tracking-wide text-slate-400 mb-1.5">Telpon <span class="text-slate-300 normal-case">(opsional)</span></label>
                    <input type="text" id="telepon" name="telepon" value="{{ old('telepon') }}" maxlength="20" placeholder="08xxxxxxxxxx">
                </div>
            </div>

            <div>
                <label for="email" class="block text-xs font-bold uppercase tracking-wide text-slate-400 mb-1.5">Email <span class="text-slate-300 normal-case">(opsional)</span></label>
                <input type="email" id="email" name="email" value="{{ old('email') }}" placeholder="kamu@contoh.com">
                <p class="text-[11px] text-slate-400 mt-1">Anggota tidak wajib ber-email — wajib hanya untuk akun Admin/Petugas.</p>
            </div>

            <div>
                <x-password-field name="password" label="Password" />
                <p class="text-[11px] text-slate-400 mt-1">Opsional. Tanpa password, akun baru bisa login setelah petugas menetapkannya.</p>
            </div>

            <div>
                <x-password-field name="password_confirmation" label="Konfirmasi Password" />
            </div>

            <button type="submit" class="btn-primary">
                Daftar Sekarang
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
            </button>
        </form>
    </div>

    <div class="mt-5 text-center">
        <p class="text-sm text-slate-500">Sudah punya akun?
            <a href="{{ route('login') }}" class="font-bold text-amber-700 hover:text-amber-800">Masuk di sini</a>
        </p>
    </div>
@endsection
