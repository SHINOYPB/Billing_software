<?php
######################################## API  #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Blood_donor extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
     
        parent::__construct();
        $this->load->model('BloodDonor_model');
        $this->load->model('users_model');
    }


    /**
     * @api {post} Blood_donor/donated_date  Insert Donated Date 
     * @apiName Blood Donor Insert Donated Date
     * @apiGroup Blood Donor
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiParamExample {json} Request-Example:
              {
                "donated_date":"2021-03-25 00:00:00",
                "place": "thrissur",
                 "longitude": "73.4",
                  "latitude": "74.5"
            }

     * @apiSuccessExample {json} Success-Response:
                {
                    "status": true,
                    "message": "successfully inserted donatd dates"
                }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Cant insert donatd datesr"
                    }
     */

    //Check he is registered blood donor
    //Insert into table(blood_donation_history) then update the "last_donation_date" field in "blood_donor" table
    public function donated_date_post()
    {
        $this->auth();
        $userid = $this->user_data->id;
        $data['donated_date'] = $this->input_data['donated_date']; //Username Posted
        $data['place'] = $this->input_data['place'];
        $data['longitude'] = $this->input_data['longitude'];
        $data['latitude'] = $this->input_data['latitude'];
        $data['user_id'] = $userid;



        $success = $this->BloodDonor_model->dontedDate_insert($data);


        //Update query for updating blood donor table  last_donation_date
        $date1 = $data['donated_date'];
        $isUpdate = $this->BloodDonor_model->upd_last_donate_date(['last_donation_date' => $date1], $userid);




        if ($success == TRUE) {
            $this->response([
                'status' => TRUE,
                'message' => 'successfully inserted donatd dates'
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Cant insert donatd dates'
            ], self::HTTP_OK);
        }
    }


    /**
     * @api {post} Blood_donor/validate_bloodDonor  Blood Donor validate
     * @apiName Blood Donor validate
     * @apiGroup Blood Donor
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiParamExample {json} Request-Example:
             {
                "otp": 55972,
                "blood_group": "2"
            }
     * @apiSuccessExample {json} Success-Response:
                {
                    "status": true,
                    "message": "success",
                    "output": {
                        "user_id": "23"
                    }
                }
     * @apiErrorExample {json} Error-Response:
                   {
                        "status": false,
                        "message": "Invalid User"
                    }
     */

    //validate otp and if it is registered save to "blood_donor" table .
    public function validate_bloodDonor_post()
    {
        $this->auth();
        $userid = $this->user_data->id;
        $blood_group = $this->input_data['blood_group'];
        $otp = $this->input_data['otp'];




        $data['user_id'] = $userid;
        $data['blood_group'] = $blood_group;


        $jwt_key = $this->config->item('jwt_key');
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User']; //Respon if login invalid
        $val = $this->users_model->find($userid); //Model to get single data row from database base on phone
        if (!$val) {
            $this->response($invalidLogin, self::HTTP_CREATED);
        } else {
            $user_id = $val->id;
            $validate = $this->users_model->validate_otp($otp, $userid); //Model to validate otp
            if (!$validate) {
                $this->response(['status' => FALSE, 'message' => 'Invalid OTP'], self::HTTP_CREATED);
            } else {


                ########## register as blood donor #########################
                $createdDonor = $this->BloodDonor_model->create_bloodDonor($data);


                if ($createdDonor) {

                    $output['user_id'] = $val->id;
                    $this->response([
                        'status' => TRUE,
                        'message' => 'success',
                        'output' => $output
                    ], self::HTTP_OK);
                } else {
                    $this->response(['status' => FALSE, 'message' => 'Blood donor not created '], self::HTTP_CREATED);
                }
            }
        }
    }


    /**
     * @api {post} Blood_donor/register_bloodDonor  Blood Donor Register
     * @apiName Blood Donor Register
     * @apiGroup Blood Donor
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiParamExample {json} Request-Example:
                {
                    "phone": "7896325685",
                    "blood_group": "2"
                }

     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "success",
                    "output": {
                        "otp": 55972,
                        "userid": "23",
                        "blood_group": "2"
                    }
                }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Invalid User"
                    }
     */
    public function register_bloodDonor_post() //Register as blood donor
    {
        $this->auth();
        $userid = $this->user_data->id;
        $phone = $this->input_data['phone'];
        $blood_group = $this->input_data['blood_group'];

        #####################################
        // the user id exists in blood donor table
        //show the the response as already a user
        $isDonor = $this->BloodDonor_model->isblooddonor($userid);
        if (!empty($isDonor)) {
            $this->response([
                'status' => FALSE,
                'message' => 'Already a blood donor'
            ], self::HTTP_OK);
        }
        #####################################

        // $userType = $this->input_data['user_type'];
        // $name = '';
        // $email = '';
        // if (isset($this->input_data['name']) && $this->input_data['email']) 
        // {
        //     $name = ($this->input_data['name']) ? $this->input_data['name'] : '';
        //     $email = ($this->input_data['email']) ? $this->input_data['email'] : '';
        // }


        //$jwt_key = $this->config->item('jwt_key');

        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid Phone']; //Respon if login invalid
        $val = $this->users_model->get_by_phone_user($phone); //Model to get single data row from database base on phone


        //

        $otp = rand(10000, 99999);
        date_default_timezone_set("Asia/Calcutta");   //India time (GMT+5:30)
        $startTime = date("Y-m-d H:i:s");
        $exp_otp = date('Y-m-d H:i:s', strtotime('+10 minutes', strtotime($startTime)));
        $output['otp'] = $otp;

        if ($val->phone == $phone) {
            $userid = $val->id;
            if (!empty($val->otp)) {
                $val2 = $this->users_model->update(['exp_otp' => $exp_otp, 'otp' => $otp], $userid); //Create User

            } else {
                $val2 = $this->users_model->Otp_reg(['exp_otp' => $exp_otp, 'otp' => $otp], $userid); //Create User
            }
        } else {
            $this->response(['status' => FALSE, 'message' => 'Phone number not match'], self::HTTP_CREATED);
        }



        $output['userid'] = (string)$userid;

        $output['blood_group'] = $blood_group;

        if ($val2) {
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'output' => $output
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Cant create otp'
            ], self::HTTP_OK);
        }
    }


    /**
     * @api {post} Blood_donor/get_user_details  Fetch User Details
     * @apiName Blood Donor Fetch User Details
     * @apiGroup Blood Donor
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiSuccessExample {json} Success-Response:
                  {
                    "status": true,
                    "message": "success",
                    "dataList": [
                        {
                            "firstName": "milan",
                            "gender": "male",
                            "phone": "999999",
                            "email": "admin@admin.com",
                            "address_line_1": "milan first address",
                            "city": "thrissur",
                            "blood_group": "O-",
                            "donated_history": [
                                {
                                    "donated_date": "2021-03-25 00:00:00",
                                    "place": "thrissur"
                                }
                            ]
                        }
                    ]
                }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Invalid User"
                    }
     */
    //Function to get user details for displaying in register blood donor page
    public function get_user_details_get()
    {
        $this->auth();
        //$utype = $this->user_data->user_type; // 0 for professional and 1 for customer
        $userid = $this->user_data->id;
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];
        $user_name = $this->BloodDonor_model->getUserDetails($userid);
        // $user_name['history'] = $this->BloodDonor_model->get_donated_history($userid);

        foreach ($user_name as $key => $product) {
            $user_name[$key]['donated_history'] = $this->BloodDonor_model->get_donated_history($userid);
        }
        if ($user_name) {
            // $this->response([
            //     'status' => TRUE,
            //     'message' => 'success',
            //     'output' => $user_name
            // ], self::HTTP_OK);

            $data['status'] = TRUE;
            $data['message'] = 'success';
            $data['dataList'] = $user_name;
            $this->set_response($data, self::HTTP_OK);
        } else {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }
    }


    /**
     * @api {post} Blood_donor/getUserName  Fetch Username
     * @apiName Blood Donor Get Username
     * @apiGroup Blood Donor
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "success",
                    "output": {
                        "name": "latest institution"
                    }
                }
     * @apiErrorExample {json} Error-Response:
                {
                    "status": false,
                    "message": "Invalid User"
                }
     */

    public function getUserName_get() //Fetch Username 
    {
        $this->auth();
        //$utype = $this->user_data->user_type; // 0 for professional and 1 for customer
        $userid = $this->user_data->id;
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];
        $user_name['name'] = $this->BloodDonor_model->getName($userid);
        if ($user_name) {
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'output' => $user_name
            ], self::HTTP_OK);
        } else {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }
    }


    /**
     * @api {post} Blood_donor/request_blood  Request_Blood
     * @apiName Blood Donor Request_Blood
     * @apiGroup Blood Donor
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * 
     *
     * @apiParamExample {json} Request-Example:
                 {
                    "longitude":"76.2144349",
                    "latitude":"10.5276416",
                    "blood_group":"1",
                    "phone":"8138881304"
                }
     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "success",
                    "dataList": [
                        {
                            "request_to": "8",
                            "requested_blood_group": "O+",
                            "request_from": "3"
                        },
                        {
                            "request_to": "18",
                            "requested_blood_group": "O+",
                            "request_from": "3"
                        }
                    ]
                }
     * @apiErrorExample {json} Error-Response:
                {
                    "status": false,
                    "message": "Failed to find blood donnors"
                }
     */
    public function request_blood_post()
    {

        $this->auth();
        $userid = $this->user_data->id;

        if (empty($this->input_data['longitude']) || empty($this->input_data['latitude']) || empty($this->input_data['blood_group']) || empty($this->input_data['phone'])) {
            $data['status'] = FALSE;
            $data['message'] = 'Post not supplied';
        } else {
            $blood_request = [];
            $fields = ['name', 'phone', 'blood_group', 'place', 'address'];
            foreach ($fields as $v) {
                if (isset($this->input_data[$v]) && !empty($this->input_data[$v])) {
                    $blood_request[$v] = $this->input_data[$v];
                }
            }

            $bloodRequestId = $this->BloodDonor_model->save_request($blood_request);


            $dataw = array(
                'user_id' => $userid
            );

            $isupdateUser = $this->BloodDonor_model->update_userId($bloodRequestId, $dataw);

            $fetch_donnor = $this->BloodDonor_model->fetch_donnors_by_distance($this->input_data['latitude'], $this->input_data['longitude'], $this->input_data['blood_group']);


            $arraye = array();
            foreach ($fetch_donnor as $f) {
                $arraye[] = array(
                    'request_to' => $f->id,
                    'requested_blood_group'   => $f->blood_group,
                    'request_from'    => $userid
                );
            }

            $isRequested = $this->BloodDonor_model->create_request($arraye);

            if ($bloodRequestId && $isRequested) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'success',
                    'dataList' => $arraye,
                ], self::HTTP_OK);
            }


            $data['status'] = FALSE;
            $data['message'] = "Failed to find blood donnors";
        }
        $this->response($data, self::HTTP_CREATED);
    }


    /**
     * @api {post} Blood_donor/getBloodGroup  Get Blood Groups
     * @apiName Blood Donor Get Blood Group
     * @apiGroup Blood Donor
     *
   
     *
     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "success",
                    "dataList": [
                        {
                            "id": "1",
                            "name": "O+"
                        },
                        {
                            "id": "2",
                            "name": "O-"
                        }
                    
                    ]
                }
     * @apiErrorExample {json} Error-Response:
                {
                    "status": false,
                    "message": "Cant fetch blood grou"
                }
     */

    public function getBloodGroup_get() //Fetch Username 
    {

        $invalidLogin = ['status' => FALSE, 'message' => 'Cant fetch blood group'];
        $bloodGroup = $this->BloodDonor_model->bloodGroup();
        if ($bloodGroup) {
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'dataList' => $bloodGroup
            ], self::HTTP_OK);
        } else {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }
    }
}
