<?php

use App\Http\Controllers\API\TaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::middleware('auth:sanctum')->group(function () {111111

    Route::prefix('task')->group(function () {
        Route::get('/', [TaskController::class, 'index']);
        Route::get('{id}', [TaskController::class, 'get']);
        Route::post('/', [TaskController::class, 'post']);
        Route::put('{id}', [TaskController::class, 'put']);
        Route::delete('{id}', [TaskController::class, 'del']);
    });
//});
