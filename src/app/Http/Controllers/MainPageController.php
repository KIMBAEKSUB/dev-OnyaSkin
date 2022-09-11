<?php

namespace App\Http\Controllers;

use App\Usecase\Main\MenuSearchAction;

class MainPageController extends Controller
{
    function menuSearchAction()
    {
        $act = new MenuSearchAction();
        return $act();
    }
}
