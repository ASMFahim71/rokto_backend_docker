<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Division;
use App\Models\Upazila;
use Illuminate\Http\Request;

class AddressController extends Controller
{
    public function divisions()
    {
        $divisions = Division::all();
        return response()->json([
            'status' => true,
            'data' => $divisions,
        ]);
    }

    public function districts($divisionId)
    {
        $districts = District::where('division_id', $divisionId)->get();
        return response()->json([
            'status' => true,
            'data' => $districts,
        ]);
    }

    public function upazilas($districtId)
    {
        $upazilas = Upazila::where('district_id', $districtId)->get();
        return response()->json([
            'status' => true,
            'data' => $upazilas,
        ]);
    }
}
