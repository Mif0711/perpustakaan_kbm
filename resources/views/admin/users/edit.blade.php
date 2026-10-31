@extends('layouts.app')

@section('title', 'Edit User')
@section('header_title', 'Edit Data User')

@section('content')
    <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6 max-w-2xl">
        <form action="{{ route('admin.users.update', $user) }}" method="POST" enctype="multipart/form-data" class="space-y-5">
            @csrf @method('PUT')
            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div class="md:col-span-2">
                    <label class="block text-xs font-medium text-gray-500 mb-1">Nama Lengkap *</label>
                    <input type="text" name="name" value="{{ old('name', $user->name) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Username *</label>
                    <input type="text" name="username" value="{{ old('username', $user->username) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Email <span id="email-star" class="text-red-300">*</span></label>
                    <input type="email" name="email" id="email" value="{{ old('email', $user->email) }}" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                    <p id="email-hint" class="text-[11px] text-gray-400 mt-1">Wajib untuk Admin/Petugas.</p>
                </div>
                <div>
                    <x-password-field name="password" label="Password Baru (Kosongkan jika tak diubah)" />
                    @if(!$user->password)
                        <p class="text-[11px] text-yellow-600 mt-1">Akun ini belum memiliki password — terisi di sini untuk mengaktifkan login.</p>
                    @endif
                </div>
                <div>
                    <x-password-field name="password_confirmation" label="Konfirmasi Password" />
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Role *</label>
                    <select name="role" id="role" onchange="syncRoleFields()" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="petugas" @selected(old('role', $user->role) == 'petugas')>Petugas</option>
                        <option value="admin" @selected(old('role', $user->role) == 'admin')>Admin</option>
                        <option value="anggota" @selected(old('role', $user->role) == 'anggota')>Anggota</option>
                    </select>
                    <p class="text-[11px] text-gray-400 mt-1">Anggota: email &amp; password opsional.</p>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Foto Saat Ini</label>
                    @if($user->foto)
                        <img src="{{ asset('storage/' . $user->foto) }}" class="w-16 h-16 rounded-full object-cover mb-2">
                    @else
                        <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center text-gray-400 mb-2">N/A</div>
                    @endif
                    <input type="file" name="foto" class="w-full text-sm text-gray-500 file:mr-3 file:py-2 file:px-3 file:rounded-md file:border-0 file:text-xs file:font-medium file:bg-gray-100 file:text-gray-700 hover:file:bg-gray-200">
                </div>
            </div>
            
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Update</button>
                <a href="{{ route('admin.users.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>

    <script>
        // Sinkronisasi kewajiban email dengan role terpilih (JS murni, tanpa framework/CDN)
        function syncRoleFields() {
            var role = document.getElementById('role').value;
            var pegawai = (role === 'admin' || role === 'petugas');

            var email = document.getElementById('email');
            var star = document.getElementById('email-star');
            var hint = document.getElementById('email-hint');

            if (email) email.required = pegawai;
            if (star) star.style.display = pegawai ? '' : 'none';
            if (hint) hint.textContent = pegawai
                ? 'Wajib untuk Admin/Petugas.'
                : 'Opsional untuk anggota. Kosongkan bila anggota tidak memiliki email.';
        }

        // Inisialisasi saat halaman terbuka (menyesuaikan role saat ini)
        document.addEventListener('DOMContentLoaded', syncRoleFields);
    </script>
@endsection