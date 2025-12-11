<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BloodGroupsSeeder extends Seeder
{
    public function run()
    {
        $groups = [
            ['blood_group_id' => '1', 'blood_group_name' => 'A+'],
            ['blood_group_id' => '2', 'blood_group_name' => 'A-'],
            ['blood_group_id' => '3', 'blood_group_name' => 'B+'],
            ['blood_group_id' => '4', 'blood_group_name' => 'B-'],
            ['blood_group_id' => '5', 'blood_group_name' => 'AB+'],
            ['blood_group_id' => '6', 'blood_group_name' => 'AB-'],
            ['blood_group_id' => '7', 'blood_group_name' => 'O+'],
            ['blood_group_id' => '8', 'blood_group_name' => 'O-'],
        ];

        DB::table('blood_groups')->insert($groups);
    }
}
