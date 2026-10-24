@extends('layouts.app')

@section('title', 'Pengembalian Buku')
@section('header_title', 'Proses Pengembalian Buku')

@section('content')
    <p class="text-sm text-gray-500 mb-6">Daftar buku yang sedang dipinjam dan menunggu pengembalian.</p>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode Pinjam</th>
                    <th class="py-3 px-5 font-medium">Anggota</th>
                    <th class="py-3 px-5 font-medium">Tgl Pinjam</th>
                    <th class="py-3 px-5 font-medium">Batas Kembali</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($loans as $loan)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $loan->kode_pinjam }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $loan->member->nama ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ \Carbon\Carbon::parse($loan->tanggal_pinjam)->format('d M Y') }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ \Carbon\Carbon::parse($loan->tanggal_kembali)->format('d M Y') }}</td>
                    <td class="py-3 px-5 text-right">
                        <a href="{{ route('returns.process', $loan) }}" class="bg-gray-900 text-white px-3 py-1.5 rounded-md text-xs font-medium hover:bg-gray-800">Proses Kembali</a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="py-6 text-center text-gray-400">Tidak ada buku yang sedang dipinjam saat ini.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $loans->links() }}</div>
@endsection