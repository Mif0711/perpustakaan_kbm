@extends('layouts.app')

@section('title', 'Edit Rak')
@section('header_title', 'Edit Rak')

@section('content')
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 max-w-2xl">
        <form action="{{ route('admin.shelves.update', $shelf) }}" method="POST" class="space-y-5">
            @csrf @method('PUT')
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Nama Rak *</label>
                <input type="text" name="nama_rak" value="{{ old('nama_rak', $shelf->nama_rak) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Tipe *</label>
                    <select name="tipe" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="rak" @selected(old('tipe', $shelf->tipe) == 'rak')>Rak</option>
                        <option value="etalase" @selected(old('tipe', $shelf->tipe) == 'etalase')>Etalase</option>
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Kapasitas *</label>
                    <input type="number" name="kapasitas" min="0" value="{{ old('kapasitas', $shelf->kapasitas) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Lokasi</label>
                <input type="text" name="lokasi" value="{{ old('lokasi', $shelf->lokasi) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Deskripsi</label>
                <textarea name="deskripsi" rows="3" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">{{ old('deskripsi', $shelf->deskripsi) }}</textarea>
            </div>
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Update</button>
                <a href="{{ route('admin.shelves.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection