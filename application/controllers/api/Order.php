<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Order extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        parent::__construct();
        $this->load->model('Order_model');
        // $this->load->model('Booking_model');
    }

    public function place_order_post()
    {

        // $this->auth();
        // //$utype = $this->user_data->user_type; // 0 for professional and 1 for customer
        // $userid = $this->user_data->id;
        // $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];



        if (empty($this->input_data['products'])) 
        {
            $data['status'] = FALSE;
            $data['message'] = 'Post not supplied';
        } 
        else 
        {

            if (isset($this->input_data['products'])) {
                $products = array();
                $products = $this->input_data['products'];
                unset($this->input_data['products']);
            }

            $arraycount =  count($products);

            $faq = array();
            for ($i = 0; $i < $arraycount; $i++) {
                $faq[] = array(

                    'id' => $products[$i]['pdt_id'],

                    'qty' => $products[$i]['pdt_qty']
                );
            }

            echo "<pre>";
            print_r($products);
            echo "</pre>";
        }
    }
}
