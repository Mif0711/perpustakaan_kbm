@extends('layouts.app')

@section('title', 'Persetujuan Akun')
@section('header_title', 'Persetujuan Akun')

@section('content')
    {{-- Halaman ini sengaja TIDAK memakai Alpine/CDN agar tombol selalu berfungsi --}}
    <style>
        dialog.modal-akun {
            border: none;
            padding: 0;
            border-radius: 0.5rem;
            box-shadow: 0 20px 25px -5px rgba(0,0,0,.15);
        }
        dialog.modal-akun::backdrop {
            background: rgba(0,0,0,.5);
        }
    </style>

    <!-- Indikator jumlah akun menunggu validasi -->
    <div class="bg-white border border-gray-100 rounded-lg p-5 mb-5 flex items-center justify-between">
        <div>
            <p class="text-xs text-gray-400 uppercase tracking-wide font-medium">Menunggu Validasi</p>
            <p class="text-3xl font-light text-gray-900 mt-1">{{ $pendingCount }}</p>
            <p class="text-xs text-gray-400 mt-1">akun baru perlu diperiksa dan ditentukan role-nya</p>
        </div>
        <svg class="w-10 h-10 text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">{{ session('error') }}</div>
    @endif

    <!-- Pencarian & filter status -->
    <form method="GET" action="{{ route('admin.users.pending') }}" class="flex flex-col sm:flex-row gap-3 mb-5">
        <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari nama, username, atau email..."
               class="flex-1 px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800">
        <select name="status" class="px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800">
            <option value="pending" {{ $status === 'pending' ? 'selected' : '' }}>Menunggu Persetujuan</option>
            <option value="approved" {{ $status === 'approved' ? 'selected' : '' }}>Disetujui</option>
            <option value="rejected" {{ $status === 'rejected' ? 'selected' : '' }}>Ditolak</option>
            <option value="all" {{ $status === 'all' ? 'selected' : '' }}>Semua Status</option>
        </select>
        <button type="submit" class="bg-gray-900 text-white px-4 py-2 rounded-md text-sm font-medium hover:bg-gray-800">Terapkan</button>
        @if(request('q') || $status !== 'pending')
            <a href="{{ route('admin.users.pending') }}" class="px-4 py-2 border border-gray-200 rounded-md text-sm text-gray-600 hover:bg-gray-50 text-center">Reset</a>
        @endif
    </form>

    <div class="bg-white border border-gray-100 rounded-lg overflow-hidden">
        <div class="overflow-x-auto">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                <tr>
                    <th class="py-3 px-5 font-medium">Nama</th>
                    <th class="py-3 px-5 font-medium">Username</th>
                    <th class="py-3 px-5 font-medium">Email</th>
                    <th class="py-3 px-5 font-medium">Telepon</th>
                    <th class="py-3 px-5 font-medium">Daftar</th>
                    <th class="py-3 px-5 font-medium">Status</th>
                    <th class="py-3 px-5 font-medium text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @forelse($pendingUsers as $user)
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-3 px-5 text-gray-800 font-medium">{{ $user->name }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $user->username }}</td>
                    <td class="py-3 px-5 text-gray-600">{{ $user->email ?: '-' }}</td>
                    <td class="py-3 px-5 text-gray-500">{{ $user->telepon ?: '-' }}</td>
                    <td class="py-3 px-5 text-gray-500">{{ $user->created_at->format('d M Y') }}</td>
                    <td class="py-3 px-5">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium
                            {{ $user->status === 'pending' ? 'bg-yellow-50 text-yellow-600' : '' }}
                            {{ $user->status === 'approved' ? 'bg-green-50 text-green-600' : '' }}
                            {{ $user->status === 'rejected' ? 'bg-red-50 text-red-500' : '' }}">
                            {{ ['pending' => 'Menunggu', 'approved' => 'Disetujui', 'rejected' => 'Ditolak'][$user->status] }}
                        </span>
                        @if($user->status === 'rejected' && $user->rejected_reason)
                            <p class="text-[11px] text-gray-400 mt-1">{{ $user->rejected_reason }}</p>
                        @endif
                    </td>
                    <td class="py-3 px-5 text-right space-x-2 whitespace-nowrap">
                        @if($user->status === 'pending')
                            <button type="button" onclick="openModal({{ $user->id }})"
                                class="text-gray-600 hover:text-gray-900 text-xs border border-gray-200 px-3 py-1.5 rounded-md hover:bg-gray-100 font-medium cursor-pointer">
                                Detail
                            </button>
                            <button type="button" onclick="openModal({{ $user->id }})"
                                class="bg-gray-900 text-white px-3 py-1.5 rounded-md text-xs font-medium hover:bg-gray-800 cursor-pointer">
                                Proses Validasi
                            </button>
                        @elseif($user->status === 'approved')
                            <span class="text-[11px] text-gray-400">Role: {{ ucfirst($user->role) }}</span>
                        @else
                            <span class="text-[11px] text-gray-400">Tidak ada aksi</span>
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="7" class="py-10 text-center">
                        <svg class="w-10 h-10 text-gray-200 mx-auto mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                        <p class="text-gray-400 text-sm">Tidak ada akun yang menunggu persetujuan.</p>
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
        </div>
    </div>
    <div class="mt-4">{{ $pendingUsers->links() }}</div>

    <!-- Modal (native <dialog>, tanpa framework JS) -->
    @foreach($pendingUsers as $user)
        @if($user->status === 'pending')
        <dialog id="modal-user-{{ $user->id }}" class="modal-akun w-full max-w-lg p-6 text-sm max-h-[90vh]">
            <div class="flex items-start justify-between mb-4">
                <div>
                    <h3 class="text-lg font-medium text-gray-900">Detail Pendaftar</h3>
                    <p class="text-xs text-gray-400">Periksa data sebelum menentukan role dan keputusan.</p>
                </div>
                <button type="button" onclick="this.closest('dialog').close()" title="Tutup"
                        class="text-gray-400 hover:text-gray-600 text-xl leading-none cursor-pointer">&times;</button>
            </div>

            <dl class="text-sm space-y-2 mb-5">
                <div class="flex justify-between border-b border-gray-50 pb-2"><dt class="text-gray-400">Nama Lengkap</dt><dd class="text-gray-800 font-medium">{{ $user->name }}</dd></div>
                <div class="flex justify-between border-b border-gray-50 pb-2"><dt class="text-gray-400">Username</dt><dd class="text-gray-800">{{ $user->username }}</dd></div>
                <div class="flex justify-between border-b border-gray-50 pb-2"><dt class="text-gray-400">Email</dt><dd class="text-gray-800">{{ $user->email ?: '-' }}</dd></div>
                <div class="flex justify-between border-b border-gray-50 pb-2"><dt class="text-gray-400">Telepon</dt><dd class="text-gray-800">{{ $user->telepon ?: '-' }}</dd></div>
                <div class="flex justify-between border-b border-gray-50 pb-2"><dt class="text-gray-400">Tanggal Pendaftaran</dt><dd class="text-gray-800">{{ $user->created_at->format('d M Y H:i') }}</dd></div>
            </dl>

            <!-- Penentuan Role oleh Admin -->
            <div class="mb-5">
                <label class="block text-xs font-medium text-gray-500 mb-2">Tentukan Role Akun</label>
                <select name="role" id="role-select-{{ $user->id }}" onchange="updateRoleDesc({{ $user->id }}, this)"
                        class="w-full px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800">
                    <option value="anggota" data-desc="Menggunakan katalog, keranjang buku, mengajukan peminjaman, dan melihat riwayat peminjaman.">Anggota</option>
                    <option value="petugas" data-desc="Operasional perpustakaan: kelola anggota, peminjaman, pengembalian, dan denda. Tidak dapat memvalidasi akun baru.">Petugas</option>
                    <option value="admin" data-desc="Akses penuh: validasi akun, pengelolaan user & role, master data, laporan, dan pengaturan.">Admin</option>
                </select>
                <p id="role-desc-{{ $user->id }}" class="mt-2 text-xs text-gray-500 bg-gray-50 border border-gray-100 rounded-md p-2.5">
                    Anggota - Menggunakan katalog, keranjang buku, mengajukan peminjaman, dan melihat riwayat peminjaman.
                </p>
            </div>

            <!-- Setujui -->
            <form action="{{ route('admin.users.approve', $user) }}" method="POST"
                  onsubmit="return confirm('Setujui akun ini dengan role yang dipilih?');">
                @csrf
                <input type="hidden" name="role" id="role-hidden-{{ $user->id }}" value="anggota">
                <button type="submit" class="w-full bg-green-600 text-white py-2.5 rounded-md text-sm font-medium hover:bg-green-700 cursor-pointer">
                    Setujui dengan Role Terpilih
                </button>
            </form>

            <!-- Tolak -->
            <form action="{{ route('admin.users.reject', $user) }}" method="POST"
                  onsubmit="return confirm('Yakin menolak pendaftaran akun ini?');"
                  class="mt-3 pt-3 border-t border-gray-100">
                @csrf
                <label class="block text-xs font-medium text-gray-500 mb-2">Alasan Penolakan</label>
                <div class="flex gap-2">
                    <input type="text" name="rejected_reason" required maxlength="255" placeholder="Contoh: Data tidak lengkap / tidak memenuhi syarat"
                        class="flex-1 px-3 py-2 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-red-300">
                    <button type="submit" class="bg-red-50 text-red-500 border border-red-100 px-4 py-2 rounded-md text-sm font-medium hover:bg-red-100 whitespace-nowrap cursor-pointer">Tolak</button>
                </div>
            </form>
        </dialog>
        @endif
    @endforeach

    <script>
        // JavaScript murni (tanpa framework/CDN): buka modal & sinkron pilihan role
        function openModal(id) {
            var d = document.getElementById('modal-user-' + id);
            if (d && typeof d.showModal === 'function') d.showModal();
        }
        function updateRoleDesc(id, select) {
            var desc = select.selectedOptions[0].getAttribute('data-desc');
            var el = document.getElementById('role-desc-' + id);
            var hidden = document.getElementById('role-hidden-' + id);
            if (el) el.textContent = select.value.charAt(0).toUpperCase() + select.value.slice(1) + ' - ' + desc;
            if (hidden) hidden.value = select.value;
        }
    </script>
@endsection
