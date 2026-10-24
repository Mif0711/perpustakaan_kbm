<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        DB::table('users')
            ->whereNull('approved_at')
            ->update([
                'status' => 'approved',
                'approved_at' => now(),
            ]);
    }

    public function down(): void
    {
        // Tidak perlu rollback data
    }
};