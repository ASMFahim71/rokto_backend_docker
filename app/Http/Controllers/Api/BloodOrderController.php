<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;

class BloodOrderController extends Controller
{
    /**
     * Display a listing of the resource.Not these are outdated orders
     */
    public function orders()
    {
        $orders = Order::with(['division', 'district', 'upazila', 'bloodGroup'])
            ->where('requester_id', '!=', auth()->id())
            ->orderBy('date','desc')
            ->whereDate('date','>=',now()->toDateString())
            ->get()
            ->map(function ($order) {
                $order->division_name = $order->division->name ?? null;
                $order->district_name = $order->district->name ?? null;
                $order->upazila_name = $order->upazila->name ?? null;
                $order->blood_group_name = $order->bloodGroup->blood_group_name ?? null;
                unset($order->division, $order->district, $order->upazila, $order->bloodGroup);
                return $order;
            });
        return response()->json([
            'code'=>200,
            'message'=>'Orders fetched successfully',
            'data'=>$orders
        ],200);
    }

    /**
     * Display own requests
     */
    public function ownRequests()
    {
        $orders = Order::with(['division', 'district', 'upazila', 'bloodGroup'])
            ->where('requester_id', auth()->id())
            ->orderBy('date','desc')
            ->get()
            ->map(function ($order) {
                $order->division_name = $order->division->name ?? null;
                $order->district_name = $order->district->name ?? null;
                $order->upazila_name = $order->upazila->name ?? null;
                $order->blood_group_name = $order->bloodGroup->blood_group_name ?? null;
                unset($order->division, $order->district, $order->upazila, $order->bloodGroup);
                return $order;
            });
        return response()->json([
            'code'=>200,
            'message'=>'Orders fetched successfully',
            'data'=>$orders
        ],200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'blood_group_id' => 'required|exists:blood_groups,id',
            'division_id' => 'required|exists:divisions,id',
            'district_id' => 'required|exists:districts,id',
            'upazila_id' => 'required|exists:upazilas,id',
            'date' => 'required|date',
            'time' => 'required|date_format:H:i:s',
            'hospital_name' => 'required|string',
            'contact_number' => 'required|string',
            'cause' => 'required|string',
            'place' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'code' => 422,
                'message' => 'Validation Error',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $order = Order::create([
                'requester_id' => auth()->id(),
                'blood_group_id' => $request->blood_group_id,
                'division_id' => $request->division_id,
                'district_id' => $request->district_id,
                'upazila_id' => $request->upazila_id,
                'date' => $request->date,
                'time' => $request->time,
                'hospital_name' => $request->hospital_name,
                'contact_number' => $request->contact_number,
                'cause' => $request->cause,
                'place' => $request->place,
                'gender' => $request->gender, // Optional as per schema
            ]);
            
            $order->load(['division', 'district', 'upazila', 'bloodGroup']);
            $order->division_name = $order->division->name ?? null;
            $order->district_name = $order->district->name ?? null;
            $order->upazila_name = $order->upazila->name ?? null;
            $order->blood_group_name = $order->bloodGroup->blood_group_name ?? null;
            unset($order->division, $order->district, $order->upazila, $order->bloodGroup);

            return response()->json([
                'code' => 201,
                'message' => 'Blood order created successfully',
                'data' => $order
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'code' => 500,
                'message' => 'Failed to create blood order',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
