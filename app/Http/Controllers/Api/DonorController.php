<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Donor;
use App\Models\Upazila;
use App\Models\District;

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
        $user = $request->user();

        if (!$user->upazila_id) {
            return response()->json([
                'code' => 200,
                'message' => 'User location not set',
                'data' => []
            ], 200);
        }

        $donors = Donor::query()
            ->select([
                'donors.*',
                'users.division_id',
                'users.district_id',
                'users.upazila_id',
                // 'users.latitude as user_lat',
                // 'users.longitude as user_lon'
            ])
            ->join('users', 'donors.user_id', '=', 'users.id')
            ->where('donors.is_available', 1)
            ->whereDate('donors.last_donation_date', '<=', now()->subDays(90))
            ->where('users.upazila_id', $user->upazila_id)
            ->when($request->blood_group_id, function ($query) use ($request) {
                return $query->where('donors.blood_group_id', $request->blood_group_id);
            })
            ->with([
                'user:id,name,phone,division_id,district_id,upazila_id',
                'user.division:id,name',
                'user.district:id,name',
                'user.upazila:id,name',
                'bloodGroup:id,blood_group_name',
            ])
            ->orderBy('donors.last_donation_date', 'asc')
            ->limit(10)
            ->get();

        return response()->json([
            'code' => 200,
            'message' => 'Donors fetched successfully',
            'data' => $donors
        ], 200);
    }


    public function findDonorsByLocation(Request $request)
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
            ->when($request->blood_group_id, function ($query) use ($request) {
                return $query->where('donors.blood_group_id', $request->blood_group_id);
            })
            ->when($request->division_id, function ($query) use ($request) {
                return $query->where('users.division_id', $request->division_id);
            })
            ->when($request->district_id, function ($query) use ($request) {
                return $query->where('users.district_id', $request->district_id);
            })
            ->when($request->upazila_id, function ($query) use ($request) {
                return $query->where('users.upazila_id', $request->upazila_id);
            })
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
