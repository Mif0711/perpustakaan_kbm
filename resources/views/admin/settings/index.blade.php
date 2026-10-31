@extends('layouts.app')

@section('title', 'Pengaturan Sistem')
@section('header_title', 'Pengaturan Sistem Perpustakaan')

@section('content')
    <div class="max-w-4xl">
        <p class="text-sm text-gray-500 mb-6">Konfigurasi dasar sistem perpustakaan dan perhitungan transaksi.</p>

        @if(session('success'))
            <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
        @endif

        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <ul>@foreach ($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        <form action="{{ route('admin.settings.update') }}" method="POST" class="space-y-6">
            @csrf
            @method('PUT')

            <!-- Identitas Perpustakaan -->
            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 pb-3 border-b border-gray-100">Identitas Perpustakaan</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                    <div class="md:col-span-2">
                        <label class="block text-xs font-medium text-gray-500 mb-1">Nama Perpustakaan *</label>
                        <input type="text" name="nama_perpustakaan" value="{{ $settings['nama_perpustakaan'] ?? '' }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-gray-500 mb-1">Email</label>
                        <input type="email" name="email_perpustakaan" value="{{ $settings['email_perpustakaan'] ?? '' }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-gray-500 mb-1">Telepon</label>
                        <input type="text" name="telepon_perpustakaan" value="{{ $settings['telepon_perpustakaan'] ?? '' }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
                    </div>
                    <div class="md:col-span-2">
                        <label class="block text-xs font-medium text-gray-500 mb-1">Alamat</label>
                        <textarea name="alamat_perpustakaan" rows="3" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">{{ $settings['alamat_perpustakaan'] ?? '' }}</textarea>
                    </div>
                </div>
            </div>

            <!-- Konfigurasi Transaksi -->
            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 pb-3 border-b border-gray-100">Konfigurasi Transaksi</h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
                    <div>
                        <label class="block text-xs font-medium text-gray-500 mb-1">Denda per Hari (Rp) *</label>
                        <input type="number" name="denda_per_hari" value="{{ $settings['denda_per_hari'] ?? 1000 }}" min="0" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <p class="text-xs text-gray-400 mt-1">Dikenakan jika telat mengembalikan</p>
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-gray-500 mb-1">Maksimal Hari Pinjam *</label>
                        <input type="number" name="maksimal_hari_pinjam" value="{{ $settings['maksimal_hari_pinjam'] ?? 7 }}" min="1" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <p class="text-xs text-gray-400 mt-1">Batas waktu pengembalian</p>
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-gray-500 mb-1">Maksimal Jumlah Buku *</label>
                        <input type="number" name="maksimal_jumlah_buku" value="{{ $settings['maksimal_jumlah_buku'] ?? 3 }}" min="1" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <p class="text-xs text-gray-400 mt-1">Per transaksi anggota</p>
                    </div>
                </div>
            </div>

            <div class="flex justify-end">
                <button type="submit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-6 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Simpan Pengaturan</button>
            </div>
        </form>
    </div>
@endsection