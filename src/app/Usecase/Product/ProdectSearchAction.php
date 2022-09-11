<?php 
namespace App\Usecase\Product;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class prodectSearchAction
{
    public function __invoke(Request $request)
    {
        $sql =<<<SQL
with ph as (
	select
		ph.product_id
		, count(ph.product_heart_id) as product_heart_count
	from
		product_heart ph
	where
		ph.del_flg = false
	group by
		ph.product_id
) 
select
	p.product_id 
	, p.product_name
	, p.product_price::money
	, p.product_explain
	, p.product_code
	, p.product_kind_kbn 
	, coalesce(ph.product_heart_count, 0) as product_heart_count
from 
	product p
	left join ph on p.product_id = ph.product_id 
where 
	p.product_kind_kbn = :product_kind_kbn
	and p.del_flg = false;
SQL;
		$params = [];
		$params['product_kind_kbn'] = $request->prod_kbn;
        return DB::select($sql, $params);

        
    }
}