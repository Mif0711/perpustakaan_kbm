@extends('layouts.app')

@section('title', 'Edit Kategori')
@section('header_title', 'Edit Kategori')

@section('content')
    <div class="bg-white border border-gray-100 rounded-lg p-6 max-w-2xl">
        <form action="{{ route('admin.categories.update', $category) }}" method="POST" class="space-y-5">
            @csrf @method('PUT')
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Nama Kategori *</label>
                <input type="text" name="nama_kategori" value="{{ old('nama_kategori', $category->nama_kategori) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Deskripsi</label>
                <textarea name="deskripsi" rows="4" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">{{ old('deskripsi', $category->deskripsi) }}</textarea>
            </div>
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Update</button>
                <a href="{{ route('admin.categories.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection