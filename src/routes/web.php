<?php

use App\Http\Controllers\ImageController;
use App\Http\Controllers\MainPageController;
use App\Http\Controllers\ProdectController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('server')->group(function(){
    Route::prefix('/main')->group(function () {
        Route::get('/menu/get', [MainPageController::class, 'menuSearchAction']);
    });
    Route::prefix('/user')->group(function() {
        Route::get('/{userIndevidualId}/search', [UserController::class, 'userIdSearchAction']);
        Route::post('/{userName}/{userEmail}/search', [UserController::class, 'userInfoSearchAction']);
        Route::post('/{userIndevidualId}/authoritication', [UserController::class, 'userAuthorticationAction']);
        Route::post('/create', [UserController::class, 'userCreateAction']);
    });
    Route::prefix('/img')->group(function () {
        Route::get('common/{imageId}/get', [ImageController::class, 'commonImageSearchAction']);
        Route::get('prod/{imageId}/get', [ImageController::class, 'productImageSearchAction']);
        Route::get('prod/best/{limit}/get', [ImageController::class, 'bestProductImageSearchAction']);
    });
    Route::prefix('/prod')->group(function() {
        Route::post('/get', [ProdectController::class, 'prodectSearchAction']);
        Route::post('/favorite/edit', [ProdectController::class, 'favoritProdectCreateAction'] );
    });
});