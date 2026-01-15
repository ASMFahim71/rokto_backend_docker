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
        $latitude = null;
        $longitude = null;

        // Determine reference location: Upazila -> District
        if ($user->upazila_id) {
            $upazila = Upazila::find($user->upazila_id);
            if ($upazila && $upazila->lat && $upazila->lon) {
                $latitude = $upazila->lat;
                $longitude = $upazila->lon;
            }
        }

        if (!$latitude && $user->district_id) {
            $district = District::find($user->district_id);
            if ($district && $district->lat && $district->lon) {
                $latitude = $district->lat;
                $longitude = $district->lon;
            }
        }

        $query = Donor::query()
            ->select([
                'donors.*',
                'users.division_id',
                'users.district_id',
                'users.upazila_id',
                'users.latitude as user_lat',
                'users.longitude as user_lon'
            ])
            ->join('users', 'donors.user_id', '=', 'users.id')
            ->where('donors.is_available', 1)
            ->whereDate('donors.last_donation_date', '<=', now()->subDays(90))
            ->when($request->blood_group_id, function ($query) use ($request) {
                return $query->where('donors.blood_group_id', $request->blood_group_id);
            })
            ->with([
                'user:id,name,phone,division_id,district_id,upazila_id',
                'user.division:id,name',
                'user.district:id,name',
                'user.upazila:id,name',
                'bloodGroup:id,blood_group_name',
            ]);

        // If we have a valid reference location, calculate distance
        if ($latitude && $longitude) {
            $haversine = "(6371 * acos(cos(radians($latitude)) 
                        * cos(radians(users.latitude)) 
                        * cos(radians(users.longitude) - radians($longitude)) 
                        + sin(radians($latitude)) 
                        * sin(radians(users.latitude))))";
            
            $query->selectRaw("{$haversine} AS distance")
                  ->orderByRaw('distance IS NULL, distance ASC');
        } else {
            // Fallback sorting if no location found
            $query->orderBy('users.division_id')
                  ->orderBy('users.district_id')
                  ->orderBy('users.upazila_id');
        }

        $donors = $query->orderBy('donors.last_donation_date', 'asc')
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
