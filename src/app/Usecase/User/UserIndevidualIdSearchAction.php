<?php 
namespace App\Usecase\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserIndevidualIdSearchAction
{
    private $_userIndevidualId;

    private function userIndevidualId() { return $this->_userIndevidualId; }
    private function setUserIndevidualId($value) { $this->_userIndevidualId = $value; }

    public function __construct(Request $request)
    {
        $this->validateUserIndevidualId($request);

        $this->setUserIndevidualId($request->userIndevidualId);
    }

    private function validateUserIndevidualId(Request $request)
    {
        $request->validate(
            [
                'userIndevidualId'=>'alpha_dash'
            ],
            [
                'userIndevidualId.alpha_dash' => 'user id is not available',
            ],
        );
    }

    public function __invoke()
    {
        $result = $this->IsExistsUserIndevidualId();
        return response()->json($result);
    }

    private function IsExistsUserIndevidualId()
    {
        $request = $this->getUserIndevidualId();
        if(empty($request))
        {
            return true;
        }
        return false;
    }

    private function getUserIndevidualId()
    {
        $sql =<<<SQL
select
	true
from
	"user" u
where 
	u.user_indevidual_id = :user_indevidual_id
SQL;

        $params = [];
        $params['user_indevidual_id'] = $this->userIndevidualId();
        return DB::select($sql, $params);
    }
}