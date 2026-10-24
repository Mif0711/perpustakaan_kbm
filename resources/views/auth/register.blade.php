@extends('layouts.auth')

@section('content')
    <div class="mt-4 bg-blue-50 border border-blue-100 text-blue-600 text-xs p-3 rounded-md">
        <p>ℹ️ Setiap akun baru harus menunggu pemeriksaan dan persetujuan Admin. Role akun (Admin/Petugas/Anggota) akan ditentukan oleh Admin, bukan oleh pendaftar.</p>
    </div>

    <div class="text-center">
        <h2 class="text-2xl font-light tracking-tight text-gray-900">Daftar Akun Baru</h2>
        <p class="mt-2 text-sm text-gray-400">Akun akan diverifikasi oleh admin terlebih dahulu</p>
    </div>

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

    <form method="POST" action="{{ route('register.post') }}" class="space-y-5 mt-6">
        @csrf
        <div>
            <label for="name" class="block text-xs font-medium text-gray-500 mb-1">Nama Lengkap</label>
            <input type="text" id="name" name="name" value="{{ old('name') }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800 transition-colors" required autofocus>
        </div>
        
        <div>
            <label for="username" class="block text-xs font-medium text-gray-500 mb-1">Username</label>
            <input type="text" id="username" name="username" value="{{ old('username') }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800 transition-colors" required>
        </div>

        <div>
            <label for="email" class="block text-xs font-medium text-gray-500 mb-1">Email <span class="text-gray-300">(opsional)</span></label>
            <input type="email" id="email" name="email" value="{{ old('email') }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800 transition-colors">
            <p class="text-[11px] text-gray-400 mt-1">Anggota tidak wajib ber-email. Kosongkan bila tidak memiliki. Wajib diisi hanya untuk akun Admin/Petugas.</p>
        </div>
        
        <div>
            <label for="telepon" class="block text-xs font-medium text-gray-500 mb-1">Nomor Telepon <span class="text-gray-300">(opsional)</span></label>
            <input type="text" id="telepon" name="telepon" value="{{ old('telepon') }}" maxlength="20" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800 transition-colors">
        </div>

        <div>
            <x-password-field name="password" label="Password" />
            <p class="text-[11px] text-gray-400 mt-1">Opsional. Tanpa password akun tidak dapat login sampai petugas menetapkannya.</p>
        </div>

        <div>
            <x-password-field name="password_confirmation" label="Konfirmasi Password" />
        </div>

        <div>
            <button type="submit" class="w-full bg-gray-900 text-white py-2.5 rounded-md text-sm font-medium hover:bg-gray-800 transition-colors">
                Daftar Sekarang
            </button>
        </div>

        <!-- Link Login Saja (Tanpa Panduan) -->
        <div class="text-center pt-2 border-t border-gray-100 mt-4 pt-4">
            <p class="text-xs text-gray-400">Sudah punya akun? 
                <a href="{{ route('login') }}" class="text-gray-700 font-medium hover:text-gray-900">Masuk di sini</a>
            </p>
        </div>
    </form>
@endsection