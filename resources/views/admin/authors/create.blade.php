@extends('layouts.app')

@section('title', 'Tambah Penulis')
@section('header_title', 'Tambah Penulis Baru')

@section('content')
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 max-w-2xl">
        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <ul>@foreach ($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        <form action="{{ route('admin.authors.store') }}" method="POST" class="space-y-5">
            @csrf
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Nama Penulis *</label>
                <input type="text" name="nama_penulis" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Biografi</label>
                <textarea name="biografi" rows="4" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800"></textarea>
            </div>
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Simpan</button>
                <a href="{{ route('admin.authors.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection