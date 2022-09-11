<?php

namespace App\Http\Controllers;

use App\Usecase\User\UserAuthorticationAction;
use App\Usecase\User\UserCreateAction;
use App\Usecase\User\UserIndevidualIdSearchAction;
use App\Usecase\User\UserInfoSearchAction;
use Illuminate\Http\Request;

class UserController extends Controller
{
    function userIdSearchAction(Request $request)
    {
        $act = new UserIndevidualIdSearchAction($request);
        return $act();
    }

    function userCreateAction(Request $request)
    {
        $act = new UserCreateAction($request);
        return $act();
    }

    function userAuthorticationAction(Request $request)
    {
        $act = new UserAuthorticationAction($request);
        return $act();
    }

    function userInfoSearchAction(Request $request)
    {
        $act = new UserInfoSearchAction($request);
        return $act();
    }
}
