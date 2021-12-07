<?php
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Auth extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        parent::__construct();
        $this->load->helper('url');
        $this->load->model('users_model');
        $this->load->model('HealthWorker_model');
        $this->load->model('BloodDonor_model');
        $this->load->model('Institution_model');
    }

    public function login_post() //anymedion is working with otp way so not using this pws login now
    {
        $u = $this->input_data['email_id']; //Username Posted
        $p = md5($this->input_data['password']); // Pasword Posted
        $jwt_key = $this->config->item('jwt_key');
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid Login']; //Respon if login invalid
        $val = $this->users_model->get_by_email_user($u); //Model to get single data row from database base on username
        if (!$val) {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }
        $match = $val->password;   //Get password for user from database
        if ($p == $match) {  //Condition if password matched
            $token['id'] = $val->id;  //From here
            $token['name'] = $val->name;  //From here
            $token['username'] = $u;
            $date = new DateTime();
            $token['iat'] = $date->getTimestamp();
            $token['exp'] = $date->getTimestamp() + 60 * 60 * 48; //To here is to generate token
            $output['token'] = 'Bearer ' . JWT::encode($token, $jwt_key); //This is the output token
            $val->password = NULL;
            $output['user'] = $val;
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'output' => $output
            ], self::HTTP_OK);
            // $this->set_response($output, self::HTTP_OK); //This is the respon if success
        } else {
            $this->set_response($invalidLogin, self::HTTP_CREATED); //This is the respon if failed
        }
    }


    /**
     * @api {post} auth/fetch_userdata  Fetch Userdata
     * @apiName User fetch_userdata
     * @apiGroup User
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiSuccessExample {json} Success-Response:
                   {
                        "status": true,
                        "message": "success",
                        "output": {
                            "id": "14",
                            "firstName": "latest institution",
                            "lastName": "",
                            "phone": "8989667755",
                            "address_line_1": "address 1",
                            "address_line_2": "address 2",
                            "city": "thrissur",
                            "state": "keral",
                            "country": "india",
                            "zip": "854854",
                            "email": "pn@gmail.com",
                            "gender": "",
                            "user_type": "0",
                            "status": "1",
                            "package-id": "1",
                            "date": "2021-03-23 11:24:54"
                        }
                    }
     * @apiErrorExample {json} Error-Response:
                   {
                        "status": false,
                        "message": "Invalid User"
                    }
     */

    public function fetch_userdata_post() //must provide header tockens(jwt) for invoking this function
    {
        $this->auth();
        $userid = $this->user_data->id;
        $val = $this->users_model->find($userid);
        if (!$val) {
            $this->response(['status' => FALSE, 'message' => 'Invalid User'], self::HTTP_CREATED);
        }
        unset($val->dob);
        unset($val->username);
        unset($val->password);
        unset($val->otp);
        unset($val->exp_otp);
        // if($val->image != ''){
        //     $val->image = base_url()."uploads/profile/".$val->image;
        // }
        $data['status'] = TRUE;
        $data['message'] = 'success';
        $data['output'] = $val;
        $this->set_response($data, self::HTTP_OK);
    }




    public function bloodDonor_profile_get()
    {

        $this->auth();
        $utype = $this->user_data->user_type; // 0 for professional and 1 for customer
        $userid = $this->user_data->id;

        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User']; //Respon if login invalid
        if ($utype == '3') {
            $val = $this->BloodDonor_model->fintBlood($userid);
            $output1 = $this->BloodDonor_model->donation_history($userid);
        } else {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }

        if (!$val) {
            $this->response($invalidLogin, self::HTTP_CREATED);
        } else {
            unset($val->password);
            unset($val->otp);
            unset($val->exp_otp);
            // if($val->profile_pic == ''){
            //     $val->profile_pic = base_url()."uploads/profile_image/default.jpg";
            // }
            // else{
            //     $val->profile_pic = base_url()."uploads/customer_image/".$val->profile_pic;
            // }
            // $data['user'] = $val;
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'user' => $val,
                'donated_details' => $output1
            ], self::HTTP_OK);
        }
    }



    /**
     * @api {post} auth/registration Registration
     * @apiName User Registration
     * @apiGroup User
     *
     * * @apiParamExample {json} Request-Example:
                {
                    "email_id":"amal@gmail.com",
                    "name":"amal",
                    "place":"kerala",
                    "longitude":"72.45",
                    "latitude":"72.4534",
                    "gender":"male",
                    "phone":"7896325685",
                    "user_type":"1"
                   
                }

     * @apiParamExample {json} Request-Example:
                {
                    "email_id":"amal@gmail.com",
                    "name":"amal",
                    "place":"kerala",
                     "longitude":"72.45",
                    "latitude":"72.4534",
                    "gender":"male",
                    "phone":"7896325685",
                    "user_type":"2",
                    "reg_no":"7969",
                    "designation":"nurse",
                    "orgnization":"amala hospital",
                    "organization_place":"amala"
                }

     *  @apiParamExample {json} Request-Example:
                {
                    "email_id":"amal@gmail.com",
                    "name":"amal",
                    "place":"kerala",
                    "longitude":"72.45",
                    "latitude":"72.4534",
                    "gender":"male",
                    "phone":"7896325685",
                    "user_type":"3",
                    "reg_no":"7969",
                    "institution_place":"amala"
                }


     *
     * @apiSuccessExample {json} Success-Response:
                  {
                    "status": true,
                    "message": "Registration Successfull"
                  }

     * @apiErrorExample {json} Error-Response:
                   {
                        "status": false,
                        "message": "Invalid Registration"
                    }
     */
    public function registration_post() // type 1 for public , type 2 for health worker
    {

        // $this->auth();
        // $userid = $this->user_data->id;
        // $user_data = $this->users_model->find($userid);



        $emailid = $this->input_data['email_id']; //Email Posted
        $name = $this->input_data['name'];
        $post_data = array();
        $post_data['firstName'] = $name;
        $post_data['email'] = $emailid;
        $post_data['status'] = 1;
        $post_data['place'] = $this->input_data['place'];
        $post_data['longitude'] = $this->input_data['longitude'];
        $post_data['latitude'] = $this->input_data['latitude'];
        $post_data['gender'] = $this->input_data['gender'];
        $post_data['phone'] = $this->input_data['phone'];
        $userType = $this->input_data['user_type'];
        $post_data['user_type'] = $userType;



        $invalidLogin = [
            'status' => FALSE,
            'message' => 'Invalid Registration'
        ];  //Respon if login invalid

        if (empty($userType)) {
            $this->set_response($invalidLogin, self::HTTP_CREATED); //This is the respon if failed  
        }

        if ($userType == 2) //health worker
        {
            $user_Id = $this->users_model->create($post_data); //insert into users table and get userid

            $post_data1['user_id'] = $user_Id;
            $post_data1['reg_id'] = $this->input_data['reg_no'];
            $post_data1['designation'] = $this->input_data['designation'];
            $post_data1['orgnization'] = $this->input_data['orgnization'];
            $post_data1['organization_place'] = $this->input_data['organization_place'];

            $insertId = $this->HealthWorker_model->create($post_data1);
            if ($insertId) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Registration Successfull'
                ], self::HTTP_OK);
            } else {
                $this->set_response($invalidLogin, self::HTTP_CREATED); //This is the respon if failed
            }
        } elseif ($userType == 3) //insert data to institution table 
        {
            $user_Id = $this->users_model->create($post_data); //insert into users table and get userid
            $post_data2['user_id'] = $user_Id;
            $post_data2['reg_no'] = $this->input_data['reg_no'];
            $post_data2['institution_place'] = $this->input_data['institution_place'];

            $insertId1 = $this->Institution_model->create($post_data2);

            if ($insertId1) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Registration Successfull '
                ], self::HTTP_OK);
            } else {
                $this->set_response($invalidLogin, self::HTTP_CREATED); //This is the respon if failed
            }
        } else {
            $user_Id = $this->users_model->create($post_data);
            if ($user_Id) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Registration Successfull '
                ], self::HTTP_OK);
            } else {
                $this->set_response($invalidLogin, self::HTTP_CREATED); //This is the respon if failed
            }
        }
    }


    /**
     * @api {post} auth/otp_register Otp Login
     * @apiName User Otp Register
     * @apiGroup User
     *
     * @apiParamExample {json} Request-Example:
               {
                "phone":"7896325685"
               }

     *
     * @apiSuccessExample {json} Success-Response:
                {
                    "status": true,
                    "message": "success",
                    "output": 
                        {
                            "otp": 19764,
                            "userid": "28",
                            "user_type": "2"
                        }
                }


     * @apiErrorExample {json} Error-Response:
                  {
                    "status": false,
                    "message": "Phone number not registered"
                  }
     */


    public function otp_register_post() // Login otp generation
    {
        $userType = '';
        $phone = $this->input_data['phone'];

        $name = '';
        $email = '';
        if (isset($this->input_data['name']) && $this->input_data['email']) {
            $name = ($this->input_data['name']) ? $this->input_data['name'] : '';
            $email = ($this->input_data['email']) ? $this->input_data['email'] : '';
        }

        $jwt_key = $this->config->item('jwt_key');
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid Phone']; //Respon if login invalid
        $val = $this->users_model->get_by_phone_user($phone); //Model to get single data row from database base on phone
        $otp = rand(10000, 99999);
        date_default_timezone_set("Asia/Calcutta");  //India time (GMT+5:30)
        $startTime = date("Y-m-d H:i:s");
        $exp_otp = date('Y-m-d H:i:s', strtotime('+10 minutes', strtotime($startTime)));
        $output['otp'] = $otp;


        if (!$val) {
            if ($name != '' && $email != '') {
                $val_mail = $this->users_model->get_by_email_user($email);
                if ($val_mail) {
                    $this->response(['status' => FALSE, 'message' => 'Email Already Exist'], self::HTTP_CREATED);
                }
                $userid = $this->users_model->create(['name' => $name, 'email_id' => $email, 'phone' => $phone, 'exp_otp' => $exp_otp, 'otp' => $otp, 'status' => 1]); //Create User
            } else {
                //$userid = $this->users_model->create(['phone' => $phone, 'exp_otp' => $exp_otp, 'otp' => $otp]); //Create User
                $this->response(['status' => FALSE, 'message' => 'Phone number not registered'], self::HTTP_CREATED);
            }
        } else {
            $userid = $val->id;
            $val2 = $this->users_model->update(['exp_otp' => $exp_otp, 'otp' => $otp], $userid); //Create User
        }

        // $mobilenumbers = $phone;
        // $message="Dear Customer, your One time password is ".$otp;
        // require('smscheck.php');


        $output['userid'] = (string)$userid;
        // $token['id'] = $userid;  //From here
        // $token['phone'] = $phone;  //From here
        $output['user_type'] = $val->user_type;
        $date = new DateTime();
        // $token['iat'] = $date->getTimestamp();
        // $token['exp'] = $date->getTimestamp() + 60 * 60 * 24 * 365; //To here is to generate token
        // $output['token'] = 'Bearer ' . JWT::encode($token, $jwt_key); //This is the output token
        $this->response([
            'status' => TRUE,
            'message' => 'success',
            'output' => $output
        ], self::HTTP_OK);
    }


    /**
     * @api {post} auth/otp_validation Otp Validation
     * @apiName User otp_validation
     * @apiGroup User
     *
     * @apiParamExample {json} Request-Example:
               {
                    "otp": 98982,
                    "userid": "12"
                }

     *
     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "success",
                    "output": {
                        "token": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyIiwicGhvbmUiOiI4OTg5ODc4OTA5IiwiaWF0IjoxNjE5MDg1MzE3LCJleHAiOjE2NTA2MjEzMTd9.Tm0hFNTjg2L2kdriAYUCPzauv6R05aYrZST5L79_uVY"
                    }
                }


     * @apiErrorExample {json} Error-Response:
                 {
                    "status": false,
                    "message": "Invalid OTP"
                }
     */

    public function otp_validation_post() //otp validation after otp generation
    {
        $otp = $this->input_data['otp'];
        $userid = $this->input_data['userid'];

        $jwt_key = $this->config->item('jwt_key');
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User']; //Response if login invalid
        $val = $this->users_model->find($userid); //Model to get single data row from database base on phone

        if (!$val) 
        {
            $this->response($invalidLogin, self::HTTP_CREATED);
        } 

        else 
        {
            $user_id = $val->id;
            $validate = $this->users_model->validate_otp($otp, $userid); //Model to validate otp

            if (!$validate){
                $this->response(['status' => FALSE, 'message' => 'Invalid OTP'], self::HTTP_CREATED);
            } 
            else 
            {
                $token['id'] = $val->id;  //From here
                $token['phone'] = $val->phone;  //From here
                $date = new DateTime();
                $token['iat'] = $date->getTimestamp();
                $token['exp'] = $date->getTimestamp() + 60 * 60 * 24 * 365; //To here is to generate token
                $output['token'] = 'Bearer ' . JWT::encode($token, $jwt_key); //This is the output token
                //$output['status'] = $val->status;



                // Check if cart session has data or not 
                $this->load->library('cart');
                $isInserted = null;
                if ($this->cart->contents()) {
                    // If yes ,then fetch session cart details and attach userid and save to cart table 
                    $data = array();
                    $this->load->model('Cart_model');
                    $array_cart = $this->cart->contents();
                    foreach ($array_cart as $key => $value) {
                        $data[] = array(
                            "rowid"     => $value['rowid'],
                            "pdt_id"    => $value['id'],
                            "pdt_name"  => $value['name'],
                            "user_id"   => $userid,
                            "price"     => $value['price'],
                            "qty"       => $value['qty'],
                            "sub_total" => $value['subtotal']
                        );
                    }

                    $isInserted = $this->Cart_model->insertCart_batch($data);

                    // Destroy session cart after migrating to cart table
                    $this->cart->destroy();

                    $this->response([
                        'status' => TRUE,
                        'message' => 'success',
                        'output' => $output
                    ], self::HTTP_OK);
                }
           

                else
                {
                    $this->response([
                        'status' => TRUE,
                        'message' => 'success',
                        'output' => $output
                    ], self::HTTP_OK);
                }

              
            }
        }
    }



    public function update_image_post()
    {
        $this->auth_1();
        $userid = $this->user_data->id;
        $user_data = $this->users_model->find($userid);
        $val = null;
        $imageData = [];
        $config['upload_path'] = 'uploads/profile/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['encrypt_name'] = TRUE;

        $this->load->library('upload', $config);

        if (isset($_FILES['profile_pic']) && !empty($_FILES['profile_pic']['name'])) {
            if (!$this->upload->do_upload('profile_pic')) {
                $val = "Invalid image";
            } else {
                $post_data['profile_pic'] = $this->upload->data()['file_name'];
                if (!empty($user_data->image) && file_exists(FCPATH . 'uploads/profile/' . $user_data->image))
                    unlink(FCPATH . 'uploads/profile/' . $user_data->image);
            }
        }

        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid Login']; //Respon if login invalid
        //$val1 = $this->users_model->get_by_phone_user($phone); 
        if ($val) {
            $this->response(['status' => FALSE, 'message' => 'Invalid Image'], self::HTTP_CREATED);
        } else {
            $this->users_model->update(['image' => $post_data['profile_pic']], $userid);
            if ($userid) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Image Uploaded'
                ], self::HTTP_OK);
            } else {
                $this->set_response($invalidLogin, self::HTTP_CREATED); //This is the respon if failed
            }
        }
    }
}
