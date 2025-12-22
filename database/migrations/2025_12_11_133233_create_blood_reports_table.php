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
    Schema::create('blood_reports', function (Blueprint $table) {
        $table->id('report_id');
        $table->unsignedBigInteger('user_id');
        $table->float('glucose');
        $table->float('cholesterol');
        $table->float('bilirubin');
        $table->float('rbc');
        $table->float('mcv');
        $table->float('platelets');
        $table->timestamp('created_at')->useCurrent();
        $table->foreignId('blood_group_id')->constrained('blood_groups')->cascadeOnDelete();
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blood_reports');
    }
};