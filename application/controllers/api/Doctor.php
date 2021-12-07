<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Doctor extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
      
        parent::__construct();
        $this->load->model('Doctor_model');
    }


    public function get_doc_details_get()
    {
        $this->auth();
        //$utype = $this->user_data->user_type; // 0 for professional and 1 for customer
        $userid = $this->user_data->id;
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];

        $user_name = $this->Doctor_model->fetch_all1($userid);
        foreach ($user_name as $key => $product) {
            $user_name[$key]['consultation_time'] = $this->Doctor_model->fetch_consult_tim($userid);
        }


        if ($user_name) {
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'output' => $user_name
            ], self::HTTP_OK);

            // $data['status'] = TRUE;
            // $data['message'] = 'success';
            // $data['dataList'] = $user_name;
            // $this->set_response($data, self::HTTP_OK);
        } else {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }
    }




    /**
     * @api {post} Doctor/inser_consu_time  Insert Consultation Time
     * @apiName Doctor Insert Consultation Time
     * @apiGroup Doctor 
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     *  @apiParamExample {json} Request-Example:
                {
                   "days": [
                            "1",        [1==monday,2==tuesday etc, refer day table]  
                            "2"
                        ],
                    "start_time": [
                            "03:06:09",
                            "04:08:09"
                        ],
                    "end_time": [
                        "02:06:09",
                        "06:08:09"
                        ]
                    }

     * @apiSuccessExample {json} Success-Response:
                  {
                        "status": true,
                        "message": "successfully inserted dates"
                    }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Filed to insert dates"
                    }
     */
    public function inser_consu_time_post()
    {
        $this->auth();
        //$utype = $this->user_data->user_type; // 0 for professional and 1 for customer
        $userid = $this->user_data->id;
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];



        if (empty($this->input_data['day']) || empty($this->input_data['start_time']) || empty($this->input_data['end_time'])) {
            $data['status'] = FALSE;
            $data['message'] = 'Post not supplied';
        } else {
            if (isset($this->input_data['start_time'])) {
                $start_time = array();
                $start_time = $this->input_data['start_time'];
                unset($this->input_data['start_time']);
            }

            if (isset($this->input_data['end_time'])) {
                $end_time = array();
                $end_time = $this->input_data['end_time'];
                unset($this->input_data['end_time']);
            }

            if (isset($this->input_data['day'])) {
                $days = array();
                $days = $this->input_data['day'];
                unset($this->input_data['day']);
            }


        

          //  $cons_date = $this->input_data['consult_date'];
            $arraycount =  count($days);

            $faq = array();
            for ($i = 0; $i < $arraycount; $i++) 
            {
                $faq[] = array(
                    'user_id' => $userid,
                    'day' => $days[$i],
                    'start_time' => $start_time[$i],
                    'end_time' => $end_time[$i]
                );
            }
            $okay = $this->Doctor_model->insert_consut_time($faq);
            if ($okay) {

                $this->response([
                    'status' => TRUE,
                    'message' => 'successfully inserted dates'

                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Filed to insert dates'
                ], self::HTTP_OK);
            }
        }
    }
    /**
     * @api {get} Doctor/search  Doctor Search
     * @apiName Doctor Doctor Search
     * @apiGroup Doctor 
     *
     * @apiParam (Parameter) {String} longitude Filter result by nearby doctor. 
     * @apiParam (Parameter) {String} latitude Filter result by nearby doctor.
     * @apiParam (Parameter) {String} keyword search keyword for filtering doctor by name.
     * @apiParam (Parameter) {String} department get department vise doctor details[seperate api written].
     * 
     * 
     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "Success",
                    "dataList": [
                        {
                            "firstName": "new doctor",
                            "lastName": "new",
                            "gender": "male",
                            "address": "rfrtgyh",
                            "state": "kerala",
                            "country": "india",
                            "email": "pbshinoy@gmail.com",
                            "phone": "3434343",
                            "zip": "680520",
                            "city": "thrissur",
                            "reg_no": "65859",
                            "about": "",
                            "education": "mbbs",
                            "department": "ent",
                            "image": "http://localhost/anymedion/upload/users/doctor/single78795cebd96467ccf09a098e727ce72e.jpg",
                            "experience": "3",
                            "user_id": "20"
                        }
                    ]
                }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Falied to get doctor details"
                    }
     */
    public function search_get()
    {
        $parameters = $this->input->get();

        $fields = ['longitude', 'latitude', 'keyword', 'department'];
        $search_fields = [];
        foreach ($fields as $v) {
            if (isset($parameters[$v]) && !empty($parameters[$v])) {
                $search_fields[$v] = $parameters[$v];
            } else {
                $search_fields[$v] = null;
            }
        }

        $doctorList = $this->Doctor_model->search_doctor($search_fields);

        if ($doctorList) {
            foreach ($doctorList as $key => $doctor) {
                $doctorList[$key]['image'] = base_url() . "upload/users/doctor/single/" . $doctorList[$key]['image'];
            }
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $doctorList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get doctor details'
            ], self::HTTP_OK);
        }
    }


    /**
     * @api {get} Doctor/get_department  Get Department
     * @apiName Doctor Get Department
     * @apiGroup Doctor 
     *
     *  
     * 
     * @apiSuccessExample {json} Success-Response:
             {
                    "status": true,
                    "message": "Success",
                    "dataList": [
                        {
                            "id": "1",
                            "name": "Ent"
                        },
                        {
                            "id": "2",
                            "name": "Pediatrician"
                        }
                    ]
                }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Falied to get doctor department"
                    }
     */
    public function get_department_get()
    {
        $department = $this->Doctor_model->get_department();
        if ($department) {
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $department,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get Doctor department'
            ], self::HTTP_OK);
        }
    }


    /**
     * @api {get} Doctor/:id  Doctor Single View
     * @apiName Doctor Single View
     * @apiGroup Doctor 
     *
     * @apiParam (Path) {String} id Provide id in path . 
     * 
     * @apiSuccessExample {json} Success-Response:
         {
            "status": true,
            "message": "success",
            "output": {
                "firstName": "new doctor",
                "lastName": "new",
                "gender": "male",
                "address": "rfrtgyh",
                "state": "kerala",
                "country": "india",
                "email": "pbshinoy@gmail.com",
                "phone": "3434343",
                "zip": "680520",
                "city": "thrissur",
                "reg_no": "65859",
                "about": "",
                "image": "http://localhost/anymedion/upload/users/doctor/single/78795cebd96467ccf09a098e727ce72e.jpg",
                "education": "mbbs",
                "department": "Ent",
                "experience": "3",
                "user_id": "20",
                "doctor_id": "6",
                "consultation_time": [
                {
                    "date": "2021-05-17",
                    "time_slot": [
                    {
                        "start_time": "16:07:00",
                        "end_time": "17:08:00"
                    },
                    {
                        "start_time": "15:28:00",
                        "end_time": "15:30:00"
                    }
                    ]
                },
                {
                    "date": "2021-05-18",
                    "time_slot": [
                    {
                        "start_time": "16:07:00",
                        "end_time": "17:08:00"
                    },
                    {
                        "start_time": "15:28:00",
                        "end_time": "15:30:00"
                    }
                    ]
                }
                ]
            }
            }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Invalid User"
                    }
     */
    public function index_get($userid)
    {
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];

        $doctor = $this->Doctor_model->findOne($userid);
        if ($doctor->image) {
            $doctor->image = base_url() . "upload/users/doctor/single/" . $doctor->image;
        }
        $period = new DatePeriod(
            new DateTime(), // Start date of the period
            new DateInterval('P1D'), // Define the intervals as Periods of 1 Day
            6 // Apply the interval 6 times on top of the starting date
        );
        $doctor->consultation_time = [];

        $i = 0;
        foreach ($period as $day) {
            $date = $day->format('Y-m-d');
            $week = $day->format('l');
            $week = strtolower($week);
            $timeSlots = $this->Doctor_model->fetch_consultation_time($userid, $week);
            if ($timeSlots) {
                $doctor->consultation_time[$i] = new stdClass;
                $doctor->consultation_time[$i]->date = $date;
                $doctor->consultation_time[$i]->time_slot = $timeSlots;

                $i = $i + 1;
            }
        }


        if ($doctor) {
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'output' => $doctor
            ], self::HTTP_OK);

            // $data['status'] = TRUE;
            // $data['message'] = 'success';
            // $data['dataList'] = $user_name;
            // $this->set_response($data, self::HTTP_OK);
        } else {
            $this->response($invalidLogin, self::HTTP_CREATED);
        }
    }
}
