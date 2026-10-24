@extends('layouts.app')

@section('title', 'Tambah Rak')
@section('header_title', 'Tambah Rak Baru')

@section('content')
    <div class="bg-white border border-gray-100 rounded-lg p-6 max-w-2xl">
        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <ul>@foreach ($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        <form action="{{ route('admin.shelves.store') }}" method="POST" class="space-y-5">
            @csrf
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Nama Rak *</label>
                <input type="text" name="nama_rak" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Tipe *</label>
                    <select name="tipe" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="rak">Rak</option>
                        <option value="etalase">Etalase</option>
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Kapasitas *</label>
                    <input type="number" name="kapasitas" min="0" value="0" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Lokasi</label>
                <input type="text" name="lokasi" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Deskripsi</label>
                <textarea name="deskripsi" rows="3" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800"></textarea>
            </div>
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Simpan</button>
                <a href="{{ route('admin.shelves.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection