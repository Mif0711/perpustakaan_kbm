@extends('layouts.auth')

@section('title', 'Login')

@section('content')
    <div class="mb-7">
        <h2 class="text-2xl font-extrabold tracking-tight text-slate-900">Masuk ke akun 👋</h2>
        <p class="mt-1.5 text-sm text-slate-500">Gunakan username atau email yang terdaftar.</p>
    </div>

    <div class="bg-white rounded-2xl border border-slate-100 shadow-xl shadow-amber-100/60 p-6 sm:p-8 space-y-5">
        @if (session('error'))
            <div class="rounded-xl bg-rose-50 border border-rose-100 text-rose-600 text-xs font-semibold p-3">⚠️ {{ session('error') }}</div>
        @endif

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

        <form method="POST" action="{{ route('login.post') }}" class="space-y-5">
            @csrf
            <div>
                <label for="login" class="block text-xs font-bold uppercase tracking-wide text-slate-400 mb-1.5">Username atau Email</label>
                <input type="text" id="login" name="login" placeholder="mis. admin" class="" required autofocus>
            </div>

            <div>
                <x-password-field name="password" label="Password" :required="true" />
            </div>

            <button type="submit" class="btn-primary">
                Masuk
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
            </button>
        </form>
    </div>

    <div class="mt-5 text-center space-y-2.5">
        <p class="text-sm text-slate-500">Belum punya akun?
            <a href="{{ route('register') }}" class="font-bold text-amber-700 hover:text-amber-800">Daftar di sini</a>
        </p>
        <p>
            <a href="{{ route('panduan') }}" class="text-xs font-semibold text-slate-400 hover:text-slate-600 inline-flex items-center gap-1 transition">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                Panduan aplikasi
            </a>
        </p>
    </div>
@endsection
