<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Donor;

class ProfileController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();

        // Donation count (from donor record if exists)
        $donor = Donor::where('user_id', $user->id)->first();
        $donationCount = $donor ? $donor->donation_count : 0;
        $isAvailable = $donor ? $donor->is_available : false;

        // Request count (from blood_orders where requester is user)
        $requestCount = Order::where('requester_id', $user->id)->count();

        return response()->json([
            'donation_count' => $donationCount,
            'request_count' => $requestCount,
            'is_available' => $isAvailable,
        ]);
    }

    public function status(Request $request)
    {
        $user = $request->user();

        // Ensure donor record exists (it should if they want to toggle availability, or we create one)
        // If they toggle availability but don't have a donor record, we should probably create one?
        // But creating one requires blood group. If they have blood group in user profile, we can use it.

        if (!$user->blood_group_id) {
            return response()->json([
                'message' => 'Please update your profile with blood group first',
            ], 422);
        }

        $donor = Donor::firstOrCreate(
            ['user_id' => $user->id],
            [
                'blood_group_id' => $user->blood_group_id,
                'donation_count' => 0,
                'rating' => 0,
                'is_available' => false
            ]
        );

        // If it was just created, we set it. If it existed, we toggle it.
        // Wait, the detailed logic: 
        // If created just now, we set values. 
        // If we want to strictly toggle:

        $donor->is_available = !$donor->is_available;
        $donor->save();

        return response()->json([
            'message' => 'Status updated successfully',
            'is_available' => $donor->is_available,
        ]);
    }
}
