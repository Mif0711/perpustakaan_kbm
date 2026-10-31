@extends('layouts.app')

@section('title', 'Tambah Buku')
@section('header_title', 'Tambah Buku Baru')

@section('content')
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 max-w-3xl">
        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <ul>@foreach ($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        <form action="{{ route('admin.books.store') }}" method="POST" enctype="multipart/form-data" class="space-y-5">
            @csrf
            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div class="md:col-span-2">
                    <label class="block text-xs font-medium text-gray-500 mb-1">Judul Buku *</label>
                    <input type="text" name="judul" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">ISBN</label>
                    <input type="text" name="isbn" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Tahun Terbit *</label>
                    <input type="number" name="tahun_terbit" value="{{ date('Y') }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Kategori *</label>
                    <select name="category_id" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="">Pilih Kategori</option>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->nama_kategori }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Penulis *</label>
                    <select name="author_id" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="">Pilih Penulis</option>
                        @foreach($authors as $author)
                            <option value="{{ $author->id }}">{{ $author->nama_penulis }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Penerbit *</label>
                    <select name="publisher_id" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="">Pilih Penerbit</option>
                        @foreach($publishers as $publisher)
                            <option value="{{ $publisher->id }}">{{ $publisher->nama_penerbit }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Rak / Etalase</label>
                    <select name="shelf_id" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
                        <option value="">Tidak Ada</option>
                        @foreach($shelves as $shelf)
                            <option value="{{ $shelf->id }}">{{ $shelf->nama_rak }} ({{ $shelf->kode_rak }})</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Jumlah Stok *</label>
                    <input type="number" name="jumlah" value="1" min="0" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Cover Buku</label>
                    <input type="file" name="cover" class="w-full text-sm text-gray-500 file:mr-3 file:py-2 file:px-3 file:rounded-md file:border-0 file:text-xs file:font-medium file:bg-gray-100 file:text-gray-700 hover:file:bg-gray-200">
                </div>
                <div class="md:col-span-2">
                    <label class="block text-xs font-medium text-gray-500 mb-1">Deskripsi</label>
                    <textarea name="deskripsi" rows="4" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800"></textarea>
                </div>
            </div>
            
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Simpan</button>
                <a href="{{ route('admin.books.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection