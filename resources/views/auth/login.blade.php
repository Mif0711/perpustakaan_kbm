@extends('layouts.auth')

@section('content')
    <div class="text-center">
        <h2 class="text-2xl font-light tracking-tight text-gray-900">Selamat Datang</h2>
        <p class="mt-2 text-sm text-gray-400">Silakan masuk ke akun Anda</p>
    </div>

    @if (session('error'))
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mt-4">
            {{ session('error') }}
        </div>
    @endif

    @if (session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mt-4">
            {{ session('success') }}
        </div>
    @endif

    @if ($errors->any())
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mt-4">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form method="POST" action="{{ route('login.post') }}" class="space-y-5 mt-6">
        @csrf
        <div>
            <label for="login" class="block text-xs font-medium text-gray-500 mb-1">Username atau Email</label>
            <input type="text" id="login" name="login" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800 transition-colors" required autofocus>
        </div>
        
        <div>
            <x-password-field name="password" label="Password" :required="true" />
        </div>

        <div>
            <button type="submit" class="w-full bg-gray-900 text-white py-2.5 rounded-md text-sm font-medium hover:bg-gray-800 transition-colors">
                Masuk
            </button>
        </div>

        <div class="text-center pt-2 border-t border-gray-100 mt-4 pt-4 space-y-2">
            <p class="text-xs text-gray-400">Belum punya akun? 
                <a href="{{ route('register') }}" class="text-gray-700 font-medium hover:text-gray-900">Daftar di sini</a>
            </p>
            <p>
                <a href="{{ route('panduan') }}" class="text-xs text-gray-500 hover:text-gray-900 inline-flex items-center">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    Lihat Panduan Aplikasi
                </a>
            </p>
        </div>
    </form>
@endsection