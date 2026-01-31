<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Donor;
use Carbon\Carbon;

class ProfileController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();

        // Donation count (from donor record if exists)
        $donor = Donor::where('user_id', $user->id)->first();
        $donationCount = $donor ? $donor->donation_count : 0;
        // $isAvailable = $donor ? $donor->is_available : false;

        // Request count (from blood_orders where requester is user)
        $requestCount = Order::where('requester_id', $user->id)->count();

        return response()->json([
            'donation_count' => $donationCount,
            'request_count' => $requestCount,
            //'is_available' => $isAvailable,
        ]);
    }

    public function lastDonate(Request $request)
    {
        $user = $request->user();
        $donor = Donor::where('user_id', $user->id)->first();
        $donor->last_donation_date = $request->last_donate;
        $donor->save();
        return response()->json([
            'message' => 'Last donate updated successfully',
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

        $requestedStatus = $request->is_available;

        // Turning OFF → always allowed
        if ($requestedStatus == false) {
            $donor->is_available = false;
            $donor->save();
            return response()->json([
                'message' => 'Availability turned off',
            ]);
        }
        $lastDonate = Carbon::parse($donor->last_donation_date);
        // Turning ON → validate 3 months rule
        if ($lastDonate->lte(now()->subMonths(3))) {
            $donor->is_available = true;
            $donor->save();
            return response()->json([
                'message' => 'Availability turned on',
            ]);
        }
        else
        {
            return response()->json([
                'message' => 'You can not turn on availability',
            ], 422);
        }
    }
}
