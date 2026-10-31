@extends('layouts.app')

@section('title', 'Edit Denda')
@section('header_title', 'Edit Data Denda')

@section('content')
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 max-w-2xl">
        <div class="mb-6 pb-4 border-b border-gray-100">
            <h3 class="text-sm font-medium text-gray-800">Kode: {{ $fine->kode_denda }}</h3>
            <p class="text-xs text-gray-500 mt-1">Anggota: {{ $fine->member->nama ?? '-' }}</p>
        </div>

        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <ul>@foreach ($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        <form action="{{ route('fines.update', $fine) }}" method="POST" class="space-y-5">
            @csrf
            @method('PUT')
            
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Jumlah Denda (Rp) *</label>
                <input type="number" name="jumlah" value="{{ old('jumlah', $fine->jumlah) }}" min="0" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                <p class="text-xs text-gray-400 mt-1">Jika diubah jadi 0, status otomatis menjadi "Lunas".</p>
            </div>

            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Keterangan</label>
                <textarea name="keterangan" rows="3" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">{{ old('keterangan', $fine->keterangan) }}</textarea>
            </div>

            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Alasan Perubahan *</label>
                <input type="text" name="alasan_perubahan" value="{{ old('alasan_perubahan') }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" placeholder="Misal: Negosiasi denda, Keringanan, dll" required>
                <p class="text-xs text-gray-400 mt-1">Alasan ini akan dicatat di history denda.</p>
            </div>
            
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Simpan Perubahan</button>
                <a href="{{ route('fines.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection