@extends('layouts.app')

@section('title', 'Laporan Transaksi')
@section('header_title', 'Laporan Peminjaman & Pengembalian')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Filter transaksi berdasarkan tanggal</p>
        <button onclick="window.print()" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Print / PDF</button>
    </div>

    <form method="GET" action="{{ route('admin.reports.transactions') }}" class="bg-white border border-gray-100 p-4 rounded-lg mb-4 flex gap-3 items-end printable-exclude">
        <div>
            <label class="block text-xs font-medium text-gray-500 mb-1">Dari Tanggal</label>
            <input type="date" name="start_date" value="{{ request('start_date') }}" class="px-3 py-2 border border-gray-200 rounded-md text-sm">
        </div>
        <div>
            <label class="block text-xs font-medium text-gray-500 mb-1">Sampai Tanggal</label>
            <input type="date" name="end_date" value="{{ request('end_date') }}" class="px-3 py-2 border border-gray-200 rounded-md text-sm">
        </div>
        <button type="submit" class="bg-gray-800 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-700 h-9">Filter</button>
        <a href="{{ route('admin.reports.transactions') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50 h-9 flex items-center">Reset</a>
    </form>

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden printable">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode</th>
                    <th class="py-3 px-5 font-medium">Anggota</th>
                    <th class="py-3 px-5 font-medium">Tgl Pinjam</th>
                    <th class="py-3 px-5 font-medium">Batas Kembali</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($loans as $loan)
                <tr>
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $loan->kode_pinjam }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $loan->member->nama ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ \Carbon\Carbon::parse($loan->tanggal_pinjam)->format('d M Y') }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ \Carbon\Carbon::parse($loan->tanggal_kembali)->format('d M Y') }}</td>
                    <td class="py-3 px-5 capitalize">{{ $loan->status }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="py-6 text-center text-gray-400">Tidak ada data transaksi.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
@endsection