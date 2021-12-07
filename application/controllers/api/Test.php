<?php

date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

require_once(APPPATH . 'controllers/api/razorpay-php/Razorpay.php');

use Razorpay\Api\Api;
use Razorpay\Api\Errors\SignatureVerificationError;

class Test extends Api_Controller
{
    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        parent::__construct();
        // $this->load->model('Products_model');
        $this->load->model('Firebase_token_model');
        $this->load->library('cart');
        $this->load->model('test_model');
    }

    public function fcm_test_post()
    {
        $url = "https://fcm.googleapis.com/fcm/send";
        $serverKey = 'AAAAhtWhlYM:APA91bHSgHoqG2-xOGrYhx32CkQdOUk_9LRK14Z2ORYYyvSpwJ97Ey_M0e_96MGFra4B8mPw5mDey4QAWWmnx7wjccZuOa9e9V-xQeilRUPk3DFsgxdewgajgfIIbnw0dfeLZvHhfOpJ';


        $body = new stdClass();
        $body->type = "test";
        $body->title = $this->input_data['subject'];
        $body->datetime = date('Y-m-d H:i:s');
        $body->subject = "notificaton";

        //$customers = $this->Firebase_token_model->get_all();

        // foreach ($customers as $key => $customer) 
        // {
        // $regtoken = $customer->fcm_token;

        $regtoken = 'cnDtSwguexI:APA91bEtlGz5kpbp8yUuIi6ItgeD7W2cgRWV-0iT7c02ZalRQX8W93KYaYGHDVVTVH_VNCwzxooUXXAia3i-njY6iO9SaPIRfvQ8wn2sBpA_1gWyTmajgsVr6-qt-YjZOJT0Duq8EuaS';

        // $body1="checking sos message";
        // $notification = array('title' =>$title , 'text' => $body1, 'sound' => 'default', 'badge' => '2');
        $arrayToSend = array('to' => $regtoken, 'data' => $body, 'priority' => 'high');
        $json = json_encode($arrayToSend);
        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Authorization: key=' . $serverKey;

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, FALSE);

        //Send the request
        $response = curl_exec($ch);
        //Close request


        // }

        curl_close($ch);

        if ($response === FALSE) {
            $data['status'] = FALSE;
            $data['message'] = 'fcm not working';
            $this->set_response($data, REST_Controller::HTTP_OK);
        } else {
            $data['status'] = TRUE;
            $data['message'] = $response;
            $this->set_response($data, REST_Controller::HTTP_OK);
        }
    }

    public function payment_get()
    {
        $serverSecret = 'GVg0p8OjG2Llev9l7KEVETNp';
        $serverKey = 'rzp_test_xUvzIOLa6eauQR';
        $api = new Api($serverKey, $serverSecret);
        $orderData = [
            'receipt'         => 'rcptid_11',
            'amount'          => 39900, // 39900 rupees in paise
            'currency'        => 'INR'
        ];

        $razorpayOrder = $api->order->create($orderData);
        // echo '<pre>';
        //         print_r($razorpayOrder);
        //         echo '<pre>';
        //         die();
        $rpId = $razorpayOrder['id'];
        ?>
        <form action="http://localhost/Anymedion/api/Test/verify" method="POST">
            <script src="https://checkout.razorpay.com/v1/checkout.js" data-key="<?php echo $serverKey ?>" data-amount="<?php echo $orderData['amount'] ?>" data-currency="INR" data-name="Anymedion" data-image="" data-description="Anymedion" data-prefill.name="Test name" data-prefill.email="testanymedia@gmail.com" data-prefill.contact="9877678876" data-notes.shopping_order_id="rcptid_11" data-order_id="<?php echo $rpId ?>">
            </script>
            <!-- Any extra fields to be submitted with the form but not sent to Razorpay -->
            <input type="hidden" name="shopping_order_id" value="rcptid_11">
        </form>
        <?php
    }

    public function verify_post()
    {
        if ($this->input->post('razorpay_payment_id') != null) {
            $serverSecret = 'GVg0p8OjG2Llev9l7KEVETNp';
            $serverKey = 'rzp_test_xUvzIOLa6eauQR';
            $api = new Api($serverKey, $serverSecret);

            $payment_id = $this->input->post('razorpay_payment_id');
            $order_id = $this->input->post('razorpay_order_id');
            $signature = $this->input->post('razorpay_signature');

            $data['status'] = TRUE;
            $data['payment_id'] = $payment_id;
            $data['order_id'] = $order_id;
            $data['signature'] = $signature;
            try {
                // Please note that the razorpay order ID must
                // come from a trusted source (session here, but
                // could be database or something else)
                $attributes = array(
                    'razorpay_order_id' => $order_id,
                    'razorpay_payment_id' => $payment_id,
                    'razorpay_signature' => $signature
                );

                $api->utility->verifyPaymentSignature($attributes);
                $this->set_response($data, REST_Controller::HTTP_OK);
            } catch (SignatureVerificationError $e) {
                $data1['status'] = false;
                $data1['error'] = 'Razorpay Error : ' . $e->getMessage();
                $this->set_response($data1, REST_Controller::HTTP_OK);
            }
        } else {
            $data['status'] = FALSE;
            $data['message'] = 'Failed';
            $this->set_response($data, REST_Controller::HTTP_OK);
        }
    }

    public function cartTesting_get()
    {

        // Codeigniter library cart implimentation
        $this->load->library('cart');
        $data = array(
            'id'      =>  '1',
            'qty'     =>  '3',
            'price'   => '45',
            'name'    => 'T-Shirt',
            'options' => array('Size' => 'L', 'Color' => 'Red')
        );
        $this->cart->insert($data);
        // Codeignter library cart implimentation ENDING


        // Getting item that saved in cart session
        $isInserted = $this->cart->contents();

        if ($isInserted) {
            $this->response([
                'status' => TRUE,
                'message' => 'successfully added to cart',
                'output' => $isInserted

            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Filed to add cart '
            ], self::HTTP_OK);
        }
    }

    // To destroy cart session
    public function destroy_cart_get()
    {
        $this->cart->destroy();
    }

    public function checkoutTest_post()
    {

        if (isset($_FILES['prescription'])) {


            if (!empty($_FILES['prescription']['name'])) {
                $imageData = [];
                $config['upload_path']      =  FCPATH . "/assets/images/prescription"; // Dont use base_url here, user FCPATH.
                $config['allowed_types']    = 'gif|jpg|jpeg|png|pdf|docx';
                $config['max_size']         = "10000";  // In KB 
                $config['remove_spaces']    = TRUE;
                $config['encrypt_name']     = TRUE;

                $this->load->library('upload');
                $this->upload->initialize($config);

                if (isset($_FILES['prescription']) && !empty($_FILES['prescription']['name'])) {

                    if (!$this->upload->do_upload('prescription')) {
                        $error = $this->upload->display_errors();

                        $this->response([
                            'status' => FALSE,
                            'message' => $error
                        ], self::HTTP_OK);
                    } else {
                        $imgName = $this->upload->data();
                        $img = $imgName['file_name'];

                        $this->response([
                            'status' => TRUE,
                            'message' => 'UPdated successfully',
                            'filename' => $img
                        ], self::HTTP_OK);
                    }
                }
            }
        } else {

            $this->response([
                'status' => FALSE,
                'message' => 'Post Not Received'
            ], self::HTTP_OK);
        }
    }

    public function upload_img_post()
    {
        $image = base64_decode($this->input->post("img_front"));

        $image_name = md5(uniqid(rand(), true));

        $filename = $image_name . '.' . 'png';

        //Rename file name with random number
        $path =  FCPATH . "/assets/images/test/" . $filename;

        //Image uploading folder path
        $uploaded =  file_put_contents($path . $filename, $image);

        echo "Successfully uploaded";
        exit();

        // image is bind and upload to respective folde
        $data_insert = array('front_img' => $filename);

        $success = $this->add_model->insert_img($data_insert);
        if ($success) {
            $b = "User Registered Successfully..";
        } else {
            $b = "Some Error Occured. Please Try Again..";
        }
        echo json_encode($b);
    }
}
