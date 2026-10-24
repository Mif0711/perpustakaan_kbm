<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Pengajuan peminjaman dari anggota:
     * - status baru "diajukan" (menunggu persetujuan petugas)
     * - user_id boleh kosong karena pengajuan dibuat oleh anggota, bukan staf
     */
    public function up(): void
    {
        DB::statement("ALTER TABLE loans MODIFY status ENUM('diajukan','dipinjam','dikembalikan','terlambat') NOT NULL DEFAULT 'dipinjam'");
        DB::statement("ALTER TABLE loans MODIFY user_id BIGINT UNSIGNED NULL");
    }

    public function down(): void
    {
        // Pengajuan yang belum disetujui tidak diperlukan lagi saat rollback.
        DB::table('loans')->where('status', 'diajukan')->delete();

        // Kembalikan ke status lama; baris tanpa user_id tidak bisa dikembalikan.
        DB::table('loans')->whereNull('user_id')->delete();

        DB::statement("ALTER TABLE loans MODIFY user_id BIGINT UNSIGNED NOT NULL");
        DB::statement("ALTER TABLE loans MODIFY status ENUM('dipinjam','dikembalikan','terlambat') NOT NULL DEFAULT 'dipinjam'");
    }
};
