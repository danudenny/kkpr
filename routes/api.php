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


Route::middleware(['cors'])->group(function () {
    Route::get('/pola-ruang', [PolaRuangController::class, 'index']);
    Route::get('/pola-ruang/name-obj', [PolaRuangController::class, 'getNameObj']);
    Route::get('/pola-ruang/kecamatan', [PolaRuangController::class, 'getKecamatan']);
    Route::get('/pola-ruang/jenis-sarana', [PolaRuangController::class, 'getJenisSarana']);
    Route::post('/pola-ruang/search', [PolaRuangController::class, 'search']);
});