<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BloodGroupsSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('blood_groups')->insert([
            ['blood_group_name' => 'A+'],
            ['blood_group_name' => 'A-'],
            ['blood_group_name' => 'B+'],
            ['blood_group_name' => 'B-'],
            ['blood_group_name' => 'AB+'],
            ['blood_group_name' => 'AB-'],
            ['blood_group_name' => 'O+'],
            ['blood_group_name' => 'O-'],
        ]);
    }
}
