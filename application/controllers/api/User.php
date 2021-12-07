<?php

date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');


class User extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        parent::__construct();
        $this->load->model('Users_model');
    }




    /**
     * @api {get} User/get_type Get User Type
     * @apiName Get User Type
     * @apiGroup User
     * 
     * 
     *
     * @apiSuccessExample {json} Success-Response:
          {
                "status": true,
                "message": "success",
                "dataList": [
                    {
                        "id": "1",
                        "name": "public",
                        "date": "2021-03-29 17:38:49"
                    },
                    {
                        "id": "2",
                        "name": "health workers",
                        "date": "2021-03-29 17:38:49"
                    },
                    
                ]
            }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to fetch user type"
                  }
     */
    public function get_type_get()
    {
        $pdtType = $this->Users_model->getPdtType();

        if ($pdtType) {
            $data['status'] = TRUE;
            $data['message'] = 'success';
            $data['dataList'] = $pdtType;
            $this->set_response($data, self::HTTP_OK);
        } else {
            $data['status'] = FALSE;
            $data['message'] = 'Failed to fetch user type';
            $this->set_response($data, self::HTTP_OK);
        }
    }






    /**
     * @api {get} User/myBooking MyBooking
     * @apiName User My Booking
     * @apiGroup User
     *
     *  @apiHeader  {String} Authorization Authorization value.
     * 
     *
     *
     * @apiSuccessExample {json} Success-Response:
         {
            "status": true,
            "message": "success",
            "dataList": [
                {
                "id": "2",
                "image": "http://localhost/Anymedion/assets/images/products/single/fc20719ef1fa3bd0b3e6ebf34c9c508c.jpg",
                "name": "cardiac tablet ",
                "amount": "400",
                "qty": "2"
                },
                {
                "id": "3",
                "image": "http://localhost/Anymedion/assets/images/products/single/",
                "name": "neweterina",
                "amount": "20",
                "qty": "2"
                }
            ]
        }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to fetch my booking"
                  }
     */

    public function myBooking_get()
    {
        // check wheather he is logged in or not 
        $this->auth();
        $userid = $this->user_data->id; // if loged in fetch userif from that user session 


        $details = $this->Users_model->getBooking($userid);
        foreach ($details as $key => $sub) {
            $details[$key]['image'] = base_url() . "assets/images/products/single/" . $details[$key]['image'];
        }

        if ($details) {
            $data['status'] = TRUE;
            $data['message'] = 'success';
            $data['dataList'] = $details;
            $this->set_response($data, self::HTTP_OK);
        } else {
            $data['status'] = FALSE;
            $data['message'] = 'Failed to fetch my booking';
            $this->set_response($data, self::HTTP_OK);
        }
    }




    /**
     * @api {get} User/insertAddress Insert Address
     * @apiName User Insert Address
     * @apiGroup User
     *
     *  @apiHeader  {String} Authorization Authorization value.
     * 
     * @apiParamExample {json} Request-Example:
              {
                "name": "veeru",
                "phone": "8900000000",
                "place": "kerala",
                "pincode": "680533",
                "address_line_1": "melepurakkal hose",
                "address_line_2": "punnathoor road",
                "state": "kera",
                "country": "india"
            }
     *
     * @apiSuccessExample {json} Success-Response:
         {
            "status": true,
            "message": "successfully inserted address"
            }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to insert address"
                  }
     */

    public function insertAddress_post()
    {
        // check wheather he is logged in or not 
        $this->auth();
        $userid = $this->user_data->id; // if loged in fetch userif from that user session 

        if (empty($this->input_data['name']) || empty($this->input_data['phone']) || empty($this->input_data['place'])) {
            $data['status'] = FALSE;
            $data['message'] = 'Post not supplied';
        } else {

            $data1['user_id'] = $userid;
            $data1['name'] = $this->input_data['name'];
            $data1['phone'] = $this->input_data['phone'];
            $data1['pincode'] = $this->input_data['pincode'];
            $data1['place'] = $this->input_data['place'];
            $data1['address_line_1'] = $this->input_data['address_line_1'];
            $data1['address_line_2'] = $this->input_data['address_line_2'];
            $data1['state'] = $this->input_data['state'];
            $data1['country'] = $this->input_data['country'];

            $isInserted = $this->Users_model->insertAddress($data1);


            if ($isInserted) {
                $data['status'] = TRUE;
                $data['message'] = 'successfully inserted address';

                $this->set_response($data, self::HTTP_OK);
            } else {
                $data['status'] = FALSE;
                $data['message'] = 'Failed to insert address';
                $this->set_response($data, self::HTTP_OK);
            }
        }
    }



    /**
     * @api {get} User/fetch_address Fetch Address
     * @apiName User Fetch Address
     * @apiGroup User
     *
     *  @apiHeader  {String} Authorization Authorization value.
     * 
     *
     *
     * @apiSuccessExample {json} Success-Response:
        {
            "status": true,
            "message": "success",
            "dataList": [
                {
                "user_id": "3",
                "name": "veeru",
                "phone": "8900000000",
                "address_line_1": "melepurakkal hose",
                "address_line_2": "punnathoor road",
                "place": "kerala",
                "pincode": "680533",
                "state": "kera",
                "country": "india"
                },
                {
                "user_id": "3",
                "name": "veeru",
                "phone": "8900000000",
                "address_line_1": "melepurakkal hose",
                "address_line_2": "punnathoor road",
                "place": "kerala",
                "pincode": "680533",
                "state": "kera",
                "country": "india"
                },
                {
                "user_id": "3",
                "name": "deepa",
                "phone": "9878764567",
                "address_line_1": "thaivalpil",
                "address_line_2": "thrissur",
                "place": "thrissur",
                "pincode": "680511",
                "state": "kerala",
                "country": "india"
                }
            ]
            }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to fetch Address"
                  }
     */

    public function fetch_address_get()
    {
        // check wheather he is logged in or not 
        $this->auth();
        $userid = $this->user_data->id; // if loged in fetch userif from that user session 

        $details = $this->Users_model->getAddress($userid);
        $details1 = $this->Users_model->getAddress1($userid);
        $output = array_merge($details, $details1);
  
        if ($details) {
            $data['status'] = TRUE;
            $data['message'] = 'success';
            $data['dataList'] = $output;
            $this->set_response($data, self::HTTP_OK);
        } else {
            $data['status'] = FALSE;
            $data['message'] = 'Failed to fetch Address';
            $this->set_response($data, self::HTTP_OK);
        }
    }
}
