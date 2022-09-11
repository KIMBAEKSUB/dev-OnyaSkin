<?php

namespace App\Http\Controllers;

use App\Usecase\Product\FavoriteProdectCreateAction;
use App\Usecase\Product\prodectSearchAction;
use Illuminate\Http\Request;

class ProdectController extends Controller
{
    public function prodectSearchAction(Request $request)
    {
        $act = new prodectSearchAction();
        return $act($request);
    }

    public function favoritProdectCreateAction(Request $request)
    {
        $act = new FavoriteProdectCreateAction($request);
        return $act();
    }
}
