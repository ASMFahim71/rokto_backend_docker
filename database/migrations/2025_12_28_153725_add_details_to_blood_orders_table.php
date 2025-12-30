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
        Schema::table('blood_orders', function (Blueprint $table) {
            $table->string('hospital_name')->nullable();
            $table->string('contact_number')->nullable();
            $table->foreignId('division_id')->nullable()->constrained('divisions');
            $table->foreignId('district_id')->nullable()->constrained('districts');
            $table->foreignId('upazila_id')->nullable()->constrained('upazilas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('blood_orders', function (Blueprint $table) {
            $table->dropForeign(['division_id']);
            $table->dropForeign(['district_id']);
            $table->dropForeign(['upazila_id']);
            $table->dropColumn(['hospital_name', 'contact_number', 'division_id', 'district_id', 'upazila_id']);
        });
    }
};
