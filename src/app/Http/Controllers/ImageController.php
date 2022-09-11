<?php

namespace App\Http\Controllers;

use App\Usecase\Image\BestProductImageSearchAction;
use App\Usecase\Image\CommonImageSearchAction;
use App\Usecase\Image\ProductImageSearchAction;
use Illuminate\Http\Request;

class ImageController extends Controller
{
    public function commonImageSearchAction(Request $request)
    {
        $act = new CommonImageSearchAction($request);
        return $act();
    }

    public function bestProductImageSearchAction(Request $request)
    {
        $act = new BestProductImageSearchAction($request);
        return $act();
    }

    public function productImageSearchAction(Request $request)
    {
        $act = new ProductImageSearchAction($request);
        return $act();
    }
}
