<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('debts', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('space_id');
            $table->string('type'); // 'Me prestan' o 'Yo presto'
            $table->decimal('amount', 10, 2);
            $table->string('description')->nullable();
            $table->string('Who');
            $table->date('due_date')->nullable();
            $table->timestamps();

            // Definir explícitamente la clave foránea
            $table->foreign('space_id')->references('id')->on('spaces');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('debts');
    }
};
