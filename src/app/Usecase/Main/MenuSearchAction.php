<?php 
namespace App\Usecase\Main;

use Illuminate\Support\Facades\DB;

class MenuSearchAction
{
    public function __invoke()
    {
        $sql =<<<SQL
select
    *
from
    master.menu m
where 
    m.del_flg = false
SQL;
        return DB::select($sql);
    }
}