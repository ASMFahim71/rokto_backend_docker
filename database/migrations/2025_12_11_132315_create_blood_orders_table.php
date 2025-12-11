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
    Schema::create('blood_orders', function (Blueprint $table) {
        $table->id('order_id');
        $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
        $table->unsignedBigInteger('requester_id');
        $table->unsignedBigInteger('blood_group_id');
        $table->date('date');
        $table->time('time');
        $table->text('cause');
        $table->text('place');
        $table->string('gender', 10)->nullable();
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blood_orders');
    }
};
