<?php

date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');


class Products extends Api_Controller
{

    function __construct()
    {
        // Construct the parent class
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        parent::__construct();
        $this->load->model('Products_model');
        $this->load->model('CategoryPdt_model');
    }



    /**
     * @api {get} Products/subcategories Subcategories List
     * @apiName Subcategories List
     * @apiGroup Products
     *
     * @apiParam (Parameter) {Number} category_id Get Subcategories list under the category id. 
     * 
     *
     * @apiSuccessExample {json} Success-Response:
     {
    "status": true,
    "message": "success",
    "dataList": [
                    {
                        "id": "2",
                        "name": "Anti viral",
                        "parent_id": "1",
                        "image": "http://localhost/anymedion/assets/images/category/942c095da269f8cf5cf6f6edb59549d1.jpg",
                        "date": "2021-03-26 13:56:12"
                    },
                    {
                        "id": "3",
                        "name": "cardiac",
                        "parent_id": "1",
                        "image": "http://localhost/anymedion/assets/images/category/4d0f66023dbf92e267f486d19f901fd8.jpg",
                        "date": "2021-03-26 13:57:54"
                    }
                ]
    }
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to fetch category"
                  }
     */

    public function subcategories_get()
    {

        $cat_id = $this->input->get('category_id');

        $sub_categories = $this->Products_model->fetch_cate($cat_id);

        if ($sub_categories) {
            $simple_array = array();

            foreach ($sub_categories as $d) {
                $simple_array[] = $d['id'];
            }

            $sub_categories = $this->Products_model->fetch_pdt($simple_array);

            foreach ($sub_categories as $key => $sub) {
                $sub_categories[$key]['image'] = base_url() . "assets/images/category/" . $sub_categories[$key]['image'];
            }


            $data['status'] = TRUE;
            $data['message'] = 'success';
            $data['dataList'] = $sub_categories;
            $this->set_response($data, self::HTTP_OK);
        } else {
            $data['status'] = FALSE;
            $data['message'] = 'Failed to fetch category';
            //$data['dataList'] = $sub_categories;
            $this->set_response($data, self::HTTP_OK);
        }
    }

    ######################################################################################################################################
    // provide category id , and get products listed under the category id provided[products listed under subcategory of category_id] .
    #######################################################################################################################################


    /**
     * @api {get} Products/products Product List
     * @apiName Products List
     * @apiGroup Products
     *
     * @apiParam (Parameter) {Number} cat_id Get product list under the category id provided. 
     * 
     *
     * @apiSuccessExample {json} Success-Response:
                {
                        "status": true,
                        "message": "success",
                        "categories": [
                                {
                                    "id": "2",
                                    "name": "cardiac tablet ",
                                    "product_type": "1",
                                    "manufacturer_id": "2",
                                    "salt_composition": "nthing",
                                    "description": "nthing cardiac description",
                                    "image": "http://localhost/anymedion/assets/images/products/singlefc20719ef1fa3bd0b3e6ebf34c9c508c.jpg",
                                    "order_type": "0",
                                    "expiry": "2021-03-27",
                                    "price": "234",
                                    "date": "2021-03-26 13:59:11",
                                    "cat_id": "4",
                                    "gallery": [
                                        {
                                            "image": "http://localhost/anymedion/assets/images/products/galleryd2f158fb9ccb29b8f2047d5717501b65.jpg",
                                            "date": "0000-00-00 00:00:00"
                                        }
                                    ]
                                },
                                {
                                    "id": "6",
                                    "name": "test",
                                    "product_type": "2",
                                    "manufacturer_id": "1",
                                    "salt_composition": "",
                                    "description": "dfdfdfdf",
                                    "image": "http://localhost/anymedion/assets/images/products/single",
                                    "order_type": "0",
                                    "expiry": "2021-03-31",
                                    "price": "3434",
                                    "date": "2021-03-30 01:33:16",
                                    "cat_id": "1",
                                    "gallery": []
                                }
                                
                                ]
                        }

     * @apiErrorExample {json} Error-Response:
                   {
                        "status": false,
                        "message": "There is no products under this category"
                    }
     */


    public function products_get()
    {

        $cat_id = $this->input->get('cat_id');

        $sub_categories = $this->Products_model->fetch_cate($cat_id);

        $simple_array = array();

        foreach ($sub_categories as $d) {
            $simple_array[] = $d['id'];
        }

        $cat_idd = array("$cat_id");

        $array2 = array_merge($simple_array, $cat_idd);


        $products = $this->Products_model->get_pdts($array2);

        if ($products) {
            foreach ($products as $key => $product) {
                $products[$key]['gallery'] = $this->Products_model->get_imgs($product['id']);

                foreach ($products[$key]['gallery'] as $key1 => $images) {
                    unset($products[$key]['gallery'][$key1]->id);
                    unset($products[$key]['gallery'][$key1]->product_id);
                    $products[$key]['gallery'][$key1]->image = base_url() . "assets/images/products/gallery" . $products[$key]['gallery'][$key1]->image;
                }

                $products[$key]['image'] = base_url() . "assets/images/products/single" . $products[$key]['image'];
            }

            $data['status'] = TRUE;
            $data['message'] = 'success';
            $data['categories'] = $products;
            $this->set_response($data, self::HTTP_OK);
        } else {
            $data['status'] = FALSE;
            $data['message'] = 'There is no products under this category';
            $this->set_response($data, self::HTTP_OK);
        }
    }


    /**
     * @api {get} Products/ Product single view
     * @apiName Products Single view
     * @apiGroup Products
     *
     * @apiParam (Path) {String} id Provide id in path .  
     * 
     *
     * @apiSuccessExample {json} Success-Response:
           
            {
  "status": true,
  "message": "success",
  "output": {
    "id": "13",
    "name": "lexono",
    "product_type": "1",
    "company": "cipla",
    "salt_composition": "Amoxilin ",
    "salt synonyms": "Acetaminophen",
    "storage": "cool and dry place",
    "description": "Medicines",
    "hsn": "676",
    "mfr": "2323",
    "image": "http://localhost/Anymedion/assets/images/products/single/1e11553fdeee5dbc887ee621a58652c7.jpg",
    "prescription": "1",
    "shedule": "",
    "expiry": "2021-08-08",
    "price": "34",
    "gst": "18",
    "cess": "1",
    "anymedion_price": "45",
    "discount_price": "38",
    "vendor_id": "0",
    "verify": "1",
    "status": "0",
    "created_at": "2021-07-17 17:05:21",
    "gallery": [
      {
        "image": "http://localhost/Anymedion/assets/images/products/gallery",
        "created_at": "2021-08-02 18:37:28"
      }
    ],
    "type": "Allopathy",
    "packing_name": "Strip",
    "packing_info": "7",
    "quantity": "20"
  }
}
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Failed to fetch product details"
                  }
     */


    // Product single view api
    public function index_get($productId)
    {
        $invalidLogin = ['status' => FALSE, 'message' => 'Invalid User'];

        $product = $this->Products_model->find_product($productId);

        if ($product == NULL) {
            $data['status'] = FALSE;
            $data['message'] = 'Failed to fetch product details';
            $this->set_response($data, self::HTTP_OK);
        } else {
            if ($product->image) {
                $product->image = base_url() . "assets/images/products/single/" . $product->image;
            }

            $product->gallery = $this->Products_model->get_imgs($productId);
            $productType = $this->Products_model->findType($product->product_type);
            $product->type = $productType->name;


            // Fetch product_packing details using given product ID
            //$product->

            $Packaging = $this->Products_model->get_packing_detail($productId);


            // echo "<pre>";
            // print_r($Packaging);
            // exit();

            foreach ($Packaging as $key => $value) {
                $product->packing_name = $value->packing_name;
                $product->packing_info = $value->packing_info;
                $product->quantity = $value->quantity;
            }


            foreach ($product->gallery as $key1 => $images) {
                unset($product->gallery[$key1]->id);
                unset($product->gallery[$key1]->product_id);
                $product->gallery[$key1]->image = base_url() . "assets/images/products/gallery" . $product->gallery[$key1]->image;
            }


            if ($product) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'success',
                    'output' => $product
                ], self::HTTP_OK);
            } else {
                $this->response($invalidLogin, self::HTTP_CREATED);
            }
        }
    }
}
