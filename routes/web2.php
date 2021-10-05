<?php

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

Route::get('/transaksi',  'TransaksiController@index');
Route::get('/dashboard', function () {
    return view('dashboard');
});
Route::post('/bukubesar/transaksi', 'TransaksiController@prosestransaksi');
Route::get('/BukuBesar', 'BukuBesarController@index');
Route::match(['get','post'],'/BukuBesar/cari', 'BukuBesarController@tampilkan');
Route::get('/neracaLajur', 'NeracaLajurController@index');
Route::post('/neracaLajur/cari', 'NeracaLajurController@cari');



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
/*Route::middleware('role:admin')->get('/dashboard', function() {
    return "Dashboard";
})->name('dashboard');*/

Route::middleware('role:Yayasan')->match(['get','post'],'admin','adminController@edit')->name('dashboard');

Route::match(['get','post'],'crud/{id}/edit','adminController@edit')->name('edit');


Route::patch('update/{id}','adminController@update')->name('update');






