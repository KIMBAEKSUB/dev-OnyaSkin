<?php 
namespace App\Usecase\Image;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductImageSearchAction
{
    private $fileName;

    public function __construct(Request $request)
    {
        $this->fileName = $request->imageId . '.png';
    }

    public function __invoke()
    {
        $file = Storage::disk('prodImage')->get($this->fileName); 
        return $file;
    }
}