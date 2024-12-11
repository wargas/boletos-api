<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return ['version' => 0.1];
});
