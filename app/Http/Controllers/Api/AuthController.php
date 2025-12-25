<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Models\BloodGroup;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'phone' => 'required|string|max:11|unique:users',
            'password' => 'required|string|min:8',
        ]);



        $user = User::create($validated);

        $token = $user->createToken('auth-token')->plainTextToken;

        return response()->json([
            'message' => 'User registered successfully',
            'user' => $user,
            'token' => $token,
        ], 201);
    }

    public function login(Request $request)
    {
        $user = $request->validate([
            'phone' => 'required',
            'password' => 'required',
        ]);

        $user = User::where('phone', $request->phone)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'Invalid credentials',
            ], 401);
        }
        $token = $user->createToken('auth-token')->plainTextToken;
        return response()->json([
            'user' => $user,
            'token' => $token,
        ], 200);
    }
    public function updateprofile(Request $request)
    {
        $user = $request->user();

        $validated = $request->validate([
            'division_id' => 'required|exists:divisions,id',
            'district_id' => 'required|exists:districts,id',
            'upazila_id' => 'required|exists:upazilas,id',
            'blood_group_id' => 'required|exists:blood_groups,id',
        ]);

        $user->update($validated);

        $updatedUser = User::with([
            'division:id,name',
            'district:id,name',
            'upazila:id,name',
            'bloodGroup:id,blood_group_name'
        ])->find($user->id);

        $updatedUser->makeHidden([
            'division_id',
            'district_id',
            'upazila_id',
            'blood_group_id',
            'created_at',
            'updated_at',
            'latitude',
            'longitude',
            'email_verified_at'
        ]);

        return response()->json([
            'user' => $updatedUser,
        ]);
    }
}
