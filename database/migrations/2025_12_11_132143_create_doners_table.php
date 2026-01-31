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
    Schema::create('donors', function (Blueprint $table) {
        $table->id('donor_id');
        $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
        $table->foreignId('blood_group_id')->constrained('blood_groups')->cascadeOnDelete();
        $table->date('last_donation_date')->nullable();
        $table->integer('donation_count')->default(0);
        $table->float('rating')->default(0);
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('donors');
    }
};