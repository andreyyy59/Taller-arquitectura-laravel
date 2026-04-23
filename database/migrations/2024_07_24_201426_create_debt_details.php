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
        Schema::create('debt_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('debt_id');
            $table->decimal('amount', 10, 2);
            $table->string('description')->nullable();
            $table->date('date');
            $table->timestamps();

            // Definir explícitamente la clave foránea
            $table->foreign('debt_id')->references('id')->on('debts')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('debt_details');
    }
};
