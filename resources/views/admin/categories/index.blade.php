@extends('layouts.app')

@section('title', 'Master Kategori')
@section('header_title', 'Data Kategori')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Daftar kategori buku perpustakaan</p>
        <a href="{{ route('admin.categories.create') }}" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">+ Tambah Kategori</a>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode</th>
                    <th class="py-3 px-5 font-medium">Nama Kategori</th>
                    <th class="py-3 px-5 font-medium">Deskripsi</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($categories as $category)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-500">{{ $category->kode_kategori }}</td>
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $category->nama_kategori }}</td>
                    <td class="py-3 px-5 text-gray-400">{{ $category->deskripsi ?? '-' }}</td>
                    <td class="py-3 px-5 text-right space-x-2">
                        <a href="{{ route('admin.categories.edit', $category) }}" class="text-gray-500 hover:text-gray-900">Edit</a>
                        <form action="{{ route('admin.categories.destroy', $category) }}" method="POST" class="inline-block" onsubmit="return confirm('Hapus data ini?')">
                            @csrf @method('DELETE')
                            <button type="submit" class="text-red-400 hover:text-red-600">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="4" class="py-6 text-center text-gray-400">Belum ada data kategori.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $categories->links() }}</div>
@endsection