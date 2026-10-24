@extends('layouts.app')

@section('title', 'Data Denda')
@section('header_title', 'Manajemen Denda Anggota')

@section('content')
    <p class="text-sm text-gray-500 mb-6">Daftar denda yang harus dibayarkan oleh anggota.</p>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">{{ session('error') }}</div>
    @endif

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode Denda</th>
                    <th class="py-3 px-5 font-medium">Anggota</th>
                    <th class="py-3 px-5 font-medium">Jumlah</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($fines as $fine)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $fine->kode_denda }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $fine->member->nama ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-800 font-medium">Rp {{ number_format($fine->jumlah, 0, ',', '.') }}</td>
                    <td class="py-3 px-5">
                        @if($fine->status == 'lunas')
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Lunas</span>
                        @else
                            <span class="px-2 py-1 text-xs rounded-md bg-red-50 text-red-600">Belum Bayar</span>
                        @endif
                    </td>
                    <td class="py-3 px-5 text-right space-x-2">
                        <a href="{{ route('fines.edit', $fine) }}" class="text-gray-500 hover:text-gray-900">Edit</a>
                        <a href="{{ route('fines.history', $fine) }}" class="text-blue-500 hover:text-blue-700">History</a>
                        @if($fine->status == 'belum_bayar')
                        <form action="{{ route('fines.pay', $fine) }}" method="POST" class="inline-block" onsubmit="return confirm('Tandai denda ini sebagai LUNAS?')">
                            @csrf
                            @method('PATCH')
                            <button type="submit" class="text-green-500 hover:text-green-700">Lunaskan</button>
                        </form>
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="py-6 text-center text-gray-400">Tidak ada data denda.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $fines->links() }}</div>
@endsection