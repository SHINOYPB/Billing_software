<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Book extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
      
        parent::__construct();
        $this->load->model('Booking_model');
    }




    /**
     * @api {post} Book/  Booking Doc/Counsellor 
     * @apiName Booking  Booking
     * @apiGroup Booking
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiParamExample {json} Request-Example:
           {
                "doc_counsellor_id": "6",
                "booking_user_type": "4",        [4==doctor,5 ==counsellor]
                "consult_date": "2021-5-17",
                "start_time": "11:16:04",
                "end_time": "12:16:04"
            }

     * @apiSuccessExample {json} Success-Response:
               {
                    "status": true,
                    "message": "Success",
                    "bookid_id": 3
                    }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Filed to Book"
                    }
     */

    public function index_post()
    {
        $this->auth();
        $userid = $this->user_data->id;
        $this->load->model('Users_model');

        if (empty($this->input_data['doc_counsellor_id']) || empty($this->input_data['consult_date']) || empty($this->input_data['booking_user_type'])
        || empty($this->input_data['start_time']) || empty($this->input_data['end_time']) ) 
        {
            $data['status'] = FALSE;
            $data['message'] = $this->input_data;
            $this->response($data, self::HTTP_BAD_REQUEST);
        } 
        
        else 
        {
            $doctor_request = [];
            $doctor_request['user_id'] = $userid; //public user is fetch from bearer token 
            $doctor_request['booking_user_id'] = $this->input_data['doc_counsellor_id']; //doctor or counsellor
            $userdata = $this->Users_model->find($this->input_data['doc_counsellor_id']); // is doctor or counsellor exits ?
            if (!$userdata) 
            {
                $data['status'] = FALSE;
                $data['message'] = 'User does not exist';
                $this->response($data, self::HTTP_BAD_REQUEST);
            }

            $doctor_request['booking_user_type'] = $this->input_data['booking_user_type']; //doctor==4  or counsellor==5
            $doctor_request['consultation_date'] = $this->input_data['consult_date']; 
            $doctor_request['start_time'] = $this->input_data['start_time'];
            $doctor_request['end_time'] = $this->input_data['end_time'];
            $doctor_request['status'] = 1;

            $bookingId = $this->Booking_model->create($doctor_request);

            if ($bookingId) 
            {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Success',
                    'bookid_id' => $bookingId
                ], self::HTTP_OK);
            } 

            else 
            {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Filed to Book'
                ], self::HTTP_OK);
            }


        }
    }
}
