@extends('layouts.app')

@section('title', 'History Denda')
@section('header_title', 'Riwayat Perubahan Denda')

@section('content')
    <div class="max-w-5xl">
        <div class="bg-white border border-gray-100 rounded-lg p-6 mb-6">
            <div class="flex justify-between items-center">
                <div>
                    <h3 class="text-sm font-medium text-gray-800">Kode: {{ $fine->kode_denda }}</h3>
                    <p class="text-xs text-gray-500 mt-1">Anggota: {{ $fine->member->nama ?? '-' }}</p>
                    <p class="text-xs text-gray-500">Kode Pinjam: {{ $fine->loan->kode_pinjam ?? '-' }}</p>
                </div>
                <div class="text-right">
                    <p class="text-xs text-gray-400">Jumlah Saat Ini</p>
                    <p class="text-base font-bold text-gray-900">Rp {{ number_format($fine->jumlah, 0, ',', '.') }}</p>
                    <p class="text-xs mt-1 {{ $fine->status == 'lunas' ? 'text-green-600' : 'text-red-600' }}">
                        Status: {{ $fine->status == 'lunas' ? 'Lunas' : 'Belum Bayar' }}
                    </p>
                </div>
            </div>
        </div>

        <div class="bg-white border border-gray-100 rounded-lg overflow-hidden">
            <div class="px-5 py-4 border-b border-gray-100 flex items-center justify-between">
                <h3 class="text-sm font-medium text-gray-700">History Perubahan Denda</h3>
                <p class="text-xs text-gray-400">{{ $fine->histories->count() }} Riwayat</p>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                        <tr>
                            <th class="py-3 px-5 text-left font-medium">Tanggal & Waktu</th>
                            <th class="py-3 px-5 text-left font-medium">Diubah Oleh</th>
                            <th class="py-3 px-5 text-left font-medium">Denda Sebelum</th>
                            <th class="py-3 px-5 text-left font-medium">Denda Setelah</th>
                            <th class="py-3 px-5 text-left font-medium">Status Sebelum</th>
                            <th class="py-3 px-5 text-left font-medium">Status Setelah</th>
                            <th class="py-3 px-5 text-left font-medium">Keterangan/Alasan</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-50">
                        @forelse($fine->histories as $history)
                        <tr class="hover:bg-gray-50 transition-colors">
                            <td class="py-3 px-5">
                                <p class="text-gray-800 font-medium">{{ \Carbon\Carbon::parse($history->created_at)->format('d/m/Y') }}</p>
                                <p class="text-xs text-gray-400">{{ \Carbon\Carbon::parse($history->created_at)->format('H:i:s') }}</p>
                            </td>
                            <td class="py-3 px-5">
                                <p class="text-gray-800">{{ $history->user->name ?? '-' }}</p>
                                <p class="text-xs text-gray-400 capitalize">{{ $history->user->role ?? '-' }}</p>
                            </td>
                            <td class="py-3 px-5 text-gray-600">Rp {{ number_format($history->jumlah_sebelum, 0, ',', '.') }}</td>
                            <td class="py-3 px-5 text-gray-900 font-medium">Rp {{ number_format($history->jumlah_sesudah, 0, ',', '.') }}</td>
                            <td class="py-3 px-5">
                                <span class="px-2 py-1 text-xs rounded-md {{ $history->status_sebelum == 'lunas' ? 'bg-green-50 text-green-600' : 'bg-red-50 text-red-600' }}">
                                    {{ $history->status_sebelum == 'lunas' ? 'Lunas' : 'Belum Bayar' }}
                                </span>
                            </td>
                            <td class="py-3 px-5">
                                <span class="px-2 py-1 text-xs rounded-md {{ $history->status_sesudah == 'lunas' ? 'bg-green-50 text-green-600' : 'bg-red-50 text-red-600' }}">
                                    {{ $history->status_sesudah == 'lunas' ? 'Lunas' : 'Belum Bayar' }}
                                </span>
                            </td>
                            <td class="py-3 px-5 text-gray-600 max-w-xs">
                                {{ $history->catatan ?? '-' }}
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="7" class="py-6 text-center text-gray-400">Belum ada riwayat perubahan pada denda ini.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        <div class="mt-6 flex space-x-3">
            <a href="{{ route('fines.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Kembali ke Daftar Denda</a>
        </div>
    </div>
@endsection