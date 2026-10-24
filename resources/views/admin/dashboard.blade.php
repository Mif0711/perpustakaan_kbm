@extends('layouts.app')

@section('title', 'Dashboard Admin')
@section('header_title', 'Dashboard Admin')

@section('content')
    <!-- Stats Cards -->
    // Kedua kartu akan menjadi latar dokumen
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4 mb-6">
        <!-- Card Total Buku -->
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <div class="flex flex-col">
                <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Total Buku</span>
                <span class="text-2xl font-light text-gray-900 mt-2">{{ $totalBuku ?? 0 }}</span>
                <span class="text-xs text-gray-400 mt-1">Eksemplar</span>
            </div>
        </div>
        <!-- Card Total Anggota -->
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <div class="flex flex-col">
                <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Total Anggota</span>
                <span class="text-2xl font-light text-gray-900 mt-2">{{ $totalAnggota ?? 0 }}</span>
                <span class="text-xs text-gray-400 mt-1">Anggota Terdaftar</span>
            </div>
        </div>
        <!-- Card Buku Dipinjam -->
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <div class="flex flex-col">
                <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Sedang Dipinjam</span>
                <span class="text-2xl font-light text-gray-900 mt-2">{{ $bukuDipinjam ?? 0 }}</span>
                <span class="text-xs text-gray-400 mt-1">Transaksi Aktif</span>
            </div>
        </div>
        <!-- Card Denda Belum Lunas -->
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <div class="flex flex-col">
                <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Denda Tertunggak</span>
                <span class="text-2xl font-light text-gray-900 mt-2">Rp {{ number_format($dendaBelumLunas ?? 0, 0, ',', '.') }}</span>
                <span class="text-xs text-gray-400 mt-1">Belum Dibayar</span>
            </div>
        </div>
        <!-- Card Akun Menunggu Persetujuan -->
        <a href="{{ route('admin.users.pending') }}" class="border p-5 rounded-lg transition-colors {{ ($menungguPersetujuan ?? 0) > 0 ? 'bg-yellow-50/60 border-yellow-200 hover:border-yellow-300' : 'bg-white border-gray-100 hover:border-gray-300' }}">
            <div class="flex flex-col">
                <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Validasi Akun</span>
                <span class="text-2xl font-light {{ ($menungguPersetujuan ?? 0) > 0 ? 'text-yellow-600' : 'text-gray-900' }} mt-2">{{ $menungguPersetujuan ?? 0 }}</span>
                <span class="text-xs text-gray-400 mt-1">{{ ($menungguPersetujuan ?? 0) > 0 ? 'Menunggu Persetujuan' : 'Tidak ada yang menunggu' }}</span>
            </div>
        </a>
    </div>

    <!-- Recent Activities -->
    <div class="bg-white border border-gray-100 rounded-lg">
        <div class="px-5 py-4 border-b border-gray-100">
            <h3 class="text-sm font-medium text-gray-700">Aktivitas Peminjaman Terbaru</h3>
        </div>
        <div class="p-5">
            <div class="space-y-4">
                @forelse ($aktivitasTerbaru ?? [] as $item)
                    <div class="flex items-start justify-between border-b border-gray-50 pb-3 last:border-0 last:pb-0">
                        <div>
                            <p class="text-sm text-gray-800">{{ $item->member->nama ?? 'N/A' }}</p>
                            <p class="text-xs text-gray-400">Kode: {{ $item->kode_pinjam }}</p>
                        </div>
                        <span class="text-xs px-2 py-1 bg-gray-50 text-gray-500 rounded-md">{{ $item->status }}</span>
                    </div>
                @empty
                    <p class="text-sm text-gray-400 text-center py-4">Belum ada aktivitas</p>
                @endforelse
            </div>
        </div>
    </div>
@endsection