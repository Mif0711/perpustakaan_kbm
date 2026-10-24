@extends('layouts.auth')

@section('content')
    <div class="text-center">
        <h1 class="text-2xl font-bold tracking-tight">Perpustakaan Digital</h1>
        <p class="mt-2 text-sm text-gray-500">Masuk sebagai anggota untuk melihat katalog dan keranjang buku</p>
    </div>

    @if(session('error'))
        <div class="p-3 text-sm text-red-600 bg-red-50 border border-red-100 rounded-md">
            {{ session('error') }}
        </div>
    @endif

    @if(session('success'))
        <div class="p-3 text-sm text-green-600 bg-green-50 border border-green-100 rounded-md">
            {{ session('success') }}
        </div>
    @endif

    @if ($errors->any())
        <div class="p-3 text-sm text-red-600 bg-red-50 border border-red-100 rounded-md">
            {{ $errors->first() }}
        </div>
    @endif

    <form method="POST" action="{{ route('anggota.login.post') }}" class="space-y-6">
        @csrf
        <div>
            <label for="login" class="block text-sm font-medium text-gray-700">Kode Anggota atau Email</label>
            <input type="text" id="login" name="login" value="{{ old('login') }}" required autofocus
                class="block w-full px-3 py-2 mt-1 border border-gray-200 rounded-md shadow-sm focus:ring-black focus:border-black focus:outline-none transition placeholder-gray-400"
                placeholder="MEM-0001 atau email@contoh.com">
        </div>

        <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <div class="mt-1">
                <x-password-field name="password" label="" :required="true" />
            </div>
        </div>

        <div class="flex items-center justify-between">
            <div class="flex items-center">
                <input type="checkbox" id="remember" name="remember" class="w-4 h-4 border-gray-300 rounded text-black focus:ring-black">
                <label for="remember" class="block ml-2 text-sm text-gray-700">Ingat saya</label>
            </div>
        </div>

        <div>
            <button type="submit"
                class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white bg-black border border-transparent rounded-md hover:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-black transition">
                Masuk sebagai Anggota
            </button>
        </div>
    </form>

    <div class="pt-5 border-t border-gray-100 text-center space-y-2">
        <p class="text-xs text-gray-400">Password awal anggota adalah <span class="font-medium text-gray-600">password</span> (bisa diganti petugas).</p>
        <a href="{{ route('login') }}" class="inline-block text-sm text-gray-600 hover:text-gray-900 underline underline-offset-4">
            Masuk sebagai Admin / Petugas
        </a>
    </div>
@endsection
