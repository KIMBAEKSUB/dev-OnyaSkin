<?php 
namespace App\Usecase\Image;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BestProductImageSearchAction
{
	private $limit;

	public function __construct(Request $request)
	{
		$this->limit = $request->limit;
	}

    public function __invoke()
    {
        $sql =<<<SQL
with po as (
	select
		uod.product_id
		, count(uod.product_amount)
	from
		user_order_detail uod
	group by
		uod.product_id
	order by 
		count desc
	limit :limit
), ph as (
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
	inner join po on po.product_id = p.product_id
	left join ph on p.product_id = ph.product_id 
where 
	p.del_flg = false 
SQL;
		$params = [];
		$params['limit'] = $this->limit;
        return DB::select($sql, $params);
    }
}