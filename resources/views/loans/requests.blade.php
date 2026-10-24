@extends('layouts.app')

@section('title', 'Pengajuan Peminjaman')
@section('header_title', 'Pengajuan Masuk dari Anggota')

@section('content')
    <p class="text-sm text-gray-500 mb-6">Daftar pengajuan peminjaman dari anggota yang menunggu persetujuan Anda.</p>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">{{ session('error') }}</div>
    @endif

    @if($loans->count() > 0)
    <div class="space-y-4">
        @foreach($loans as $loan)
        <div class="bg-white border border-gray-100 rounded-lg p-5">
            <div class="flex justify-between items-start mb-3">
                <div>
                    <p class="text-sm font-medium text-gray-900">{{ $loan->kode_pinjam }}</p>
                    <p class="text-xs text-gray-400 mt-0.5">
                        Anggota: <strong>{{ $loan->member->nama ?? '-' }}</strong> ({{ $loan->member->kode_member ?? '-' }})
                    </p>
                    <p class="text-xs text-gray-400">Diajukan: {{ \Carbon\Carbon::parse($loan->created_at)->format('d M Y, H:i') }}</p>
                </div>
                <span class="px-3 py-1 text-xs rounded-md bg-yellow-50 text-yellow-600">Menunggu Persetujuan</span>
            </div>
            
            <div class="border-t border-gray-100 pt-3">
                <p class="text-xs text-gray-500 mb-2">Daftar Buku yang Diajukan:</p>
                <ul class="space-y-1 mb-3">
                    @foreach($loan->details as $detail)
                    <li class="text-sm text-gray-700 flex items-center justify-between bg-gray-50 px-3 py-2 rounded-md">
                        <span>
                            <svg class="w-4 h-4 inline mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253"></path></svg>
                            {{ $detail->book->judul }} 
                            <span class="text-gray-400 text-xs">({{ $detail->jumlah }}x)</span>
                        </span>
                        <span class="text-xs @if($detail->book->tersedia >= $detail->jumlah) text-green-600 @else text-red-600 @endif">
                            Stok: {{ $detail->book->tersedia }}
                        </span>
                    </li>
                    @endforeach
                </ul>
            </div>
            
            @if($loan->catatan)
            <div class="border-t border-gray-100 mt-2 pt-3 mb-3">
                <p class="text-xs text-gray-500"><strong>Catatan Anggota:</strong> "{{ $loan->catatan }}"</p>
            </div>
            @endif
            
            <!-- Action Buttons -->
            <div class="border-t border-gray-100 mt-3 pt-4 flex justify-end space-x-3">
                <!-- Form Approve -->
                <form action="{{ route('loans.approve', $loan) }}" method="POST" onsubmit="return confirm('Setujui pengajuan ini? Stok buku akan langsung berkurang.')">
                    @csrf
                    <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-green-700 inline-flex items-center">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        Setujui
                    </button>
                </form>
                
                <!-- Form Reject -->
                <form action="{{ route('loans.reject', $loan) }}" method="POST" onsubmit="return confirm('Tolak pengajuan ini?')">
                    @csrf
                    <input type="hidden" name="rejected_reason" value="Pengajuan tidak dapat disetujui saat ini" required>
                    <button type="submit" class="border border-red-200 text-red-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-red-50 inline-flex items-center">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                        Tolak
                    </button>
                </form>
            </div>
        </div>
        @endforeach
    </div>
    
    <div class="mt-6">{{ $loans->links() }}</div>
    @else
    <div class="bg-white border border-gray-100 rounded-lg p-12 text-center">
        <svg class="w-16 h-16 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <p class="text-sm text-gray-400">Tidak ada pengajuan yang menunggu persetujuan.</p>
    </div>
    @endif
@endsection