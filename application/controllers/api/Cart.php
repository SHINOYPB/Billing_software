<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Cart extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        // header('Access-Control-Allow-Credentials: true');  // cart session cors error fixing code for reat developer

        parent::__construct();
        $this->load->model('Cart_model');
        $this->load->library('cart');
    }


    /**
     * @api {post} Cart/add_cart Add To Cart
     * @apiName Cart Add Cart
     * @apiGroup Cart
     *
     * @apiHeader  {String} Authorization It is optional.
     * 
     * @apiParamExample {json} Request-Example:
                {
                    "pdt_id": "13",
                    "price": "55",
                    "qty": "2"
                }
     *
     * @apiSuccessExample {json} Success-Response:
                {
                    "status": true,
                    "message": "successfully added to cart",
                    "row_id": "a44eae3f9478e1b3ae5fee52592deaab"
                 }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Filed to add cart "
                  }
     */


    public function add_cart_post() //Add products to cart api
    {

        $authorization = $this->input->get_request_header('Authorization');
        ###############################################################################
        # If the user is logged in then save cart to database
        ###############################################################################
        if (!empty($authorization)) {
            $this->auth();

            $userid = $this->user_data->id; // If loged in fetch userif from that user session

            // Code for saving cart details to database table - cart
            if (empty($this->input_data['pdt_id']) || empty($this->input_data['price']) || empty($this->input_data['qty'])) {
                $data['status'] = FALSE;
                $data['message'] = 'Post not supplied';
            } else {
                $data['id'] = $this->input_data['pdt_id'];
                $data['price'] = $this->input_data['price'];
                $data['qty'] = $this->input_data['qty'];

                // Product name fetch using produt is
                $data['name']  = $this->Cart_model->fetch_pdtName($data['id']);
                $data['options'] = array("user_id" => $userid);

                // Insert into cart - session 
                $this->load->library('cart');
                $data1['rowid'] = $this->cart->insert($data);

                // Need to get subtotal 
                $array_singe_item = $this->cart->get_item($data1['rowid']);
                $data1['sub_total'] = $array_singe_item['subtotal'];

                // Insert cart details to table - cart.
                //  ( Rowid , pdt_id, price, qty , user_id, pdt_name , subtotal ).
                $data1['pdt_id'] = $data['id'];
                $data1['pdt_name'] = $data['name'];
                $data1['user_id'] = $userid;
                $data1['price'] = $data['price'];
                $data1['qty'] = $data['qty'];

                $isInserted = $this->Cart_model->insertCart($data1);

                if ($isInserted) {
                    $this->response([
                        'status' => TRUE,
                        'message' => 'Successfully added to cart',
                        'row_id' => $data1['rowid']

                    ], self::HTTP_OK);
                } else {
                    $this->response([
                        'status' => FALSE,
                        'message' => 'Filed to add cart'
                    ], self::HTTP_OK);
                }
            }
        }

        ####################################################################
        #If the user not logged in then save cart to session
        ####################################################################
        else {
            if (empty($this->input_data['pdt_id']) || empty($this->input_data['price']) || empty($this->input_data['qty'])) {
                $data['status'] = FALSE;
                $data['message'] = 'Post not supplied';
            } else {
                $data['id'] = $this->input_data['pdt_id'];
                $data['price'] = $this->input_data['price'];
                $data['qty'] = $this->input_data['qty'];

                // Product name fetch using product id.
                $data['name']  = $this->Cart_model->fetch_pdtName($data['id']);

                // Insert into cart - session 
                $this->load->library('cart');
                $rowId = $this->cart->insert($data);

                if ($rowId) {

                    $this->response([
                        'status' => TRUE,
                        'message' => 'Successfully added to cart',
                        'row_id' => $rowId

                    ], self::HTTP_OK);
                } else {
                    $this->response([
                        'status' => FALSE,
                        'message' => 'Filed to add cart '
                    ], self::HTTP_OK);
                }
            }
        }
    }


    /**
     * @api {post} Cart/remove_cart_item Remove Cart
     * @apiName Cart Remove Cart
     * @apiGroup Cart
     *
     * @apiHeader  {String} Authorization It is optional.
     * 
     *  * @apiParamExample {json} Request-Example:
              {
                    "row_id": "c20ad4d76fe97759aa27a0c99bff6710"
                }
     * 
     * @apiSuccessExample {json} Success-Response:
               {
                "status": true,
                "message": "Successfully Removed Cart Item"
                }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to remove cart item"
                  }
     */


    public function remove_cart_item_post()
    {

        $authorization = $this->input->get_request_header('Authorization');
        if (!empty($authorization)) {
            $row_id = $this->input_data['row_id'];
            $isItemRemoved = $this->Cart_model->removeItem($row_id);
            if ($isItemRemoved) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Successfully Removed Cart Item - db'
                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed to remove cart item'
                ], self::HTTP_OK);
            }
        } else {
            $row_id = $this->input_data['row_id'];
            $this->load->library('cart');
            $isItemRemoved = $this->cart->remove($row_id);

            if ($isItemRemoved) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Successfully Removed Cart Item - session'
                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed to remove cart item'
                ], self::HTTP_OK);
            }
        }
    }


    /**
     * @api {post} Cart/update_cart_item Update Cart
     * @apiName Cart Update Cart
     * @apiGroup Cart
     *
     * @apiHeader  {String} Authorization It is optional.
     * 
     *  * @apiParamExample {json} Request-Example:
               {
                    "row_id": "c20ad4d76fe97759aa27a0c99bff6710",
                    "qty" : "4"
               }
     * 
     * @apiSuccessExample {json} Success-Response:
               {
                "status": true,
                "message": "Successfully Updated Cart Item",
                "rowid": "c20ad4d76fe97759aa27a0c99bff6710"
                }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to Update cart item"
                  }
     */

    // Update quntity from cart session/db.
    public function update_cart_item_post()
    {
        $authorization = $this->input->get_request_header('Authorization');
        if (!empty($authorization)) {

            $row_id = $this->input_data['row_id'];
            $qty = $this->input_data['qty'];

            $isUpdated = $this->Cart_model->updateQuantity($row_id, $qty);

            if ($isUpdated) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Successfully Updated Cart Item',
                    'rowid' => $row_id
                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed to Update cart item'
                ], self::HTTP_OK);
            }
        } else {
            $row_id = $this->input_data['row_id'];
            $qty = $this->input_data['qty'];

            if (!empty($row_id) && !empty($qty)) {
                $data = array(
                    'rowid' => $row_id,
                    'qty'   => $qty
                );

                $this->load->library('cart');
                $updated = $this->cart->update($data);
            }

            if ($updated) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Successfully Updated Cart Item',
                    'rowid' => $row_id
                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Failed to Update cart item'
                ], self::HTTP_OK);
            }
        }
    }





    /*
      Function   : This api returns cart table info if we provide autorization tocken.
                 If not provide any tocken , It returns cart items from session.
    */
    /**
     * @api {post} Cart/show_cart Show Cart
     * @apiName Cart Show Cart
     * @apiGroup Cart
     *
     * @apiHeader  {String} Authorization It is optional.
     * 
     * @apiSuccessExample {json} Success-Response:
               {
                    "status": true,
                    "total_price": 580,
                    "total_Item": 14,
                    "message": "The cart items are:",
                    "output": {
                        "c20ad4d76fe97759aa27a0c99bff6710": {
                        "id": "12",
                        "price": 54,
                        "qty": 10,
                        "name": "liver kera",
                        "rowid": "c20ad4d76fe97759aa27a0c99bff6710",
                        "subtotal": 540,
                        "image": "http://localhost/Anymedion/assets/images/products/single/fd7693a890ba4420dcebbd4e90928d95.png"
                        },
                        "c51ce410c124a10e0db5e4b97fc2af39": {
                        "id": "13",
                        "price": 10,
                        "qty": 4,
                        "name": "lexono",
                        "rowid": "c51ce410c124a10e0db5e4b97fc2af39",
                        "subtotal": 40,
                        "image": "http://localhost/Anymedion/assets/images/products/single/1e11553fdeee5dbc887ee621a58652c7.jpg"
                        }
                    }
                    }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "There is no item in cart"
                  }
     */

    public function show_cart_get()
    {
        $authorization = $this->input->get_request_header('Authorization');
        if (!empty($authorization)) {

            ###### Get cart items from CART table #####
            // From authorization , get user id 
            $this->auth();
            $userid = $this->user_data->id;


            $cart_items = $this->Cart_model->get_cart_details($userid);


            foreach ($cart_items as $key => $sub) {
                $cart_items[$key]['image'] = base_url() . "assets/images/products/single/" . $cart_items[$key]['image'];
            }
            $TotalAmount = 0;
            $total_item = 0;
            foreach ($cart_items as $key => $sub) {
                $TotalAmount = $TotalAmount + $cart_items[$key]['sub_total'];
                $total_item = $total_item + $cart_items[$key]['qty'];
            }

            // echo "<pre>";
            // print_r($cart_items);
            // exit();

            if ($cart_items) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'The cart items are:',
                    'total_price' => $TotalAmount,
                    'total_Item' => $total_item,
                    'output' => $cart_items

                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'There is no item in cart '
                ], self::HTTP_OK);
            }
        } else {

            # Getting item that saved in cart session
            $isInserted = $this->cart->contents();

            foreach ($isInserted as $key => $item) {

                $image = $this->Cart_model->get_pdt_image($item['id']);
                $isInserted[$key]['image'] = base_url() . "assets/images/products/single/" . $image;
            }

            $totalPrice = $this->cart->total();

            $totalItem = $this->cart->total_items();

            if ($isInserted) {
                $this->response([
                    'status' => TRUE,

                    'total_price' => $totalPrice,
                    'total_Item' => $totalItem,
                    'message' => 'The cart items are:',
                    'output' => $isInserted

                ], self::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'There is no item in cart '
                ], self::HTTP_OK);
            }
        }
    }




    /**
     * @api {post} Cart/checkout Check Out
     * @apiName Cart Check Out
     * @apiGroup Cart
     *
     * @apiHeader  {String} Authorization Tocken 
     * 
     *  @apiParam (Parameter) {String} instructions Customer Instructions. 
     * @apiParam (Parameter) {File} prescription Customer medicine prescription. 
     * @apiParam (Parameter) {File} voice Customer voice note.
     *
     * @apiSuccessExample {json} Success-Response:
                {
                "status": true,
                "message": "Successfully placed order",
                "voice_name": "a67a19dd724454283891babc7753efe5.MP3",
                "image_name": "f03bafc539c81728273589f101e4c173.pdf"
                }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to place order "
                  }
     */

    // Get pdt from cart and place order to order table. 
    public function checkout_post()
    {
        $this->auth();
        $userid = $this->user_data->id;
        $data['text_note'] = $this->input->post('instructions');

        #################################################################
        //Get order Number from table - orders
        $lastInvId = $this->Cart_model->get_orderNo();


        //If invoice table is empty assign a starting invoice number.
        if (empty($lastInvId)) {
            $InvoId = "ANYORD0001";
            $data['order_no'] = $InvoId;
        }


        //Get last invoice number and add 1 to it .
        else {
            $latId = $lastInvId->order_no;
            $idd = str_replace("ANYORD", "", $latId);
            $id = str_pad($idd + 1, 4, 0, STR_PAD_LEFT);
            $InvoId = 'ANYORD' . $id;
            $data['order_no'] = $InvoId;
        }
        ##########################################################

        // Fetch total amount from cart table
        $total = $this->Cart_model->fetch_total($userid);
        foreach ($total as $key => $value) {
            $data['total_amt'] = $value->sub_total;
        }


        // If cart table is empty then total amt is null
        // So set order_type == prescription in orders table
        if ($data['total_amt'] == null) {
            $data['order_type'] = "prescription";
        } else {
            $data['order_type'] = "medicine";
        }


        // Validation part
        if (isset($_FILES['prescription']) &&  isset($_FILES['voice'])) {
            ######################## Fetch Prescription ##################################
            if (!empty($_FILES['prescription']['name'])) {
                $imageData = [];
                $config['upload_path']      =  FCPATH . "/assets/images/prescription"; // Dont use base_url here, user FCPATH.
                $config['allowed_types']    = 'gif|jpg|jpeg|png|pdf|docx';
                $config['max_size']         = "20000";  // In KB 
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
                    }
                }
            }

            ##########################################################
            # Fetch Voice Note 
            ##########################################################
            if (!empty($_FILES['voice']['name'])) {
                $imageData = [];
                $config['upload_path']      =  FCPATH . "/assets/images/voice"; // Dont use base_url here, user FCPATH.
                $config['allowed_types']    = 'wave|mp3|aac|wma|m4a';
                $config['max_size']         = "20000";  // In KB 
                $config['remove_spaces']    = TRUE;
                $config['encrypt_name']     = TRUE;

                $this->load->library('upload');
                $this->upload->initialize($config);

                if (isset($_FILES['voice']) && !empty($_FILES['voice']['name'])) {

                    if (!$this->upload->do_upload('voice')) {
                        $error = $this->upload->display_errors();

                        $this->response([
                            'status' => FALSE,
                            'message' => $error
                        ], self::HTTP_OK);
                    } else {
                        $imgName = $this->upload->data();
                        $voice = $imgName['file_name'];
                    }
                }
            }


            // Just insert voice and prescription name to orders table 
            $data['prescription_img'] = $img;
            $data['voice_msg'] = $voice;
            $data['customer_id'] = $userid;


            // The cart has prescription , then set prescription column to 1 in order table
            if (isset($img)) {
                $data['prescription'] = 1;
            }


            // Get address and pincode and phone using user_id
            $customer_details = $this->Cart_model->get_user_detail($userid);
            foreach ($customer_details as $key => $value) {
                $data['delivery_address'] = $value['address_line_1'];
                $data['pincode'] = $value['zip'];
                $data['phone'] = $value['phone'];
            }


            // Insert to order table
            $isInserted = $this->Cart_model->make_order($data);


            // Insert entry to order status table
            $data1['order_no'] = $data['order_no'];
            $data1['status'] =  1;
            $statusInsert = $this->Cart_model->insertStatus($data1);


            // Insert products to ordered_product table
            $cart_pdts = $this->Cart_model->fetch_cart($userid);
            foreach ($cart_pdts as $key => $value) {
                $inerting_arry[] = array(
                    'order_no' => $data['order_no'],
                    'product_id' => $value['pdt_id'],
                    'qty' => $value['qty'],
                    'amount' => $value['sub_total']
                );
            }
            $isokay =  $this->Cart_model->insert_ord_pdt($inerting_arry);



            if ($isInserted == true && $isokay == true && $statusInsert == true) {

                // Delete cart items
                $this->Cart_model->deletCart($userid);
                $this->response([
                    'status' => TRUE,
                    'message' => 'Successfully placed order',
                    'voice_name' => $voice,
                    'image_name' => $img
                ], self::HTTP_OK);
            } else {

                $this->response([
                    'status' => TRUE,
                    'message' => 'Failed to place order'

                ], self::HTTP_OK);
            }
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Post Not Received'
            ], self::HTTP_OK);
        }
    }
}
