<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Email & password menjadi opsional untuk akun role "anggota".
     * Petugas/Admin tetap wajib mengisi keduanya (validasi di controller).
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('email')->nullable()->change();
            $table->string('password')->nullable()->change();
        });
    }

    public function down(): void
    {
        // Pastikan tidak ada NULL sebelum dikembalikan NOT NULL
        \Illuminate\Support\Facades\DB::table('users')
            ->whereNull('email')->update(['email' => '']);
        \Illuminate\Support\Facades\DB::table('users')
            ->whereNull('password')->update(['password' => '']);

        Schema::table('users', function (Blueprint $table) {
            $table->string('email')->nullable(false)->change();
            $table->string('password')->nullable(false)->change();
        });
    }
};
