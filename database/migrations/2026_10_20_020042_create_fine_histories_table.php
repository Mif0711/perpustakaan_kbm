<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('fine_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('fine_id')->constrained()->onDelete('cascade');
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // Petugas yang mengubah
            $table->decimal('jumlah_sebelum', 10, 2);
            $table->decimal('jumlah_sesudah', 10, 2);
            $table->string('status_sebelum');
            $table->string('status_sesudah');
            $table->text('catatan')->nullable(); // Alasan perubahan
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('fine_histories');
    }
};