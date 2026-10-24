@extends('layouts.app')

@section('title', 'Dashboard Petugas')
@section('header_title', 'Dashboard Petugas')

@section('content')
    <!-- Quick Actions -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <a href="{{ route('loans.create') }}" class="bg-white border border-gray-100 p-5 rounded-lg hover:bg-gray-50 transition-colors flex items-center justify-between">
            <span class="text-sm font-medium text-gray-700">Input Peminjaman</span>
            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
        </a>
        <a href="{{ route('returns.index') }}" class="bg-white border border-gray-100 p-5 rounded-lg hover:bg-gray-50 transition-colors flex items-center justify-between">
            <span class="text-sm font-medium text-gray-700">Proses Pengembalian</span>
            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
        </a>
        <a href="{{ route('members.create') }}" class="bg-white border border-gray-100 p-5 rounded-lg hover:bg-gray-50 transition-colors flex items-center justify-between">
            <span class="text-sm font-medium text-gray-700">Tambah Anggota</span>
            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
        </a>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Buku Sedang Dipinjam</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">{{ $bukuDipinjam ?? 0 }}</span>
                <span class="text-xs text-gray-400 ml-2 mb-1">Transaksi</span>
            </div>
        </div>
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Anggota Aktif</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">{{ $totalAnggota ?? 0 }}</span>
                <span class="text-xs text-gray-400 ml-2 mb-1">Orang</span>
            </div>
        </div>
        <div class="bg-white border border-gray-100 p-5 rounded-lg">
            <span class="text-xs text-gray-400 font-medium uppercase tracking-wider">Denda Belum Lunas</span>
            <div class="flex items-end mt-2">
                <span class="text-2xl font-light text-gray-900">Rp {{ number_format($dendaBelumLunas ?? 0, 0, ',', '.') }}</span>
            </div>
        </div>
    </div>

    <!-- Recent Activities -->
    <div class="bg-white border border-gray-100 rounded-lg">
        <div class="px-5 py-4 border-b border-gray-100">
            <h3 class="text-sm font-medium text-gray-700">Transaksi Terbaru</h3>
        </div>
        <div class="p-5">
            <div class="space-y-4">
                @forelse ($aktivitasTerbaru ?? [] as $item)
                    <div class="flex items-start justify-between border-b border-gray-50 pb-3 last:border-0 last:pb-0">
                        <div>
                            <p class="text-sm text-gray-800">{{ $item->member->nama ?? 'N/A' }}</p>
                            <p class="text-xs text-gray-400">Batas Kembali: {{ \Carbon\Carbon::parse($item->tanggal_kembali)->format('d M Y') }}</p>
                        </div>
                        <span class="text-xs px-2 py-1 bg-gray-50 text-gray-500 rounded-md">{{ $item->status }}</span>
                    </div>
                @empty
                    <p class="text-sm text-gray-400 text-center py-4">Belum ada transaksi hari ini</p>
                @endforelse
            </div>
        </div>
    </div>
@endsection