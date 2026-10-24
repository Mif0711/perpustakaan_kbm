<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Paksa hapus tabel jika sudah ada (entah dari mana asalnya)
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        Schema::dropIfExists('cart_items');
        Schema::dropIfExists('carts');
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        // Bersihkan record migration yang nyangkut
        DB::table('migrations')->where('migration', 'like', '%create_cart%')->delete();

        // Buat ulang tabel carts dulu
        if (!Schema::hasTable('carts')) {
            Schema::create('carts', function (Blueprint $table) {
                $table->id();
                $table->foreignId('user_id')->constrained()->onDelete('cascade');
                $table->timestamps();
                $table->unique('user_id');
            });
        }

        // Lalu buat tabel cart_items
        Schema::create('cart_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cart_id')->constrained()->onDelete('cascade');
            $table->foreignId('book_id')->constrained()->onDelete('cascade');
            $table->integer('jumlah')->default(1);
            $table->timestamps();
            $table->unique(['cart_id', 'book_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cart_items');
        Schema::dropIfExists('carts');
    }
};