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
}
