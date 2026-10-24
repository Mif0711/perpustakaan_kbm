@extends('layouts.app')

@section('title', 'Laporan Denda')
@section('header_title', 'Laporan Keuangan Denda')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Filter denda berdasarkan tanggal pembayaran</p>
        <button onclick="window.print()" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Print / PDF</button>
    </div>

    <form method="GET" action="{{ route('admin.reports.fines') }}" class="bg-white border border-gray-100 p-4 rounded-lg mb-4 flex gap-3 items-end printable-exclude">
        <div>
            <label class="block text-xs font-medium text-gray-500 mb-1">Dari Tanggal</label>
            <input type="date" name="start_date" value="{{ request('start_date') }}" class="px-3 py-2 border border-gray-200 rounded-md text-sm">
        </div>
        <div>
            <label class="block text-xs font-medium text-gray-500 mb-1">Sampai Tanggal</label>
            <input type="date" name="end_date" value="{{ request('end_date') }}" class="px-3 py-2 border border-gray-200 rounded-md text-sm">
        </div>
        <button type="submit" class="bg-gray-800 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-700 h-9">Filter</button>
        <a href="{{ route('admin.reports.fines') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50 h-9 flex items-center">Reset</a>
    </form>

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden printable">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode Denda</th>
                    <th class="py-3 px-5 font-medium">Anggota</th>
                    <th class="py-3 px-5 font-medium">Keterangan</th>
                    <th class="py-3 px-5 font-medium">Jumlah</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @php $total = 0; @endphp
                @forelse($fines as $fine)
                <tr>
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $fine->kode_denda }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $fine->member->nama ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $fine->keterangan }}</td>
                    <td class="py-3 px-5 text-gray-800 font-medium">Rp {{ number_format($fine->jumlah, 0, ',', '.') }}</td>
                    <td class="py-3 px-5">
                        @if($fine->status == 'lunas')
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Lunas</span>
                        @else
                            <span class="px-2 py-1 text-xs rounded-md bg-red-50 text-red-600">Belum Bayar</span>
                        @endif
                    </td>
                </tr>
                @php $total += $fine->jumlah; @endphp
                @empty
                <tr>
                    <td colspan="5" class="py-6 text-center text-gray-400">Tidak ada data denda.</td>
                </tr>
                @endforelse
            </tbody>
            <tfoot class="bg-gray-50">
                <tr>
                    <td colspan="3" class="py-3 px-5 text-right text-sm font-medium text-gray-700">Total Denda Terdata:</td>
                    <td colspan="2" class="py-3 px-5 text-sm font-bold text-gray-900">Rp {{ number_format($total, 0, ',', '.') }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
@endsection