<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Fcm_token extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        
        parent::__construct();
        $this->load->helper('url');
    }


    /**
     * @api {post} Fcm_token/create Add Fcm Tocken
     * @apiName Fcm_token insertCategory
     * @apiGroup Fcm Token
     *
     * @apiHeader  {String} Authorization Authorization value.

     * @apiParamExample {json} Request-Example:
               {
                    "device_type":"android",
                    "device_id":"3434334",
                    "fcm_token":"dfsdvfdbhfgbgbhnynhtukuiuio;poo"
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
    public function create_post()
    {
        $this->auth();
        $user_id = $this->user_data->id;  //get userid using token
        $this->load->model('firebase_token_model');
        $postData['user_id'] = $user_id;

        $postData['device_type'] = $this->input_data['device_type'];
        $postData['device_id'] = $this->input_data['device_id'];
        $postData['fcm_token'] = $this->input_data['fcm_token'];

        $f_data = $this->firebase_token_model->find_by(['device_type' => $postData['device_type'], 'device_id' => $postData['device_id'], 'user_id' => $user_id]);
        if ($f_data) {
            $updated = $this->firebase_token_model->update(['fcm_token' => $postData['fcm_token']], $f_data[0]->id);
            $f_id = $f_data[0]->id;
        } else {
            $fb_data = $this->firebase_token_model->find_by(['device_type' => $postData['device_type'], 'device_id' => $postData['device_id']]);
            if ($fb_data) {
                $updated = $this->firebase_token_model->update(['user_id' => $user_id], $fb_data[0]->id);
                $f_id = $fb_data[0]->id;
            } else {
                $f_id = $this->firebase_token_model->create($postData);
            }
        }
        $data['status'] = TRUE;
        $data['message'] = 'success';
        $data['firebase_id'] = $f_id;
        $this->set_response($data, self::HTTP_OK);
    }

    public function test_post()
    {
        $this->auth();

        $postData['userid'] = $this->user_data->id;

        $data['status'] = TRUE;
        $data['message'] = 'success';
        $data['data']['user'] = $postData;
        $this->set_response($data, self::HTTP_OK);
    }
}
