@extends('layouts.app')

@section('title', 'Edit Anggota')
@section('header_title', 'Edit Data Anggota')

@section('content')
    <div class="bg-white border border-gray-100 rounded-lg p-6 max-w-2xl">
        <form action="{{ route('members.update', $member) }}" method="POST" class="space-y-5">
            @csrf @method('PUT')
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Nama Lengkap *</label>
                <input type="text" name="nama" value="{{ old('nama', $member->nama) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Email *</label>
                <input type="email" name="email" value="{{ old('email', $member->email) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Jenis Kelamin *</label>
                <select name="jenis_kelamin" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                    <option value="L" @selected(old('jenis_kelamin', $member->jenis_kelamin) == 'L')>Laki-laki</option>
                    <option value="P" @selected(old('jenis_kelamin', $member->jenis_kelamin) == 'P')>Perempuan</option>
                </select>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Alamat *</label>
                <textarea name="alamat" rows="3" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>{{ old('alamat', $member->alamat) }}</textarea>
            </div>
            <div>
                <label class="block text-xs font-medium text-gray-500 mb-1">Status *</label>
                <select name="status" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                    <option value="aktif" @selected(old('status', $member->status) == 'aktif')>Aktif</option>
                    <option value="nonaktif" @selected(old('status', $member->status) == 'nonaktif')>Nonaktif</option>
                </select>
            </div>
            
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Update</button>
                <a href="{{ route('members.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>
@endsection