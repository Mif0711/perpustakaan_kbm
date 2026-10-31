@extends('layouts.app')

@section('title', 'Status Peminjaman')
@section('header_title', 'Status Peminjaman Saya')

@section('content')
    <div class="mb-6">
        <h2 class="text-lg font-medium text-gray-800 mb-1">Status Peminjaman</h2>
        <p class="text-sm text-gray-500">Pantau status pengajuan dan peminjaman buku Anda</p>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <!-- Filter Status -->
    <form method="GET" action="{{ route('anggota.loans.index') }}" class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 rounded-lg mb-4 flex gap-2 items-center">
        <span class="text-xs text-gray-500">Filter:</span>
        <select name="status" class="px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800">
            <option value="">Semua Status</option>
            <option value="pending" @selected(request('status') == 'pending')>Menunggu Persetujuan</option>
            <option value="dipinjam" @selected(request('status') == 'dipinjam')>Sedang Dipinjam</option>
            <option value="terlambat" @selected(request('status') == 'terlambat')>Terlambat</option>
            <option value="dikembalikan" @selected(request('status') == 'dikembalikan')>Dikembalikan</option>
            <option value="rejected" @selected(request('status') == 'rejected')>Ditolak</option>
        </select>
        <button type="submit" class="bg-gray-800 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-700">Filter</button>
        <a href="{{ route('anggota.loans.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Reset</a>
    </form>

    @if($loans->count() > 0)
    <div class="space-y-4">
        @foreach($loans as $loan)
        <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-5">
            <div class="flex justify-between items-start mb-3">
                <div>
                    <p class="text-sm font-medium text-gray-900">{{ $loan->kode_pinjam }}</p>
                    <p class="text-xs text-gray-400 mt-0.5">Diajukan: {{ \Carbon\Carbon::parse($loan->created_at)->format('d M Y, H:i') }}</p>
                </div>
                <div>
                    @if($loan->status == 'pending')
                        <span class="px-3 py-1 text-xs rounded-md bg-yellow-50 text-yellow-600">Menunggu Persetujuan</span>
                    @elseif($loan->status == 'dipinjam')
                        <span class="px-3 py-1 text-xs rounded-md bg-blue-50 text-blue-600">Sedang Dipinjam</span>
                    @elseif($loan->status == 'terlambat')
                        <span class="px-3 py-1 text-xs rounded-md bg-red-50 text-red-600">Terlambat</span>
                    @elseif($loan->status == 'dikembalikan')
                        <span class="px-3 py-1 text-xs rounded-md bg-green-50 text-green-600">Dikembalikan</span>
                    @elseif($loan->status == 'rejected')
                        <span class="px-3 py-1 text-xs rounded-md bg-red-50 text-red-600">Ditolak</span>
                    @endif
                </div>
            </div>
            
            <div class="border-t border-gray-100 pt-3">
                <p class="text-xs text-gray-500 mb-2">Daftar Buku:</p>
                <ul class="space-y-1">
                    @foreach($loan->details as $detail)
                    <li class="text-sm text-gray-700 flex items-center">
                        <svg class="w-4 h-4 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253"></path></svg>
                        {{ $detail->book->judul }} <span class="text-gray-400 text-xs ml-1">({{ $detail->jumlah }}x)</span>
                    </li>
                    @endforeach
                </ul>
            </div>
            
            @if($loan->status == 'dipinjam' || $loan->status == 'terlambat')
            <div class="border-t border-gray-100 mt-3 pt-3 flex justify-between items-center text-xs">
                <div>
                    <span class="text-gray-400">Tanggal Pinjam:</span>
                    <span class="text-gray-700 font-medium ml-1">{{ \Carbon\Carbon::parse($loan->tanggal_pinjam)->format('d M Y') }}</span>
                </div>
                <div>
                    <span class="text-gray-400">Batas Kembali:</span>
                    <span class="text-gray-700 font-medium ml-1">{{ \Carbon\Carbon::parse($loan->tanggal_kembali)->format('d M Y') }}</span>
                </div>
            </div>
            @endif
            
            @if($loan->status == 'rejected' && $loan->rejected_reason)
            <div class="border-t border-gray-100 mt-3 pt-3">
                <p class="text-xs text-red-500"><strong>Alasan Ditolak:</strong> {{ $loan->rejected_reason }}</p>
            </div>
            @endif
            
            @if($loan->catatan)
            <div class="border-t border-gray-100 mt-3 pt-3">
                <p class="text-xs text-gray-500"><strong>Catatan Anda:</strong> {{ $loan->catatan }}</p>
            </div>
            @endif
        </div>
        @endforeach
    </div>
    
    <div class="mt-6">{{ $loans->links() }}</div>
    @else
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-12 text-center">
        <svg class="w-16 h-16 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
        <p class="text-sm text-gray-400 mb-4">Belum ada pengajuan peminjaman</p>
        <a href="{{ route('anggota.catalog') }}" class="inline-flex items-center text-xs text-gray-700 font-medium hover:text-gray-900">
            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16l-4-4m0 0l4-4m-4 4h18"></path></svg>
            Jelajahi Katalog Buku
        </a>
    </div>
    @endif
@endsection