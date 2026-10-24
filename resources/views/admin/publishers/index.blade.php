@extends('layouts.app')

@section('title', 'Master Penerbit')
@section('header_title', 'Data Penerbit')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Daftar penerbit buku</p>
        <a href="{{ route('admin.publishers.create') }}" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">+ Tambah Penerbit</a>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Kode</th>
                    <th class="py-3 px-5 font-medium">Nama Penerbit</th>
                    <th class="py-3 px-5 font-medium">Kontak</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($publishers as $publisher)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-500">{{ $publisher->kode_penerbit }}</td>
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $publisher->nama_penerbit }}</td>
                    <td class="py-3 px-5 text-gray-400">{{ $publisher->telepon ?? '-' }} | {{ $publisher->email ?? '-' }}</td>
                    <td class="py-3 px-5 text-right space-x-2">
                        <a href="{{ route('admin.publishers.edit', $publisher) }}" class="text-gray-500 hover:text-gray-900">Edit</a>
                        <form action="{{ route('admin.publishers.destroy', $publisher) }}" method="POST" class="inline-block" onsubmit="return confirm('Hapus data ini?')">
                            @csrf @method('DELETE')
                            <button type="submit" class="text-red-400 hover:text-red-600">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="4" class="py-6 text-center text-gray-400">Belum ada data penerbit.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $publishers->links() }}</div>
@endsection