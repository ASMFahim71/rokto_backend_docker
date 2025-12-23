<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AddressController;
use App\Http\Controllers\Api\BloodOrderController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/orders', [BloodOrderController::class, 'orders']);

Route::post('/divisions', [AddressController::class, 'divisions']);
Route::post('/divisions/{divisionId}/districts', [AddressController::class, 'districts']);
Route::post('/districts/{districtId}/upazilas', [AddressController::class, 'upazilas']);
