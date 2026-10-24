@extends('layouts.app')

@section('title', 'Tambah User')
@section('header_title', 'Tambah User Baru')

@section('content')
    <div class="bg-white border border-gray-100 rounded-lg p-6 max-w-2xl">
        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <ul>@foreach ($errors->all() as $error) <li>{{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        <form action="{{ route('admin.users.store') }}" method="POST" enctype="multipart/form-data" class="space-y-5">
            @csrf
            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div class="md:col-span-2">
                    <label class="block text-xs font-medium text-gray-500 mb-1">Nama Lengkap *</label>
                    <input type="text" name="name" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Username *</label>
                    <input type="text" name="username" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Email <span id="email-star" class="text-red-300">*</span></label>
                    <input type="email" name="email" id="email" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                    <p id="email-hint" class="text-[11px] text-gray-400 mt-1">Wajib untuk Admin/Petugas.</p>
                </div>
                <div>
                    <x-password-field name="password" label="Password" :required="true" />
                </div>
                <div>
                    <x-password-field name="password_confirmation" label="Konfirmasi Password" :required="true" />
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Role *</label>
                    <select name="role" id="role" onchange="syncRoleFields()" class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" required>
                        <option value="petugas">Petugas</option>
                        <option value="admin">Admin</option>
                        <option value="anggota">Anggota</option>
                    </select>
                    <p class="text-[11px] text-gray-400 mt-1">Anggota: email &amp; password opsional.</p>
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-500 mb-1">Foto Profil</label>
                    <input type="file" name="foto" class="w-full text-sm text-gray-500 file:mr-3 file:py-2 file:px-3 file:rounded-md file:border-0 file:text-xs file:font-medium file:bg-gray-100 file:text-gray-700 hover:file:bg-gray-200">
                </div>
            </div>
            
            <div class="flex space-x-3 pt-4">
                <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-800">Simpan</button>
                <a href="{{ route('admin.users.index') }}" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">Batal</a>
            </div>
        </form>
    </div>

    <script>
        // Sinkronisasi kewajiban email/password dengan role terpilih (JS murni, tanpa framework/CDN)
        function syncRoleFields() {
            var role = document.getElementById('role').value;
            var pegawai = (role === 'admin' || role === 'petugas');

            var email = document.getElementById('email');
            var pass = document.getElementById('password');
            var passConf = document.getElementById('password_confirmation');
            var star = document.getElementById('email-star');
            var hint = document.getElementById('email-hint');

            if (email) email.required = pegawai;
            if (pass) pass.required = pegawai;
            if (passConf) passConf.required = pegawai;
            if (star) star.style.display = pegawai ? '' : 'none';
            if (hint) hint.textContent = pegawai
                ? 'Wajib untuk Admin/Petugas.'
                : 'Opsional untuk anggota. Kosongkan bila anggota tidak memiliki email.';
        }

        // Inisialisasi saat halaman terbuka
        document.addEventListener('DOMContentLoaded', syncRoleFields);
    </script>
@endsection