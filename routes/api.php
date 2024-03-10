<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\PolaRuangController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::group(['prefix' => 'pola-ruang'], function () {
    Route::get('/', [PolaRuangController::class, 'index']);
    Route::get('/name-obj', [PolaRuangController::class, 'getNameObj']);
    Route::get('/kecamatan', [PolaRuangController::class, 'getKecamatan']);
    Route::get('/jenis-sarana', [PolaRuangController::class, 'getJenisSarana']);
    Route::post('/search', [PolaRuangController::class, 'search']);
});