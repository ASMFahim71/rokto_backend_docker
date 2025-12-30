<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AddressController;
use App\Http\Controllers\Api\BloodOrderController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\DonorController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/orders', [BloodOrderController::class, 'orders']);

Route::post('/divisions', [AddressController::class, 'divisions']);
Route::post('/divisions/{divisionId}/districts', [AddressController::class, 'districts']);
Route::post('/districts/{districtId}/upazilas', [AddressController::class, 'upazilas']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/update-profile', [AuthController::class, 'updateprofile']);
    Route::post('/update-last-donation', [DonorController::class, 'updateLastDonation']);
    Route::post('/find-donors', [DonorController::class, 'findDonors']);
    Route::post('/create-blood-order', [BloodOrderController::class, 'store']);
    Route::post('/own-requests', [BloodOrderController::class, 'ownRequests']);
    Route::post('/profile', [ProfileController::class, 'index']);
    Route::post('/profile/status', [ProfileController::class, 'status']);
});
