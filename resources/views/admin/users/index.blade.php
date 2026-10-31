@extends('layouts.app')

@section('title', 'Manajemen User')
@section('header_title', 'Data Pengguna')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <p class="text-sm text-gray-500">Daftar akun yang dapat mengakses sistem</p>
        <a href="{{ route('admin.users.create') }}" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">+ Tambah User</a>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">{{ session('error') }}</div>
    @endif

    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Nama</th>
                    <th class="py-3 px-5 font-medium">Username</th>
                    <th class="py-3 px-5 font-medium">Role</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($users as $user)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5">
                        <div class="flex items-center space-x-3">
                            <div class="w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center text-xs font-medium text-gray-500 overflow-hidden">
                                @if($user->foto)
                                    <img src="{{ asset('storage/' . $user->foto) }}" class="w-full h-full object-cover">
                                @else
                                    {{ strtoupper(substr($user->name, 0, 1)) }}
                                @endif
                            </div>
                            <div>
                                <p class="text-gray-800 font-medium">{{ $user->name }}</p>
                                <p class="text-xs text-gray-400">{{ $user->email }}</p>
                            </div>
                        </div>
                    </td>
                    <td class="py-3 px-5 text-gray-600">{{ $user->username }}</td>
                    <td class="py-3 px-5">
                        @if($user->role == 'admin')
                            <span class="px-2 py-1 text-xs rounded-md bg-purple-50 text-purple-600">Admin</span>
                        @elseif($user->role == 'petugas')
                            <span class="px-2 py-1 text-xs rounded-md bg-blue-50 text-blue-600">Petugas</span>
                        @else
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Anggota</span>
                        @endif
                    </td>
                    <td class="py-3 px-5">
                        @if($user->status == 'approved')
                            <span class="px-2 py-1 text-xs rounded-md bg-green-50 text-green-600">Approved</span>
                        @elseif($user->status == 'pending')
                            <span class="px-2 py-1 text-xs rounded-md bg-yellow-50 text-yellow-600">Pending</span>
                        @else
                            <span class="px-2 py-1 text-xs rounded-md bg-red-50 text-red-600">Rejected</span>
                        @endif
                    </td>
                    <td class="py-3 px-5 text-right space-x-2">
                        <a href="{{ route('admin.users.edit', $user) }}" class="text-gray-500 hover:text-gray-900">Edit</a>
                        <form action="{{ route('admin.users.destroy', $user) }}" method="POST" class="inline-block" onsubmit="return confirm('Hapus user ini?')">
                            @csrf @method('DELETE')
                            <button type="submit" class="text-red-400 hover:text-red-600">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="py-6 text-center text-gray-400">Belum ada data user.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $users->links() }}</div>
@endsection