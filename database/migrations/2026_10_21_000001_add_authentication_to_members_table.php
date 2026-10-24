<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Tambahkan kolom autentikasi pada tabel members agar anggota bisa login
     * ke area khusus anggota (katalog & keranjang buku).
     */
    public function up(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->string('password')->nullable()->after('email');
            $table->rememberToken();
        });

        // Anggota yang sudah ada sebelumnya belum punya password.
        // Beri password awal "password" (bisa diganti petugas/admin lewat menu anggota).
        DB::table('members')->whereNull('password')->update([
            'password' => Hash::make('password'),
        ]);
    }

    public function down(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->dropRememberToken();
            $table->dropColumn('password');
        });
    }
};
