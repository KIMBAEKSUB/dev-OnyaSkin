<?php 
namespace App\Usecase\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserInfoSearchAction
{
    private $userName;

    private $userEmail;

    public function __construct(Request $request)
    {
        $this->validateUserInfo($request);

        $this -> userName = $request -> userName;
        
        $this -> userEmail = $request -> userEmail;
    }

    private function validateUserInfo(Request $request)
    {
        $request->validate(
            [
                'userName' => 'bail|required|alpha_dash',
                'userEmail' => 'bail|required|email',
            ],
            [
                'required' => ':attribute must be required',
                'alpha_dash' => ':attribute is not alpha_dash'
            ]
        );
    }

    public function __invoke()
    {
        $data = $this->selectUser();
        return response()->json($data);
    }

    private function selectUser()
    {
        $sql =<<<SQL
select 
*
from 
	"user" u 
where 
	u.user_name = :user_name
	and u.user_email = :user_email 
SQL;
        $params = [];
        $params['user_name'] = $this->userName;
        $params['user_email'] = $this->userEmail;
        return DB::select($sql, $params);
    }

}