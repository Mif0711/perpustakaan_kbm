<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        DB::statement("ALTER TABLE loans MODIFY COLUMN status ENUM('pending', 'dipinjam', 'dikembalikan', 'terlambat', 'rejected') NOT NULL DEFAULT 'pending'");
        
        Schema::table('loans', function (Blueprint $table) {
            $table->enum('source', ['petugas', 'anggota'])->default('petugas')->after('status');
            $table->foreignId('approved_by')->nullable()->constrained('users')->onDelete('set null')->after('source');
            $table->timestamp('approved_at')->nullable()->after('approved_by');
            $table->text('rejected_reason')->nullable()->after('approved_at');
            $table->timestamp('rejected_at')->nullable()->after('rejected_reason');
        });
    }

    public function down(): void
    {
        Schema::table('loans', function (Blueprint $table) {
            $table->dropForeign(['approved_by']);
            $table->dropColumn(['source', 'approved_by', 'approved_at', 'rejected_reason', 'rejected_at']);
        });
        
        DB::statement("ALTER TABLE loans MODIFY COLUMN status ENUM('dipinjam', 'dikembalikan', 'terlambat') NOT NULL DEFAULT 'dipinjam'");
    }
};