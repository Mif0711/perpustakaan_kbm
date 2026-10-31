<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panduan Aplikasi - {{ config('app.name', 'Perpus Zabitsa') }}</title>
    <script src="{{ asset('assets/tailwind.js') }}"></script>
    <script defer src="{{ asset('assets/alpine.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/fonts.css') }}">
    <style>
        body { font-family: 'Plus Jakarta Sans', 'Segoe UI', sans-serif; }
        .smooth-scroll { scroll-behavior: smooth; }
    </style>
</head>
<body class="bg-gray-50 text-gray-900 smooth-scroll">

    <!-- Navbar -->
    <nav class="bg-white border-b border-gray-100 sticky top-0 z-50">
        <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
            <div class="flex items-center space-x-2">
                <svg class="w-6 h-6 text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                <span class="text-lg font-bold tracking-tight">Perpus <span class="text-gray-400">Zabitsa</span></span>
            </div>
            <div class="flex items-center space-x-4">
                <a href="#tentang" class="text-xs text-gray-600 hover:text-gray-900 hidden md:block">Tentang</a>
                <a href="#fitur" class="text-xs text-gray-600 hover:text-gray-900 hidden md:block">Fitur</a>
                <a href="#alur" class="text-xs text-gray-600 hover:text-gray-900 hidden md:block">Alur</a>
                <a href="#faq" class="text-xs text-gray-600 hover:text-gray-900 hidden md:block">FAQ</a>
                <a href="{{ route('login') }}" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-4 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98]">Masuk</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="bg-gradient-to-br from-gray-900 to-gray-700 text-white py-20">
        <div class="max-w-4xl mx-auto px-6 text-center">
            <h1 class="text-4xl font-bold mb-4">Panduan Aplikasi</h1>
            <p class="text-gray-300 text-lg mb-8">Sistem Manajemen Perpustakaan Digital — Perpus Zabitsa</p>
            <p class="text-sm text-gray-400 max-w-2xl mx-auto">Pelajari cara menggunakan aplikasi perpustakaan ini secara lengkap, mulai dari pendaftaran akun, peminjaman buku, hingga pengembalian. Panduan ini disusun untuk Admin, Petugas, dan Anggota.</p>
            <div class="mt-8 flex justify-center gap-4">
                <a href="#tentang" class="bg-white text-gray-900 px-6 py-3 rounded-md text-sm font-medium hover:bg-gray-100">Mulai Membaca</a>
                <a href="{{ route('login') }}" class="border border-gray-400 text-white px-6 py-3 rounded-md text-sm font-medium hover:bg-gray-800">Login Sekarang</a>
            </div>
        </div>
    </section>

    <div class="max-w-4xl mx-auto px-6 py-12">

        <!-- Tentang -->
        <section id="tentang" class="mb-16">
            <h2 class="text-2xl font-bold text-gray-900 mb-4">Tentang Aplikasi</h2>
            <p class="text-sm text-gray-600 leading-relaxed mb-4">
                <strong>Perpus Zabitsa</strong> adalah sistem manajemen perpustakaan digital yang dirancang untuk mengelola koleksi buku, anggota, dan transaksi peminjaman secara terkomputerisasi. Aplikasi ini memiliki tiga level pengguna (role) dengan hak akses yang berbeda: <strong>Admin</strong>, <strong>Petugas</strong>, dan <strong>Anggota</strong>.
            </p>
            <p class="text-sm text-gray-600 leading-relaxed">
                Sistem ini mendukung alur peminjaman modern dimana anggota dapat mengajukan peminjaman secara mandiri melalui katalog online, dan petugas akan memverifikasi pengajuan tersebut sebelum buku diserahkan.
            </p>
        </section>

        <!-- Tiga Role -->
        <section id="role" class="mb-16">
            <h2 class="text-2xl font-bold text-gray-900 mb-6">Tiga Level Pengguna</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <!-- Admin -->
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                    <div class="w-12 h-12 bg-purple-50 rounded-lg flex items-center justify-center mb-4">
                        <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    </div>
                    <h3 class="text-base font-medium text-gray-900 mb-2">Admin</h3>
                    <p class="text-xs text-gray-500 leading-relaxed">Pengelola utama sistem. Bertanggung jawab atas master data, manajemen user, persetujuan akun, dan konfigurasi sistem.</p>
                </div>
                <!-- Petugas -->
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                    <div class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center mb-4">
                        <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                    </div>
                    <h3 class="text-base font-medium text-gray-900 mb-2">Petugas</h3>
                    <p class="text-xs text-gray-500 leading-relaxed">Frontliner operasional sehari-hari. Melayani anggota, memproses peminjaman/pengembalian, dan mengelola denda.</p>
                </div>
                <!-- Anggota -->
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                    <div class="w-12 h-12 bg-green-50 rounded-lg flex items-center justify-center mb-4">
                        <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253"></path></svg>
                    </div>
                    <h3 class="text-base font-medium text-gray-900 mb-2">Anggota</h3>
                    <p class="text-xs text-gray-500 leading-relaxed">Pengguna akhir perpustakaan. Bisa melihat katalog, mengajukan peminjaman, dan memantau riwayat peminjaman secara mandiri.</p>
                </div>
            </div>
        </section>

        <!-- Fitur Utama -->
        <section id="fitur" class="mb-16">
            <h2 class="text-2xl font-bold text-gray-900 mb-6">Fitur Utama</h2>
            <div class="space-y-3">
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 flex items-start space-x-3">
                    <span class="bg-gradient-to-r from-amber-600 to-orange-500 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0">1</span>
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Registrasi & Persetujuan Akun</h3>
                        <p class="text-xs text-gray-500 mt-1">Setiap pendaftar baru harus diverifikasi oleh Admin. Admin yang menentukan role (Admin/Petugas/Anggota). Akun belum disetujui tidak bisa login.</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 flex items-start space-x-3">
                    <span class="bg-gradient-to-r from-amber-600 to-orange-500 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0">2</span>
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Katalog Buku Online</h3>
                        <p class="text-xs text-gray-500 mt-1">Anggota bisa browse katalog buku lengkap dengan cover, kategori, dan status ketersediaan stok secara real-time.</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 flex items-start space-x-3">
                    <span class="bg-gradient-to-r from-amber-600 to-orange-500 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0">3</span>
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Keranjang & Pengajuan Peminjaman</h3>
                        <p class="text-xs text-gray-500 mt-1">Anggota menambahkan buku ke keranjang, lalu mengajukan peminjaman. Sistem otomatis validasi stok, batas maksimal buku, dan denda tertunggak.</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 flex items-start space-x-3">
                    <span class="bg-gradient-to-r from-amber-600 to-orange-500 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0">4</span>
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Approval Pengajuan oleh Petugas</h3>
                        <p class="text-xs text-gray-500 mt-1">Petugas melihat daftar pengajuan masuk, bisa menyetujui (stok berkurang otomatis) atau menolak (dengan alasan).</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 flex items-start space-x-3">
                    <span class="bg-gradient-to-r from-amber-600 to-orange-500 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0">5</span>
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Pengembalian & Denda Otomatis</h3>
                        <p class="text-xs text-gray-500 mt-1">Sistem otomatis menghitung denda keterlambatan berdasarkan hari terlambat × nominal denda per hari (diatur di Pengaturan).</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-4 flex items-start space-x-3">
                    <span class="bg-gradient-to-r from-amber-600 to-orange-500 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center flex-shrink-0">6</span>
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Laporan & Pengaturan Dinamis</h3>
                        <p class="text-xs text-gray-500 mt-1">Admin bisa generate laporan (Buku, Transaksi, Denda) dengan filter tanggal, dan mengubah konfigurasi sistem tanpa ubah kode.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Alur Peminjaman -->
        <section id="alur" class="mb-16">
            <h2 class="text-2xl font-bold text-gray-900 mb-6">Alur Peminjaman Buku</h2>
            
            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 flex items-center">
                    <span class="bg-green-100 text-green-600 text-xs font-bold px-2 py-1 rounded mr-2">ANGGOTA</span>
                    Langkah 1-4 (Sisi Anggota)
                </h3>
                <ol class="space-y-3 text-sm text-gray-600">
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">1.</span>
                        <span>Login sebagai anggota, lalu buka menu <strong>Katalog Buku</strong>.</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">2.</span>
                        <span>Cari buku yang ingin dipinjam (bisa pakai search atau filter kategori). Klik buku untuk lihat detail.</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">3.</span>
                        <span>Klik tombol <strong>Tambah ke Keranjang</strong>. Cek keranjang Anda di menu <strong>Keranjang Saya</strong> (ada badge angka merah).</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">4.</span>
                        <span>Di halaman keranjang, klik <strong>Ajukan Peminjaman</strong>. Pengajuan masuk dengan status "Menunggu Persetujuan".</span>
                    </li>
                </ol>
            </div>

            <div class="text-center my-4">
                <svg class="w-6 h-6 mx-auto text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg>
            </div>

            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 flex items-center">
                    <span class="bg-blue-100 text-blue-600 text-xs font-bold px-2 py-1 rounded mr-2">PETUGAS</span>
                    Langkah 5-6 (Sisi Petugas)
                </h3>
                <ol class="space-y-3 text-sm text-gray-600">
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">5.</span>
                        <span>Petugas login, buka menu <strong>Pengajuan Masuk</strong> (ada badge merah jumlah pending).</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">6.</span>
                        <span>Tinjau pengajuan, lalu klik <strong>Setujui</strong> (stok berkurang, status jadi "Dipinjam") atau <strong>Tolak</strong> (dengan alasan).</span>
                    </li>
                </ol>
            </div>

            <div class="text-center my-4">
                <svg class="w-6 h-6 mx-auto text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg>
            </div>

            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 flex items-center">
                    <span class="bg-green-100 text-green-600 text-xs font-bold px-2 py-1 rounded mr-2">ANGGOTA</span>
                    Langkah 7-8 (Pengembalian)
                </h3>
                <ol class="space-y-3 text-sm text-gray-600">
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">7.</span>
                        <span>Anggota datang ke perpustakaan untuk mengembalikan buku. Petugas proses pengembalian via menu <strong>Pengembalian</strong>.</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-gray-400 font-medium mr-3">8.</span>
                        <span>Jika telat, sistem otomatis hitung denda. Anggota bayar ke petugas, petugas lunasi via menu <strong>Denda</strong>.</span>
                    </li>
                </ol>
            </div>
        </section>

        <!-- Aturan Peminjaman -->
        <section id="aturan" class="mb-16">
            <h2 class="text-2xl font-bold text-gray-900 mb-6">Aturan Peminjaman</h2>
            <div class="bg-yellow-50 border border-yellow-100 rounded-lg p-6">
                <div class="flex items-start space-x-3">
                    <svg class="w-6 h-6 text-yellow-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                    <div class="text-sm text-yellow-800">
                        <p class="font-medium mb-2">Aturan ini diatur oleh Admin di menu Pengaturan Sistem, bisa diubah kapan saja:</p>
                        <ul class="list-disc list-inside space-y-1 text-xs">
                            <li><strong>Maksimal Jumlah Buku:</strong> Batas buku yang boleh dipinjam per anggota (misal: 3 buku)</li>
                            <li><strong>Maksimal Hari Pinjam:</strong> Batas waktu peminjaman (misal: 7 hari)</li>
                            <li><strong>Denda per Hari:</strong> Nominal denda keterlambatan per hari (misal: Rp 2.000)</li>
                        </ul>
                        <p class="mt-3 text-xs font-medium">Syarat tambahan:</p>
                        <ul class="list-disc list-inside space-y-1 text-xs mt-1">
                            <li>Anggota harus berstatus "Aktif"</li>
                            <li>Tidak boleh punya denda belum lunas</li>
                            <li>Tidak boleh mengajukan buku yang sama 2x (jika pengajuan pertama masih pending)</li>
                            <li>Stok buku harus tersedia (&gt; 0)</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ -->
        <section id="faq" class="mb-16">
            <h2 class="text-2xl font-bold text-gray-900 mb-6">Pertanyaan Umum (FAQ)</h2>
            <div class="space-y-3">
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
                    <details class="group">
                        <summary class="px-6 py-4 cursor-pointer flex justify-between items-center text-sm font-medium text-gray-900">
                            Bagaimana cara mendaftar akun?
                            <svg class="w-5 h-5 text-gray-400 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                        </summary>
                        <div class="px-6 pb-4 text-xs text-gray-600">
                            Klik link "Daftar di sini" di halaman login. Isi formulir (Nama, Username, Email, Password). Akun akan berstatus "Pending" dan harus menunggu persetujuan Admin. Setelah disetujui, Anda akan dapat email konfirmasi (atau hubungi petugas perpustakaan).
                        </div>
                    </details>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
                    <details class="group">
                        <summary class="px-6 py-4 cursor-pointer flex justify-between items-center text-sm font-medium text-gray-900">
                            Kenapa saya tidak bisa login?
                            <svg class="w-5 h-5 text-gray-400 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                        </summary>
                        <div class="px-6 pb-4 text-xs text-gray-600">
                            Ada beberapa kemungkinan: (1) Akun belum disetujui Admin (status pending), (2) Akun ditolak Admin, (3) Username/Email atau Password salah. Hubungi petugas perpustakaan untuk konfirmasi status akun Anda.
                        </div>
                    </details>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
                    <details class="group">
                        <summary class="px-6 py-4 cursor-pointer flex justify-between items-center text-sm font-medium text-gray-900">
                            Kenapa pengajuan peminjaman saya ditolak?
                            <svg class="w-5 h-5 text-gray-400 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                        </summary>
                        <div class="px-6 pb-4 text-xs text-gray-600">
                            Petugas bisa menolak pengajuan dengan alasan tertentu (misal: stok tidak mencukupi, anggota punya denda, atau alasan lain). Cek halaman "Status Peminjaman" untuk melihat alasan penolakan.
                        </div>
                    </details>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
                    <details class="group">
                        <summary class="px-6 py-4 cursor-pointer flex justify-between items-center text-sm font-medium text-gray-900">
                            Bagaimana cara menghitung denda?
                            <svg class="w-5 h-5 text-gray-400 group-open:rotate-180 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                        </summary>
                        <div class="px-6 pb-4 text-xs text-gray-600">
                            Denda = (Hari Terlambat) × (Denda per Hari). Contoh: Jika denda Rp 2.000/hari dan Anda telat 3 hari, maka denda = 3 × 2.000 = Rp 6.000. Denda dihitung otomatis saat petugas memproses pengembalian.
                        </div>
                    </details>
                </div>
                <div class="bg-white border border-slate-100 rounded-2xl shadow-sm overflow-hidden">
                    <details class="group">
                        <summary class="px-6 py-4 cursor-pointer flex justify-between items-center text-sm font-medium text-gray-900">
                            Apakah keranjang saya akan hilang jika saya logout?
                            <svg class="w-5 h-5 text-gray-400 group-open:rotate-180 transition-transform" fill="none, stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                        </summary>
                        <div class="px-6 pb-4 text-xs text-gray-600">
                            Tidak. Keranjang Anda disimpan di database (bukan session), jadi tetap aman meskipun Anda logout dan login kembali di device lain.
                        </div>
                    </details>
                </div>
            </div>
        </section>

        <!-- Kontak -->
        <section class="mb-16">
            <div class="bg-amber-900 text-white rounded-lg p-8 text-center">
                <h2 class="text-xl font-bold mb-2">Butuh Bantuan?</h2>
                <p class="text-sm text-gray-400 mb-6">Hubungi petugas perpustakaan jika Anda mengalami kendala atau ada pertanyaan lain.</p>
                <a href="{{ route('login') }}" class="bg-white text-gray-900 px-6 py-3 rounded-md text-sm font-medium hover:bg-gray-100 inline-block">Login Sekarang</a>
            </div>
        </section>

    </div>

    <!-- Footer -->
    <footer class="bg-white border-t border-gray-100">
        <div class="max-w-6xl mx-auto px-6 py-6 flex flex-col md:flex-row justify-between items-center">
            <p class="text-xs text-gray-400">© 2026 Perpus Zabitsa. Sistem Manajemen Perpustakaan Digital.</p>
            <div class="flex items-center space-x-4 mt-4 md:mt-0">
                <a href="{{ route('panduan') }}" class="text-xs text-gray-500 hover:text-gray-900">Panduan</a>
                <a href="{{ route('login') }}" class="text-xs text-gray-500 hover:text-gray-900">Login</a>
                <a href="{{ route('register') }}" class="text-xs text-gray-500 hover:text-gray-900">Daftar</a>
            </div>
        </div>
    </footer>

</body>
</html>