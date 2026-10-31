@extends('layouts.app')

@section('title', 'Data Anggota')
@section('header_title', 'Manajemen Anggota')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Daftar anggota perpustakaan</p>
        <a href="{{ route('members.create') }}" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">+ Tambah Anggota</a>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif

    <form method="GET" action="{{ route('members.index') }}" class="mb-4 flex gap-2">
        <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari nama, email, atau kode anggota..." class="flex-1 px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800">
        <button type="submit" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-200">Cari</button>
        @if(request('search')) <a href="{{ route('members.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Reset</a> @endif
    </form>

    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Nama Lengkap</th>
                    <th class="py-3 px-5 font-medium">Email</th>
                    <th class="py-3 px-5 font-medium">Jenis Kelamin</th>
                    <th class="py-3 px-5 font-medium">Alamat</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($members as $member)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5">
                        <p class="text-gray-800 font-medium">{{ $member->nama }}</p>
                        <p class="text-xs text-gray-400">{{ $member->kode_member }}</p>
                    </td>
                    <td class="py-3 px-5 text-gray-600">{{ $member->email ?? '-' }}</td>
                    <td class="py-3 px-5 text-gray-600">
                        @if($member->jenis_kelamin == 'L')
                            Laki-laki
                        @else
                            Perempuan
                        @endif
                    </td>
                    <td class="py-3 px-5 text-gray-600 max-w-xs truncate">{{ $member->alamat }}</td>
                    <td class="py-3 px-5">
                        @if($member->status == 'aktif')
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Aktif</span>
                        @else
                            <span class="px-2 py-1 text-xs rounded-md bg-red-50 text-red-600">Nonaktif</span>
                        @endif
                    </td>
                    <td class="py-3 px-5 text-right space-x-2">
                        <a href="{{ route('members.edit', $member) }}" class="text-gray-500 hover:text-gray-900">Edit</a>
                        <form action="{{ route('members.destroy', $member) }}" method="POST" class="inline-block" onsubmit="return confirm('Hapus anggota ini?')">
                            @csrf @method('DELETE')
                            <button type="submit" class="text-red-400 hover:text-red-600">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6" class="py-6 text-center text-gray-400">
                        @if(request('search')) Hasil pencarian tidak ditemukan. @else Belum ada data anggota. @endif
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $members->links() }}</div>
@endsection