<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('account_validation_logs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('acted_by')->nullable()->constrained('users')->onDelete('set null');
            $table->enum('action', ['approved', 'rejected', 'role_changed']);
            $table->string('old_role', 20)->nullable();
            $table->string('new_role', 20)->nullable();
            $table->text('reason')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('account_validation_logs');
    }
};
