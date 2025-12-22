<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('order_matches', function (Blueprint $table) {
        $table->id('match_id');
        $table->unsignedBigInteger('order_id');
        $table->unsignedBigInteger('donor_id');
        $table->enum('status', ['pending', 'accepted', 'rejected', 'completed'])->default('pending');
        $table->timestamp('matched_at')->nullable();
        $table->timestamps();
        $table->foreignId('blood_group_id')->constrained('blood_groups')->cascadeOnDelete();
        $table->foreign('order_id')->references('order_id')->on('blood_orders')->onDelete('cascade');
        $table->foreign('donor_id')->references('donor_id')->on('donors')->onDelete('cascade');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_matches');
    }
};