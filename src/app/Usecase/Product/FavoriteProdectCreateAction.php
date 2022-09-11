<?php 
namespace App\Usecase\Product;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FavoriteProdectCreateAction
{
    private $use_indevidualId;

    private $product_id;

    public function __construct(Request $request)
    {
        $request->validate(
            [
                'use_indevidualId' => 'required',
                'product_id' => 'required',
            ]
        );
        $this->use_indevidualId = $request->use_indevidualId;
        $this->product_id = $request->product_id;
    }

    public function __invoke()
    {
        $result = $this->addProductHeart();
        return response()->json($result);
    }

    private function addProductHeart()
    {
        $result = false;
        DB::transaction(function() use (&$result) {
            $result = $this->excuteSql();
            if( !$result )
            { 
                throw new Exception("");  
            }
        });
        return $result;
    }

    private function excuteSql()
    {
        $sql=<<<SQL
        insert into product_heart
        (
            user_id 
            , product_id 
            , del_flg 
            , created_date_time 
            , updated_date_time 
        )
        select
            user_id 
            , :product_id 
            , false
            , current_timestamp
            , current_timestamp 
        from
            "user" u
        where 
            u.user_indevidual_id = :use_indevidualId;
SQL;
                $params = [];
                $params['use_indevidualId'] = $this->use_indevidualId;
                $params['product_id'] = $this->product_id;
                return DB::insert($sql, $params);
    }
}