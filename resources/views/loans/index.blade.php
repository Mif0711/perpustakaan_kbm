@extends('layouts.app')

@section('title', 'Data Peminjaman')
@section('header_title', 'Transaksi Peminjaman')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Daftar riwayat peminjaman buku</p>
        <a href="{{ route('loans.create') }}" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">+ Buat Peminjaman</a>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <form method="GET" action="{{ route('loans.index') }}" class="mb-4 flex gap-2">
        <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari kode pinjam atau nama anggota..." class="flex-1 px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
        <button type="submit" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-200">Cari</button>
        @if(request('search')) <a href="{{ route('loans.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Reset</a> @endif
    </form>

    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode Pinjam</th>
                    <th class="py-3 px-5 font-medium">Anggota</th>
                    <th class="py-3 px-5 font-medium">Petugas</th>
                    <th class="py-3 px-5 font-medium">Batas Kembali</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($loans as $loan)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $loan->kode_pinjam }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $loan->member->nama ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $loan->user->name ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ \Carbon\Carbon::parse($loan->tanggal_kembali)->format('d M Y') }}</td>
                    <td class="py-3 px-5">
                        @if($loan->status == 'diajukan')
                            <span class="px-2 py-1 text-xs rounded-md bg-amber-50 text-amber-600">Diajukan</span>
                        @elseif($loan->status == 'dipinjam')
                            <span class="px-2 py-1 text-xs rounded-md bg-blue-50 text-blue-600">Dipinjam</span>
                        @elseif($loan->status == 'dikembalikan')
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Dikembalikan</span>
                        @else
                            <span class="px-2 py-1 text-xs rounded-md bg-red-50 text-red-600">Terlambat</span>
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="py-6 text-center text-gray-400">
                        @if(request('search')) Hasil pencarian tidak ditemukan. @else Belum ada transaksi peminjaman. @endif
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $loans->links() }}</div>
@endsection