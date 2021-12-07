<?php

date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

// require(APPPATH . 'libraries/REST_Controller.php');

class Category extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
      
        parent::__construct();
        $this->load->model('CategoryPdt_model');
    }

    public function index_get()
    {
        $category = $this->CategoryPdt_model->getCategories();
        $data['status'] = TRUE;
        $data['message'] = 'success';
        $data['category'] = $category;
        $this->set_response($data, REST_Controller::HTTP_OK);
    }

    /**
     * @api {post} Category/insertCategory Insert Category
     * @apiName Category insertCategory
     * @apiGroup Category
     *
     * @apiParamExample {json} Request-Example:
               {
                    "name":"AnimalFood",
                    "parent_id":"3"
               }

     *
     * @apiSuccessExample {json} Success-Response:
                 {
                    "status": true,
                    "message": "success",
                    "output": {
                        "name": "AnimalFood",
                        "parent_id": "3"
                    }
                }

     * @apiErrorExample {json} Error-Response:
                   {
                        "status": false,
                        "message": "Failed to insert data"
                    }
     */
    public function insertCategory_post()
    {
        /// $post = array();
        // foreach ($_POST as $key => $value) 
        // {
        //     $post[$key] = $this->input->post($key);
        // }
        $params = json_decode(file_get_contents('php://input'), TRUE);

        // $user = array(

        //     'name' => $params['name'],
        //     'parent_id' => $params['parent_id']
        // );

        if (empty($params['name']) || empty($params['parent_id'])) {
            $data['status'] = FALSE;
            $data['message'] = 'Post not supplied';
            $this->set_response($data, REST_Controller::HTTP_OK);
        } else {
            $data['name'] = $params['name'];
            $data['parent_id'] = $params['parent_id'];

            $isInserted =  $this->CategoryPdt_model->inserCategoryPdt($data);

            if ($isInserted) {
                // $data['status'] = TRUE;
                // $data['message'] = 'success';
                // $this->set_response($data, REST_Controller::HTTP_OK);

                $this->response([
                    'status' => TRUE,
                    'message' => 'success',
                    'output' => $data
                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Failed to insert data'
                ], self::HTTP_OK);
            }
        }
    }
}
