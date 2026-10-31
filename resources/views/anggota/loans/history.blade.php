@extends('layouts.app')

@section('title', 'Riwayat Peminjaman')
@section('header_title', 'Riwayat Peminjaman Saya')

@section('content')
    <div class="mb-6">
        <h2 class="text-lg font-medium text-gray-800 mb-1">Riwayat Peminjaman</h2>
        <p class="text-sm text-gray-500">Daftar buku yang sudah Anda kembalikan atau pengajuan yang ditolak</p>
    </div>

    @if($loans->count() > 0)
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode Pinjam</th>
                    <th class="py-3 px-5 font-medium">Buku</th>
                    <th class="py-3 px-5 font-medium">Tanggal Pinjam</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @foreach($loans as $loan)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $loan->kode_pinjam }}</td>
                    <td class="py-3 px-5">
                        <p class="text-gray-700">{{ $loan->details->count() }} buku</p>
                        <p class="text-xs text-gray-400 mt-0.5">
                            {{ $loan->details->first()->book->judul ?? '-' }}
                            @if($loan->details->count() > 1) +{{ $loan->details->count() - 1 }} lainnya @endif
                        </p>
                    </td>
                    <td class="py-3 px-5 text-gray-600">{{ \Carbon\Carbon::parse($loan->tanggal_pinjam)->format('d M Y') }}</td>
                    <td class="py-3 px-5">
                        @if($loan->status == 'dikembalikan')
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Dikembalikan</span>
                        @elseif($loan->status == 'rejected')
                            <span class="px-2 py-1 text-xs rounded-md bg-red-50 text-red-600">Ditolak</span>
                        @endif
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $loans->links() }}</div>
    @else
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-12 text-center">
        <svg class="w-16 h-16 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <p class="text-sm text-gray-400">Belum ada riwayat peminjaman</p>
    </div>
    @endif
@endsection