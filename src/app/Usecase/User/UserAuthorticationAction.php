<?php 
namespace App\Usecase\User;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserAuthorticationAction
{
    private $userIndevidualId;

    private $userPassword;

    public function __construct(Request $request)
    {
        $this->validateLoginForm($request);
        $this->userIndevidualId = $request->userIndevidualId;
        $this->userPassword = $request->userPassword;
    }

    private function validateLoginForm(Request $request)
    {
        $request->validate(
            [
                'userIndevidualId'=>'bail|required|alpha_dash',
                'userPassword'=>'bail|required|string',
            ],
            [
                'required' => ':attribute must be required',
                'userName.alpha_dash'=> 'user Name is not alpha_dash',
                'userPassword.string'=> 'password is required with string',
            ]
        );
    }

    public function __invoke()
    {
        $data = [];
        $status = 500;
        try
        {
            $this->excuteTask();
            session()->put(['userId'=>$this->userIndevidualId]);
            $data['userIndevidualId'] = $this->userIndevidualId;
            $status = 200;
        }
        catch(Exception $e)
        {
            $data['message'] = $e->getMessage() || 'There are some server error. please contact us. tel : 01000000000';
        }
        finally
        {
            return response()->json($data, $status);
        }
        
    }

    private function excuteTask()
    {
        $hashedUserPassword = $this->getHashedUserPassword();
        if(! $hashedUserPassword)
        {
            return new Exception('the user Id or Password is not available');
        }

        if(! $this->validatePassword($hashedUserPassword))
        {
            return new Exception('the user Id or Password is not available');
        }
    }

    private function validatePassword($hashedUserPassword)
    {
        return Hash::check($this->userPassword, $hashedUserPassword[0]->user_password);
    }

    private function getHashedUserPassword()
    {
        $sql =<<<SQL
select
	up.user_password
from
	user_password up
where 
	up.user_indevidual_id = :user_indevidual_id
SQL;
        $params = [];
        $params['user_indevidual_id'] = $this->userIndevidualId;
        return DB::select($sql, $params);
    }
}