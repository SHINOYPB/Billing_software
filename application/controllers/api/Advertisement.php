<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Advertisement extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
     
        parent::__construct();
        $this->load->model('Advertisement_model');
    }

    
/**
     * @api {get} Advertisement/advertisement_banner All Banners
     * @apiName Advertisement All Banners
     * @apiGroup Advertisement
     *
     * 
     * @apiSuccessExample {json} Success-Response:
              {
                    "status": true,
                    "message": "The advertisement banners :",
                    "upperFixed": [],
                    "upperSlider": [
                                {
                                    "id": "4",
                                    "name": "Home Page Upper Slider",
                                    "created_at": "2021-05-19 15:41:52",
                                    "advtisement_id": "2",
                                    "image": "http://localhost/Anymedion/assets/images/advertisement/0ea66e2fbc90907c9d0c65777075b82d.jpg",
                                    "position": "1"
                                },
                                {
                                    "id": "6",
                                    "name": "Home Page Upper Slider",
                                    "created_at": "2021-05-19 15:41:52",
                                    "advtisement_id": "2",
                                    "image": "http://localhost/Anymedion/assets/images/advertisement/2ec8c62830b16246f0667f1eede852bd.jpg",
                                    "position": "2"
                                }
                    ],
                    "lowerFixed": [],
                    "lowerSlider": [],
                    "listUpper": [],
                    "listLower": [],
                    "singleView": []
                    }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Cant fetch advertisement banners "
                  }
     */
    public function advertisement_banner_get()
    {
        // HOme page  banner section
        $upperFixed = $this->Advertisement_model->fetch_banner('1');
        $upperSlider = $this->Advertisement_model->fetch_banner('2');
        $lowerFixed = $this->Advertisement_model->fetch_banner('3');
        $lowerSlider = $this->Advertisement_model->fetch_banner('4');

        // LIstview and single view banner section
        $listUpper = $this->Advertisement_model->fetch_banner('5');
        $listLower = $this->Advertisement_model->fetch_banner('6');
        $singleView = $this->Advertisement_model->fetch_banner('7');

        
        foreach ($upperFixed as $key => $sub) {
            $upperFixed[$key]['image'] = base_url() . "assets/images/advertisement/" . $upperFixed[$key]['image'];
        }
        foreach ($upperSlider as $key => $sub) {
            $upperSlider[$key]['image'] = base_url() . "assets/images/advertisement/" . $upperSlider[$key]['image'];
        }
        foreach ($lowerFixed as $key => $sub) {
            $lowerFixed[$key]['image'] = base_url() . "assets/images/advertisement/" . $lowerFixed[$key]['image'];
        }
        foreach ($lowerSlider as $key => $sub) {
            $lowerSlider[$key]['image'] = base_url() . "assets/images/advertisement/" . $lowerSlider[$key]['image'];
        }
        foreach ($listUpper as $key => $sub) {
            $listUpper[$key]['image'] = base_url() . "assets/images/advertisement/" . $listUpper[$key]['image'];
        }
        foreach ($listLower as $key => $sub) {
            $listLower[$key]['image'] = base_url() . "assets/images/advertisement/" . $listLower[$key]['image'];
        }
        foreach ($singleView as $key => $sub) {
            $singleView[$key]['image'] = base_url() . "assets/images/advertisement/" . $singleView[$key]['image'];
        }

        if (1 == 1 ) {
            $this->response([
                'status' => TRUE,
                'message' => 'The advertisement banners :',
                'upperFixed' => $upperFixed,
                'upperSlider' => $upperSlider,
                'lowerFixed' => $lowerFixed,
                'lowerSlider' => $lowerSlider,
                'listUpper' => $listUpper,
                'listLower' => $listLower,
                'singleView' => $singleView,

            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Cant fetch advertisement banners '
            ], self::HTTP_OK);
        }
    }


}