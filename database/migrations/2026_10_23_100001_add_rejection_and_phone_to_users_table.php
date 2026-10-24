<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Nomor telepon pendaftar (opsional, ditampilkan saat validasi akun)
            $table->string('telepon', 20)->nullable()->after('email');

            // Kolom penolakan akun (sebelumnya salah diisi ke tabel loans oleh UserController)
            $table->timestamp('rejected_at')->nullable()->after('approved_at');
            $table->text('rejected_reason')->nullable()->after('rejected_at');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['telepon', 'rejected_at', 'rejected_reason']);
        });
    }
};
