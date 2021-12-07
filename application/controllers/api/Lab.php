<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Lab extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        parent::__construct();
        $this->load->model('Institution_model');
        $this->load->model('Booking_model');
    }


    /**
     * @api {get} Lab/:id  Lab Single View
     * @apiName Lab Single View
     * @apiGroup Lab 
     *
     * @apiParam (Path) {String} id Provide id in path . 
     * 
     * @apiSuccessExample {json} Success-Response:
         {
        "status": true,
        "message": "success",
        "output": {
            "name": "amal",
            "address": "olarikara",
            "phone": "9744618860",
            "email": "newamala@gmail.com",
            "place": "kerala",
            "country": "fgfg",
            "reg_no": "555",
            "institute_id": "6",
            "user_id": "29",
            "tests": [
            {
                "id": "6",
                "name": "new lab test corona",
                "cat_id": "0",
                "description": "it i snew lab test",
                "gender": "uisex",
                "sample_type": "oral sample",
                "image": "http://localhost/Anymedion/assets/images/labtest/single/",
                "created_at": "2021-03-03 11:16:04",
                "price": "2343"
            },
            {
                "id": "8",
                "name": "test shinoy",
                "cat_id": "0",
                "description": "new corona test",
                "gender": "Unisex",
                "sample_type": "oral",
                "image": "http://localhost/Anymedion/assets/images/labtest/single/",
                "created_at": "2021-04-30 08:22:54",
                "price": "33"
            }
            ],
            "packages": [
            {
                "id": "10",
                "name": "date new  shinoy",
                "description": "storeage in cool place",
                "image": "http://localhost/Anymedion/assets/images/labPackages/single/0",
                "created_at": "2021-05-01 02:12:52",
                "price": "300"
            },
            {
                "id": "31",
                "name": "lab ne ",
                "description": "nothing",
                "image": "http://localhost/Anymedion/assets/images/labPackages/single/ebbfc07cf65413402ece58f07dfcc9d4.jpg",
                "created_at": "2021-05-21 15:09:11",
                "price": "4545"
            }
            ],
            "consultation_time": [
            {
                "date": "2021-06-21",
                "time_slot": [
                {
                    "start_time": "17:31:00",
                    "end_time": "19:33:00"
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
        //$tests =new stdClass;
        $lab = $this->Institution_model->findOne($userid);
        $lab->user_id = $userid;
        $lab->tests = $this->Institution_model->fetch_tests($userid);

        $count = count($lab->tests);
        for ($i = 0; $i < $count; $i++) {
            $lab->tests[$i]->image = base_url() . "assets/images/labtest/single/" . $lab->tests[$i]->image;
        }


        //var_dump($lab->tests[0]->image);
        // print_r($lab->tests->image);
        // die();

        // if ($lab->tests->image) {
        //     $lab->tests->image = base_url() . "assets/images/labtest/single/" . $lab->tests->image;
        // }


        $lab->packages = $this->Institution_model->fetch_pkg($userid);
        $count1 = count($lab->packages);
        for ($i = 0; $i < $count1; $i++) {
            $lab->packages[$i]->image = base_url() . "assets/images/labPackages/single/" . $lab->packages[$i]->image;
        }


        $period = new DatePeriod(
            new DateTime(), // Start date of the period
            new DateInterval('P1D'), // Define the intervals as Periods of 1 Day
            6 // Apply the interval 6 times on top of the starting date
        );
        $lab->consultation_time = [];

        $i = 0;
        foreach ($period as $day) {
            $date = $day->format('Y-m-d');
            $week = $day->format('l');
            $week = strtolower($week);
            $timeSlots = $this->Institution_model->fetch_consultation_time($userid, $week);
            if ($timeSlots) {
                $lab->consultation_time[$i] = new stdClass;
                $lab->consultation_time[$i]->date = $date;
                $lab->consultation_time[$i]->time_slot = $timeSlots;

                $i = $i + 1;
            }
        }

        if ($lab) {
            $this->response([
                'status' => TRUE,
                'message' => 'success',
                'output' => $lab
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
     * @api {get} Lab/search  Lab Search
     * @apiName Lab  Search
     * @apiGroup Lab 
     *
     * @apiParam (Parameter) {String} longitude Filter result by nearby doctor. 
     * @apiParam (Parameter) {String} latitude Filter result by nearby doctor.
     * @apiParam (Parameter) {String} keyword search keyword for filtering doctor by name.
     * 
     * 
     * @apiSuccessExample {json} Success-Response:
                 {
                        "status": true,
                        "message": "Success",
                        "dataList": [
                            {
                            "firstName": "arun",
                            "lastName": "ms",
                            "gender": "male",
                            "address": "thaivalpil",
                            "state": "kerala",
                            "country": "india",
                            "email": "pulikkottilshinoy@gmail.com",
                            "phone": "6756565",
                            "zip": "680511",
                            "city": "thrissur",
                            "reg_no": "33445",
                            "about": "",
                            "institution_place": "",
                            "image": "http://localhost/anymedion/upload/users/institution/single/",
                            "user_id": "4",
                            "distance": "0.8589851297473713"
                            },
                            {
                            "firstName": "amal",
                            "lastName": "",
                            "gender": "male",
                            "address": "",
                            "state": "",
                            "country": "",
                            "email": "newamala@gmail.com",
                            "phone": "9744618860",
                            "zip": "0",
                            "city": "kerala",
                            "reg_no": "0",
                            "about": "",
                            "institution_place": "tcr",
                            "image": "http://localhost/anymedion/upload/users/institution/single/",
                            "user_id": "29",
                            "distance": "8.33895837283675"
                            }
                        ]
                        }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Falied to get institution detail"
                    }
     */

    public function search_get()
    {
        $parameters = $this->input->get();

        $fields = ['longitude', 'latitude', 'keyword'];
        $search_fields = [];
        foreach ($fields as $v) {
            if (isset($parameters[$v]) && !empty($parameters[$v])) {
                $search_fields[$v] = $parameters[$v];
            } else {
                $search_fields[$v] = null;
            }
        }

        $doctorList = $this->Institution_model->search_institute($search_fields);

        if ($doctorList) {
            foreach ($doctorList as $key => $doctor) {
                $doctorList[$key]['image'] = base_url() . "upload/users/institution/single/" . $doctorList[$key]['image'];
            }
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $doctorList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get institution details'
            ], self::HTTP_OK);
        }
    }



    /**
     * @api {get} Lab/homepage_package  homepage Package List
     * @apiName Lab Package List
     * @apiGroup Lab
     *
     * 
     *
     *
     * @apiSuccessExample {json} Success-Response:
        {
                "status": true,
                "message": "Success",
                "dataList": [
                    {
                    "category": "Full Body Check Up",
                    "categoryId": "1",
                    "products": [
                        {
                        "id": "2",
                        "name": "new",
                        "description": "new1",
                        "image": "0",
                        "created_at": "2021-01-02 12:37:03",
                        "test_count": 0
                        },
                        {
                        "id": "31",
                        "name": "lab ne ",
                        "description": "nothing",
                        "image": "http://localhost/Anymedion/assets/images/labPackages/single/ebbfc07cf65413402ece58f07dfcc9d4.jpg",
                        "created_at": "2021-05-21 15:09:11",
                        "test_count": 2
                        },
                        {
                        "id": "3",
                        "name": "new",
                        "description": "new1",
                        "image": "0",
                        "created_at": "2021-01-02 12:37:03",
                        "test_count": 0
                        }
                    ]
                    }
                ]
        }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get packages"
                  }
     */

    public function homepage_package_get()
    {
        $catList = $this->Institution_model->getCategories();

        $productCategoryList = [];
        $index = 0;

        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getProductList($category->id);
            if ($productList) {
                $productCategoryList[$index] = new stdClass;
                $productCategoryList[$index]->category = $category->name;
                $productCategoryList[$index]->categoryId = $category->id;


                foreach ($productList as $key => $product) {

                    // Using this category id (in here lab_pkg id) find test count 
                    $LabTestcount = $this->Institution_model->labPkg_testCount($product['id']);
                    $productList[$key]['test_count'] = $LabTestcount;

                    if ($productList[$key]['image']) {
                        $productList[$key]['image'] = base_url() . "assets/images/labPackages/single/" . $productList[$key]['image'];
                    }
                    
                }
                

                $productCategoryList[$index]->products = $productList;
                $index = $index + 1;
            }
        }


        if ($productCategoryList) {
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $productCategoryList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get packages ',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }





    /**
     * @api {get} Lab/homepage_category homepage Category List
     * @apiName Lab Category List
     * @apiGroup Lab
     *
     * 
     *
     *
     * @apiSuccessExample {json} Success-Response:
         {
            "status": true,
            "message": "Success",
            "dataList": [
                {
                "category": "Categories",
                "categoryId": "2",
                "products": [
                    {
                    "id": "2",
                    "name": "new lab cathgoery",
                    "image": "",
                    "created_at": "2021-03-30 14:51:51"
                    },
                    {
                    "id": "1",
                    "name": "womensss new",
                    "image": "",
                    "created_at": "0000-00-00 00:00:00"
                    }
                ]
                }
            ]
            }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get Lab Categories"
                  }
     */


    public function homepage_category_get()
    {
        $catList = $this->Institution_model->getCategories();

        $productCategoryList = [];
        $index = 0;

        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getcategoryList($category->id);
            if ($productList) {
                $productCategoryList[$index] = new stdClass;
                $productCategoryList[$index]->category = $category->name;
                $productCategoryList[$index]->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "assets/images/category_lab/single/" . $productList[$key]['image'];
                    }
                }
                $productCategoryList[$index]->products = $productList;
                $index = $index + 1;
            }
        }

        if ($productCategoryList) {

            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $productCategoryList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get Lab Categories',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }





    /**
     * @api {get} Lab/homepage_Laboratory homepage Laboratory List
     * @apiName Lab Laboratory List
     * @apiGroup Lab
     *
     * 
     *
     *
     * @apiSuccessExample {json} Success-Response:
        {
            "status": true,
            "message": "Success",
            "dataList": [
                {
                "category": "Laboratories",
                "categoryId": "3",
                "products": [
                    {
                    "id": "12",
                    "user_id": "36",
                    "type": "1",
                    "reg_no": "4545",
                    "created_at": "2021-05-21 15:35:47",
                    "reg_document": "",
                    "about": "",
                    "fee": "0",
                    "image": "http://localhost/Anymedion/upload/users/institution/single/4c2b0238d54cf2b58812a63549b8caa6.jpg",
                    "institution_name": "good surgical ",
                    "phone": "9090909"
                    },
                    {
                    "id": "12",
                    "user_id": "36",
                    "type": "1",
                    "reg_no": "4545",
                    "created_at": "2021-05-21 15:35:47",
                    "reg_document": "",
                    "about": "",
                    "fee": "0",
                    "image": "http://localhost/Anymedion/upload/users/institution/single/4c2b0238d54cf2b58812a63549b8caa6.jpg",
                    "institution_name": "good surgical ",
                    "phone": "9090909"
                    }
                ]
                }
            ]
            }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get Laboratory"
                  }
     */


    public function homepage_Laboratory_get()
    {
        $catList = $this->Institution_model->getCategories();


        $productCategoryList = [];
        $index = 0;

        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getProductList($category->id);
            if ($productList) {
                $productCategoryList[$index] = new stdClass;
                $productCategoryList[$index]->category = $category->name;
                $productCategoryList[$index]->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "upload/users/institution/single/" . $productList[$key]['image'];
                    }
                }
                $productCategoryList[$index]->products = $productList;
                $index = $index + 1;
            }
        }

        if ($productCategoryList) {
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $productCategoryList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get product details',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }



    /**
     * @api {get} Lab/homepage_LabTest homepage LabTest List
     * @apiName Lab Lab Test List
     * @apiGroup Lab
     *
     * 
     *
     *
     * @apiSuccessExample {json} Success-Response:
     * 
     * 
            {
                "status": true,
                "message": "Success",
                "dataList": [
                    {
                    "category": "Tests",
                    "categoryId": "4",
                    "products": [
                        {
                        "id": "3",
                        "name": "hemofelia",
                        "cat_id": "0",
                        "description": "for finding hemofelia",
                        "gender": "unisex",
                        "sample_type": "oral sample",
                        "image": "",
                        "created_at": "2021-01-08 11:31:39"
                        }
                    ]
                    }
                ]
                }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get Lab Test"
                  }
     */



    public function homepage_LabTest_get()
    {
        $catList = $this->Institution_model->getCategories();

        $productCategoryList = [];
        $index = 0;
        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getLabTestList($category->id);
            if ($productList) {
                $productCategoryList[$index] = new stdClass;
                $productCategoryList[$index]->category = $category->name;
                $productCategoryList[$index]->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "assets/images/lab_tests/single/" . $productList[$key]['image'];
                    }
                }
                $productCategoryList[$index]->products = $productList;
                $index = $index + 1;
            }
        }

        if ($productCategoryList) {
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $productCategoryList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get Lab Test ',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }


    /**
     * @api {post} Lab/book  Lab Booking 
     * @apiName Booking  Lab Booking
     * @apiGroup Lab
     *
     * @apiHeader  {String} Authorization Authorization value.
     *
     * @apiParamExample {json} Request-Example:
              {
                "Laboratory_id": "23",
                "consult_date": "2021-5-17",
                "start_time": "11:16:04",
                "end_time": "12:16:04",
                "test_id": [
                    "555",
                    "666"
                ],
                "package_id": [
                    "777",
                    "888"
                ]
            }

     * @apiSuccessExample {json} Success-Response:
              {
                "status": true,
                "message": "Success",
                "bookid_id": 6
                }
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Filed to Book"
                    }
     */
    public function book_post()
    {
        $this->auth();

        $userid = $this->user_data->id;
        $this->load->model('Users_model');

        if (empty($this->input_data['Laboratory_id'])) {
            $data['status'] = FALSE;
            $data['message'] = $this->input_data;
            $this->response($data, self::HTTP_BAD_REQUEST);
        } else {
            $doctor_request = [];
            $doctor_request['user_id'] = $userid; //public user id
            $doctor_request['booking_user_id'] = $this->input_data['Laboratory_id']; //laboratory id
            $userdata = $this->Users_model->find($this->input_data['Laboratory_id']);
            if (!$userdata) {
                $data['status'] = FALSE;
                $data['message'] = 'User does not exist';
                $this->response($data, self::HTTP_BAD_REQUEST);
            }
            $doctor_request['booking_user_type'] = 3; // lab usertype

            $doctor_request['consultation_date'] = $this->input_data['consult_date'];
            $doctor_request['start_time'] = $this->input_data['start_time']; //for time slot
            $doctor_request['end_time'] = $this->input_data['end_time']; //for time slot
            $doctor_request['status'] = 1;

            $bookingId = $this->Booking_model->create($doctor_request);



            if (isset($this->input_data['test_id'])) {
                $test_id = array();
                $test_id = $this->input_data['test_id'];
                unset($this->input_data['test_id']);
            }

            if (isset($this->input_data['package_id'])) {
                $package_id = array();
                $package_id = $this->input_data['package_id'];
                unset($this->input_data['package_id']);
            }

            //insert to bookin_lab_test table 
            $arraycount =  count($test_id);

            if ($arraycount != '') {
                $faq = array();
                for ($i = 0; $i < $arraycount; $i++) {
                    $faq[] = array(
                        'booking_id' => $bookingId,
                        'test_id' => $test_id[$i]
                    );
                }
                $BookTest = $this->Institution_model->insertBookTest($faq);
            }

            //insert to booking_lab_package table
            $arraycount1 =  count($package_id);
            if ($arraycount1 != '') {
                $faq1 = array();
                for ($i = 0; $i < $arraycount1; $i++) {
                    $faq1[] = array(
                        'booking_id' => $bookingId,
                        'package_id' => $package_id[$i]
                    );
                }
                $BookPkg = $this->Institution_model->insertBookPkg($faq1);
            }

            if ($bookingId) {

                $this->response([
                    'status' => TRUE,
                    'message' => 'Success',
                    'bookid_id' => $bookingId
                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Filed to Book'
                ], self::HTTP_OK);
            }
        }
    }



    /**
     * @api {post} Lab/inser_consu_time  Insert Opening Time
     * @apiName Lab Insert Opening Time
     * @apiGroup Lab 
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



        if (empty($this->input_data['days']) || empty($this->input_data['start_time']) || empty($this->input_data['end_time'])) {
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


            $arraycount =  count($days);

            $faq = array();
            for ($i = 0; $i < $arraycount; $i++) {
                $faq[] = array(
                    'user_id' => $userid,
                    'day' => $days[$i],
                    'start_time' => $start_time[$i],
                    'end_time' => $end_time[$i]
                );
            }
            $okay = $this->Institution_model->insert_consut_time($faq);
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
    
    
}
