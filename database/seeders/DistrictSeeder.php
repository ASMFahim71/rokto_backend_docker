<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class DistrictSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $districts = [
            ['id' => '1', 'division_id' => '1', 'name' => 'Comilla', 'bn_name' => 'কুমিল্লা', 'lat' => '23.4682747', 'lon' => '91.1788135'],
            ['id' => '2', 'division_id' => '1', 'name' => 'Feni', 'bn_name' => 'ফেনী', 'lat' => '23.023231', 'lon' => '91.3840844'],
            ['id' => '3', 'division_id' => '1', 'name' => 'Brahmanbaria', 'bn_name' => 'ব্রাহ্মণবাড়িয়া', 'lat' => '23.9570904', 'lon' => '91.1119286'],
            ['id' => '4', 'division_id' => '1', 'name' => 'Rangamati', 'bn_name' => 'রাঙ্গামাটি', 'lat' => '22.6175', 'lon' => '92.1422'],
            ['id' => '5', 'division_id' => '1', 'name' => 'Noakhali', 'bn_name' => 'নোয়াখালী', 'lat' => '22.869563', 'lon' => '91.099398'],
            ['id' => '6', 'division_id' => '1', 'name' => 'Chandpur', 'bn_name' => 'চাঁদপুর', 'lat' => '23.2332585', 'lon' => '90.6712912'],
            ['id' => '7', 'division_id' => '1', 'name' => 'Lakshmipur', 'bn_name' => 'লক্ষ্মীপুর', 'lat' => '22.942477', 'lon' => '90.841184'],
            ['id' => '8', 'division_id' => '1', 'name' => 'Chattogram', 'bn_name' => 'চট্টগ্রাম', 'lat' => '22.335109', 'lon' => '91.834073'],
            ['id' => '9', 'division_id' => '1', 'name' => 'Coxsbazar', 'bn_name' => 'কক্সবাজার', 'lat' => '21.4272', 'lon' => '92.0058'],
            ['id' => '10', 'division_id' => '1', 'name' => 'Khagrachhari', 'bn_name' => 'খাগড়াছড়ি', 'lat' => '23.119285', 'lon' => '91.984663'],
            ['id' => '11', 'division_id' => '1', 'name' => 'Bandarban', 'bn_name' => 'বান্দরবান', 'lat' => '22.1953275', 'lon' => '92.2183773'],
            ['id' => '12', 'division_id' => '2', 'name' => 'Sirajganj', 'bn_name' => 'সিরাজগঞ্জ', 'lat' => '24.4533978', 'lon' => '89.7006815'],
            ['id' => '13', 'division_id' => '2', 'name' => 'Pabna', 'bn_name' => 'পাবনা', 'lat' => '23.998524', 'lon' => '89.233645'],
            ['id' => '14', 'division_id' => '2', 'name' => 'Bogura', 'bn_name' => 'বগুড়া', 'lat' => '24.8465228', 'lon' => '89.377755'],
            ['id' => '15', 'division_id' => '2', 'name' => 'Rajshahi', 'bn_name' => 'রাজশাহী', 'lat' => '24.3740', 'lon' => '88.6011'],
            ['id' => '16', 'division_id' => '2', 'name' => 'Natore', 'bn_name' => 'নাটোর', 'lat' => '24.420556', 'lon' => '89.000282'],
            ['id' => '17', 'division_id' => '2', 'name' => 'Joypurhat', 'bn_name' => 'জয়পুরহাট', 'lat' => '25.1051', 'lon' => '89.0289'],
            ['id' => '18', 'division_id' => '2', 'name' => 'Chapainawabganj', 'bn_name' => 'চাঁপাইনবাবগঞ্জ', 'lat' => '24.5965034', 'lon' => '88.2775122'],
            ['id' => '19', 'division_id' => '2', 'name' => 'Naogaon', 'bn_name' => 'নওগাঁ', 'lat' => '24.9458', 'lon' => '88.4502'],
            ['id' => '20', 'division_id' => '3', 'name' => 'Jashore', 'bn_name' => 'যশোর', 'lat' => '23.16643', 'lon' => '89.2081126'],
            ['id' => '21', 'division_id' => '3', 'name' => 'Satkhira', 'bn_name' => 'সাতক্ষীরা', 'lat' => 22.35, 'lon' => 89.15],
            ['id' => '22', 'division_id' => '3', 'name' => 'Meherpur', 'bn_name' => 'মেহেরপুর', 'lat' => '23.762213', 'lon' => '88.631821'],
            ['id' => '23', 'division_id' => '3', 'name' => 'Narail', 'bn_name' => 'নড়াইল', 'lat' => '23.172534', 'lon' => '89.512672'],
            ['id' => '24', 'division_id' => '3', 'name' => 'Chuadanga', 'bn_name' => 'চুয়াডাঙ্গা', 'lat' => '23.6401961', 'lon' => '88.841841'],
            ['id' => '25', 'division_id' => '3', 'name' => 'Kushtia', 'bn_name' => 'কুষ্টিয়া', 'lat' => '23.901258', 'lon' => '89.120482'],
            ['id' => '26', 'division_id' => '3', 'name' => 'Magura', 'bn_name' => 'মাগুরা', 'lat' => '23.487337', 'lon' => '89.419956'],
            ['id' => '27', 'division_id' => '3', 'name' => 'Khulna', 'bn_name' => 'খুলনা', 'lat' => '22.815774', 'lon' => '89.568679'],
            ['id' => '28', 'division_id' => '3', 'name' => 'Bagerhat', 'bn_name' => 'বাগেরহাট', 'lat' => '22.651568', 'lon' => '89.785938'],
            ['id' => '29', 'division_id' => '3', 'name' => 'Jhenaidah', 'bn_name' => 'ঝিনাইদহ', 'lat' => '23.5448176', 'lon' => '89.1539213'],
            ['id' => '30', 'division_id' => '4', 'name' => 'Jhalakathi', 'bn_name' => 'ঝালকাঠি', 'lat' => 22.45, 'lon' => 90.17],
            ['id' => '31', 'division_id' => '4', 'name' => 'Patuakhali', 'bn_name' => 'পটুয়াখালী', 'lat' => '22.3596316', 'lon' => '90.3298712'],
            ['id' => '32', 'division_id' => '4', 'name' => 'Pirojpur', 'bn_name' => 'পিরোজপুর', 'lat' => 22.56, 'lon' => 89.96],
            ['id' => '33', 'division_id' => '4', 'name' => 'Barisal', 'bn_name' => 'বরিশাল', 'lat' => 22.7010, 'lon' => 90.3535],
            ['id' => '34', 'division_id' => '4', 'name' => 'Bhola', 'bn_name' => 'ভোলা', 'lat' => '22.685923', 'lon' => '90.648179'],
            ['id' => '35', 'division_id' => '4', 'name' => 'Barguna', 'bn_name' => 'বরগুনা', 'lat' => 22.0886, 'lon' => 90.0790],
            ['id' => '36', 'division_id' => '5', 'name' => 'Sylhet', 'bn_name' => 'সিলেট', 'lat' => '24.8897956', 'lon' => '91.8697894'],
            ['id' => '37', 'division_id' => '5', 'name' => 'Moulvibazar', 'bn_name' => 'মৌলভীবাজার', 'lat' => '24.482934', 'lon' => '91.777417'],
            ['id' => '38', 'division_id' => '5', 'name' => 'Habiganj', 'bn_name' => 'হবিগঞ্জ', 'lat' => '24.374945', 'lon' => '91.41553'],
            ['id' => '39', 'division_id' => '5', 'name' => 'Sunamganj', 'bn_name' => 'সুনামগঞ্জ', 'lat' => '25.0658042', 'lon' => '91.3950115'],
            ['id' => '40', 'division_id' => '6', 'name' => 'Narsingdi', 'bn_name' => 'নরসিংদী', 'lat' => '23.932233', 'lon' => '90.71541'],
            ['id' => '41', 'division_id' => '6', 'name' => 'Gazipur', 'bn_name' => 'গাজীপুর', 'lat' => '24.0022858', 'lon' => '90.4264283'],
            ['id' => '42', 'division_id' => '6', 'name' => 'Shariatpur', 'bn_name' => 'শরীয়তপুর', 'lat' => 23.2083, 'lon' => 90.7178],
            ['id' => '43', 'division_id' => '6', 'name' => 'Narayanganj', 'bn_name' => 'নারায়ণগঞ্জ', 'lat' => '23.63366', 'lon' => '90.496482'],
            ['id' => '44', 'division_id' => '6', 'name' => 'Tangail', 'bn_name' => 'টাঙ্গাইল', 'lat' => 24.2490, 'lon' => 89.9392],
            ['id' => '45', 'division_id' => '6', 'name' => 'Kishoreganj', 'bn_name' => 'কিশোরগঞ্জ', 'lat' => '24.444937', 'lon' => '90.776575'],
            ['id' => '46', 'division_id' => '6', 'name' => 'Manikganj', 'bn_name' => 'মানিকগঞ্জ', 'lat' => 23.8577, 'lon' => 90.0807],
            ['id' => '47', 'division_id' => '6', 'name' => 'Dhaka', 'bn_name' => 'ঢাকা', 'lat' => '23.7115253', 'lon' => '90.4111451'],
            ['id' => '48', 'division_id' => '6', 'name' => 'Munshiganj', 'bn_name' => 'মুন্সিগঞ্জ', 'lat' => 23.6183, 'lon' => 90.4971],
            ['id' => '49', 'division_id' => '6', 'name' => 'Rajbari', 'bn_name' => 'রাজবাড়ী', 'lat' => '23.7574305', 'lon' => '89.6444665'],
            ['id' => '50', 'division_id' => '6', 'name' => 'Madaripur', 'bn_name' => 'মাদারীপুর', 'lat' => '23.164102', 'lon' => '90.1896805'],
            ['id' => '51', 'division_id' => '6', 'name' => 'Gopalganj', 'bn_name' => 'গোপালগঞ্জ', 'lat' => '23.0050857', 'lon' => '89.8266059'],
            ['id' => '52', 'division_id' => '6', 'name' => 'Faridpur', 'bn_name' => 'ফরিদপুর', 'lat' => '23.6070822', 'lon' => '89.8429406'],
            ['id' => '53', 'division_id' => '7', 'name' => 'Panchagarh', 'bn_name' => 'পঞ্চগড়', 'lat' => '26.3411', 'lon' => '88.5541606'],
            ['id' => '54', 'division_id' => '7', 'name' => 'Dinajpur', 'bn_name' => 'দিনাজপুর', 'lat' => '25.6217061', 'lon' => '88.6354504'],
            ['id' => '55', 'division_id' => '7', 'name' => 'Lalmonirhat', 'bn_name' => 'লালমনিরহাট', 'lat' => 25.7600, 'lon' => 89.5354],
            ['id' => '56', 'division_id' => '7', 'name' => 'Nilphamari', 'bn_name' => 'নীলফামারী', 'lat' => '25.931794', 'lon' => '88.856006'],
            ['id' => '57', 'division_id' => '7', 'name' => 'Gaibandha', 'bn_name' => 'গাইবান্ধা', 'lat' => '25.328751', 'lon' => '89.528088'],
            ['id' => '58', 'division_id' => '7', 'name' => 'Thakurgaon', 'bn_name' => 'ঠাকুরগাঁও', 'lat' => '26.0336945', 'lon' => '88.4616834'],
            ['id' => '59', 'division_id' => '7', 'name' => 'Rangpur', 'bn_name' => 'রংপুর', 'lat' => '25.7558096', 'lon' => '89.244462'],
            ['id' => '60', 'division_id' => '7', 'name' => 'Kurigram', 'bn_name' => 'কুড়িগ্রাম', 'lat' => '25.805445', 'lon' => '89.636174'],
            ['id' => '61', 'division_id' => '8', 'name' => 'Sherpur', 'bn_name' => 'শেরপুর', 'lat' => '25.0204933', 'lon' => '90.0152966'],
            ['id' => '62', 'division_id' => '8', 'name' => 'Mymensingh', 'bn_name' => 'ময়মনসিংহ', 'lat' => 24.7474, 'lon' => 90.4110],
            ['id' => '63', 'division_id' => '8', 'name' => 'Jamalpur', 'bn_name' => 'জামালপুর', 'lat' => '24.937533', 'lon' => '89.937775'],
            ['id' => '64', 'division_id' => '8', 'name' => 'Netrokona', 'bn_name' => 'নেত্রকোণা', 'lat' => '24.870955', 'lon' => '90.727887'],
        ];

        try {

            // Truncate and reset if necessary
            DB::statement('SET FOREIGN_KEY_CHECKS=0');
            DB::table('districts')->truncate();
            DB::statement('ALTER TABLE districts AUTO_INCREMENT = 1');
            DB::statement('SET FOREIGN_KEY_CHECKS=1');


            DB::beginTransaction();
            DB::table('districts')->insert($districts);
            DB::commit();

            $this->command->info('Districts seeded successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Division seeder failed: ' . $e->getMessage());
            $this->command->error('Error seeding districts: ' . $e->getMessage());
        }
    }
}
