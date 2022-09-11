<?php 
namespace App\Usecase\Image;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CommonImageSearchAction
{
    private $fileName;

    public function __construct(Request $request)
    {
        $this->fileName = $request->imageId;
    }

    public function __invoke()
    {
        $file = Storage::disk('commonImage')->get($this->fileName);
        return $file;
    }
}