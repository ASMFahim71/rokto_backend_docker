<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class LocationSeeder extends Seeder
{
    public function run()
    {
        // 1. Seed Divisions
        // We look for the table named 'divisions' inside the JSON file
        $divisions = $this->getRecordsFromJson('data/division.json', 'division');

        foreach ($divisions as $division) {
            DB::table('divisions')->updateOrInsert(
                ['id' => $division['id']],
                [
                    'name' => $division['name'],
                    'bn_name' => $division['bn_name'] ?? null,
                    // If your JSON has 'url', we ignore it unless you added a 'url' column to migration
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }
        $this->command->info('Divisions seeded successfully!');

        // 2. Seed Districts
        // Assuming districts.json has the same PHPMyAdmin structure
        $districts = $this->getRecordsFromJson('data/districts.json', 'districts');

        foreach ($districts as $district) {
            DB::table('districts')->updateOrInsert(
                ['id' => $district['id']],
                [
                    'division_id' => $district['division_id'],
                    'name' => $district['name'],
                    'bn_name' => $district['bn_name'] ?? null,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }
        $this->command->info('Districts seeded successfully!');

        // 3. Seed Upazilas
        // Assuming upazilas.json has the same structure
        $upazilas = $this->getRecordsFromJson('data/upazila.json', 'upazila');

        // Use chunks to prevent memory issues if there are many upazilas
        $chunks = array_chunk($upazilas, 500);

        foreach ($chunks as $chunk) {
            foreach ($chunk as $upazila) {
                DB::table('upazilas')->updateOrInsert(
                    ['id' => $upazila['id']],
                    [
                        'district_id' => $upazila['district_id'],
                        'name' => $upazila['name'],
                        'bn_name' => $upazila['bn_name'] ?? null,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]
                );
            }
        }
        $this->command->info('Upazilas seeded successfully!');
    }

    /**
     * Helper to extract the 'data' array from PHPMyAdmin JSON export
     */
    private function getRecordsFromJson($path, $tableName)
    {
        $fullPath = database_path($path);

        if (!File::exists($fullPath)) {
            $this->command->warn("File not found: $path");
            return [];
        }

        $jsonContent = File::get($fullPath);
        $decoded = json_decode($jsonContent, true);

        // Loop through the export structure to find the table data
        foreach ($decoded as $block) {
            if (isset($block['type']) && $block['type'] === 'table') {
                if ($block['name'] === $tableName) {
                    return $block['data'];
                }
            }
        }

        return [];
    }
}
