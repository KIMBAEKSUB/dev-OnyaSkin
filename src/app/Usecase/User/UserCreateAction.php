<?php 
namespace App\Usecase\User;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserCreateAction
{
    private $userIndevidualId;

    private $userName;

    private $userPassword;

    private $userEmail;

    public function __construct(Request $request)
    {
        $request->validate(
            [
                'userIndevidualId' => 'bail|required|alpha_dash',
                'userName' => 'bail|required|alpha_dash',
                'userEmail' => 'bail|required|email',
                'userPassword'=> 'string'
            ],
            [
                'required' => ':attribute must be required',
                'userName.alpha_dash'=> 'user Name is not alpha_dash',
                'userPassword.string'=> 'password is required with string',
            ]
        );
        
        $this->userIndevidualId = $request->userIndevidualId;
        $this->userName = $request->userName;
        $this->userPassword = $request->userPassword;
        $this->userEmail = $request->userEmail;
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
            $data['message'] = 'There are some server error. please contact us. tel : 01000000000';
        }
        finally
        {
            return response()->json($data, $status);
        }
    }

    private function excuteTask()
    {
        DB::transaction(function () {
            $this->createUserRow();
            $this->createUserPasswordRow();
        });
    }

    private function createUserRow()
    {
        $row = $this->insertUser();
        $this->validateInsertResult($row);
    }

    private function insertUser()
    {
        $sql =<<<SQL
insert into "user" 
(
	user_indevidual_id 
	, user_address 
	, user_tel
	, user_name 
	, del_flg 
	, updated_date_time 
	, created_date_time 
    , user_email
)
values
( 
	:user_indevidual_id
	, ''
	, ''
	, :user_name
	, false
	, current_timestamp
	, current_timestamp
    , :user_email
)
SQL;
        $params = [];
        $params['user_indevidual_id'] = $this->userIndevidualId;
        $params['user_name'] = $this->userName;
        $params['user_email'] = $this->userEmail;
        return DB::insert($sql, $params);
    }
    private function validateInsertResult($row)
    {
        if($row !== true)
        {
            throw new Exception();
        }
    }

    private function createUserPasswordRow()
    {
        $password = Hash::make($this->userPassword);
        $row = $this->insertUserPassword($password);
        $this->validateInsertResult($row);
    }

    private function insertUserPassword($password)
    {
        $sql =<<<SQL
insert into user_password 
(
	user_indevidual_id 
	, created_date_time 
	, updated_date_time
    , user_password
    , del_flg
)
values 
(
	:user_indevidual_id
	, current_timestamp
	, current_timestamp
    , :user_password
    , false
);
SQL;
        $params = [];
        $params['user_indevidual_id'] = $this->userIndevidualId;
        $params['user_password'] = $password;
        return DB::insert($sql, $params);
    }
}