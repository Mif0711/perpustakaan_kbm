@extends('layouts.app')

@section('title', 'Detail Pengembalian')
@section('header_title', 'Konfirmasi Pengembalian Buku')

@section('content')
    <div class="max-w-4xl">
        <div class="bg-white border border-gray-100 rounded-lg p-6 mb-6">
            <div class="flex justify-between items-center mb-4 pb-3 border-b border-gray-100">
                <div>
                    <h3 class="text-sm font-medium text-gray-800">Kode: {{ $loan->kode_pinjam }}</h3>
                    <p class="text-xs text-gray-500 mt-1">Anggota: {{ $loan->member->nama }} ({{ $loan->member->kode_member }})</p>
                </div>
                <div class="text-right">
                    <p class="text-xs text-gray-500">Tanggal Pinjam</p>
                    <p class="text-sm text-gray-800">{{ \Carbon\Carbon::parse($loan->tanggal_pinjam)->format('d M Y') }}</p>
                </div>
            </div>

            <div class="mb-4">
                <p class="text-xs font-medium text-gray-500 mb-2">Daftar Buku Dipinjam:</p>
                <ul class="space-y-2">
                    @foreach($loan->details as $detail)
                    <li class="text-sm text-gray-700 flex items-center">
                        <svg class="w-4 h-4 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253"></path></svg>
                        {{ $detail->book->judul }} ({{ $detail->book->kode_buku }})
                    </li>
                    @endforeach
                </ul>
            </div>

            <div class="bg-gray-50 p-4 rounded-md">
                <div class="flex justify-between items-center text-sm mb-2">
                    <span class="text-gray-500">Batas Pengembalian:</span>
                    <span class="text-gray-800 font-medium">{{ \Carbon\Carbon::parse($loan->tanggal_kembali)->format('d M Y') }}</span>
                </div>
                @if($terlambatHari > 0)
                <div class="flex justify-between items-center text-sm mb-2">
                    <span class="text-red-500">Terlambat:</span>
                    <span class="text-red-500 font-medium">{{ $terlambatHari }} Hari</span>
                </div>
                <div class="flex justify-between items-center text-sm pt-2 border-t border-red-100 mt-2">
                    <span class="text-red-600 font-medium">Total Denda:</span>
                    <span class="text-red-600 font-bold text-base">Rp {{ number_format($totalDenda, 0, ',', '.') }}</span>
                </div>
                @else
                <div class="flex justify-between items-center text-sm pt-2 border-t border-gray-100 mt-2">
                    <span class="text-green-600 font-medium">Status:</span>
                    <span class="text-green-600 font-bold text-base">Tepat Waktu (Tanpa Denda)</span>
                </div>
                @endif
            </div>
        </div>

        <form action="{{ route('returns.store', $loan) }}" method="POST" class="bg-white border border-gray-100 rounded-lg p-6">
            @csrf
            <div class="mb-4">
                <label class="block text-xs font-medium text-gray-500 mb-1">Catatan (Opsional)</label>
                <textarea name="catatan" rows="2" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" placeholder="Misal: Kondisi buku sedikit terlipat..."></textarea>
            </div>
            
            <div class="flex space-x-3 justify-end">
                <a href="{{ route('returns.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
                <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Konfirmasi Pengembalian</button>
            </div>
        </form>
    </div>
@endsection