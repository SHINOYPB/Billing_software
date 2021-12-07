<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Ambulance extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
     
        parent::__construct();
        $this->load->model('Ambulance_model');
    }
    /**
     * @api {get} Ambulance/ Ambulance search
     * @apiName Ambulance Ambulance search
     * @apiGroup Ambulance 
     *
     * @apiParam (Parameter) {String} longitude Filter result by nearby ambulance. 
     * @apiParam (Parameter) {String} latitude Filter result by nearby ambulance.
   
     * 
     * 
     * @apiSuccessExample {json} Success-Response:
              {
                    "status": true,
                    "message": "Success",
                    "dataList": [
                        {
                            "id": "1",
                            "name": "108",
                            "cat_id": "1",
                            "phone": "54125412",
                            "place": "thrissur",
                            "zip": "5425854",
                            "longitude": "76.21",
                            "latitude": "10.52",
                            "image": "",
                            "date": "2021-05-01 14:34:19",
                            "distance": "0"
                        }
                    ]
                }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get ambulance details",
                        "dataList": []
                    }
     */
    public function index_get()
    {
        $parameters = $this->input->get();

        $fields = ['longitude', 'latitude'];
        $search_fields = [];
        foreach ($fields as $v) {
            if (isset($parameters[$v]) && !empty($parameters[$v]))

            {
                // echo "fetched parameter";
                // exit();
                $search_fields[$v] = $parameters[$v]; 
            }

            else 
            {
                $search_fields[$v] = null;
            }
        }

        $ambulanceList = $this->Ambulance_model->search($search_fields);

        if ($ambulanceList) {
            foreach ($ambulanceList as $key => $ambulance) {
                if ($ambulanceList[$key]['image']) {
                    $ambulanceList[$key]['image'] = base_url() . "assets/images/ambulance/" . $ambulanceList[$key]['image'];
                }
            }
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $ambulanceList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'No ambulance around you',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }
}
