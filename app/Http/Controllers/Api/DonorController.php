<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Donor;

class DonorController extends Controller
{
    public function updateLastDonation(Request $request)
    {
        $user = $request->user();

        $request->validate([
            'last_donation_date' => 'required|date',
        ]);

        if (!$user->blood_group_id) {
            return response()->json([
                'message' => 'Please update your profile with blood group first',
            ], 422);
        }

        // Find or create donor record for the user
        $donor = Donor::updateOrCreate(
            ['user_id' => $user->id],
            [
                'last_donation_date' => $request->last_donation_date,
                // If creating for the first time, we might want to set blood_group_id from user if available, 
                // but since the user table has it now, maybe we should sync it or just rely on user table.
                // However, the donors table has a blood_group_id column as per schema.
                // Let's assume we should sync it if user has it, or require it. 
                // For now, I'll update it if the user has it set.
                'blood_group_id' => $user->blood_group_id,
            ]
        );

        return response()->json([
            'message' => 'Last donation date updated successfully',
            'donor' => $donor,
        ]);
    }

 /**
 * Get available donors sorted by location and last donation date
 */
public function findDonors(Request $request)
{
    $donors = Donor::query()
        ->select([
            'donors.donor_id',
            'donors.user_id',
            'donors.blood_group_id',
            'donors.last_donation_date',
            'donors.donation_count',
            'donors.rating',
            'donors.is_available',
            'donors.created_at',
            'users.division_id',
            'users.district_id',
            'users.upazila_id',
        ])
        ->join('users', 'donors.user_id', '=', 'users.id')
        ->where('donors.is_available', 1)
        ->whereDate('donors.last_donation_date', '<=', now()->subDays(90))
        ->with([
            'user:id,name,phone,division_id,district_id,upazila_id',
            'user.division:id,name',
            'user.district:id,name',
            'user.upazila:id,name',
            'bloodGroup:id,blood_group_name',
        ])
        ->orderBy('users.division_id')
        ->orderBy('users.district_id')
        ->orderBy('users.upazila_id')
        ->orderBy('donors.last_donation_date', 'asc')
        ->get();

    return response()->json([
        'code' => 200,
        'message' => 'Donors fetched successfully',
        'data' => $donors
    ], 200);
}


}
