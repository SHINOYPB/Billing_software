<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Hospital extends Api_Controller
{

    function __construct()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
       
        // Construct the parent class
        parent::__construct();
        $this->load->model('Hospital_model');
       
    }



    /**
     * @api {get} Hospital/ Hospital search
     * @apiName Hospital Hospital search
     * @apiGroup Hospital 
     *
     * @apiParam (Parameter) {String} longitude Filter result by nearby ambulance. 
     * @apiParam (Parameter) {String} latitude Filter result by nearby ambulance.
   
     * 
     * 
     * @apiSuccessExample {json} Success-Response:
              {
               {
                "status": true,
                "message": "Success",
                "dataList": [
                    {
                        "id": "1",
                        "name": "amal",
                        "address_line_1": "amal",
                        "address_line_2": "thr",
                        "zip": "451254",
                        "city": "thissur",
                        "longitude": "76.21",
                        "latitude": "10.52",
                        "image": "",
                        "state": "keral",
                        "country": "india",
                        "phone1": "5412548754",
                        "phone2": "5487548745",
                        "date": "2021-05-01 14:36:49",
                        "distance": "29.02199999999999"
                    }
                ]
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get Hospital details",
                        "dataList": []
                    }
     */


    public function index_get()
    {
        $parameters = $this->input->get();

        $fields = ['longitude', 'latitude'];
        $search_fields = [];
        foreach ($fields as $v) {
            if (isset($parameters[$v]) && !empty($parameters[$v])) {
                $search_fields[$v] = $parameters[$v];
            } else {
                $search_fields[$v] = null;
            }
        }

        $hospitalList = $this->Hospital_model->search($search_fields);

        if ($hospitalList) {
            foreach ($hospitalList as $key => $hospital) {
                if ($hospitalList[$key]['image']) {
                    $hospitalList[$key]['image'] = base_url() . "assets/images/hospital/" . $hospitalList[$key]['image'];
                }
            }
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $hospitalList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get hospital details',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }
}
