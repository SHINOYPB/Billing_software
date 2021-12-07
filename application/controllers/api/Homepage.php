<?php
######################################## API #####################################
date_default_timezone_set('Asia/Kolkata');
defined('BASEPATH') or exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class Homepage extends Api_Controller
{

    function __construct()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        // Construct the parent class
        parent::__construct();
        $this->load->model('Homepage_model');
        $this->load->model('Institution_model');
        $this->load->model('Advertisement_model');
        $this->load->library('cart');
    }

    /**
     * @api {get} Homepage/homepage_Single Homepage HomePage Api
     * @apiName Homepage HomePage Api
     * @apiGroup Homepage 
     *
     * 
     * @apiSuccessExample {json} Success-Response:
        
            {
                "status": true,
                "message": "Success",
                "itemKeys": [
                "Anymedion Deals",
                "Featured Products",
                "Deal Of The Day",
                "Popular Deals",
                "Trending Products",
                "Popular Categories",
                "Lab Category List",
                "Lab Test List",
                "Laboraory List",
                "Lab Package List",
                "Homepage Upper Slider",
                "Homepage Lower Fixed",
                "Homepage Lower Slider",
                "Cart Count"
                ],
                "Anymedion Deals": {
                "titleHead": "Anymedion Deals",
                "categoryId": "1",
                "data": [
                    
                    {
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
                    "image": "https://askmeforanything.com/anymedion/assets/images/products/single/1e11553fdeee5dbc887ee621a58652c7.jpg",
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
                    "created_at": "2021-07-17 17:05:21"
                    }
                ]
                },
                "Featured Products": {
                "titleHead": "Featured Produts",
                "categoryId": "2",
                "data": []
                },
                "Deal Of The Day": {
                "titleHead": "Deal Of The Day",
                "categoryId": "3",
                "data": []
                },
                "Popular Deals": {
                "titleHead": "Popular Deals",
                "categoryId": "4",
                "data": []
                },
                "Trending Products": {
                "titleHead": "Trending Products",
                "categoryId": "5",
                "data": []
                },
                "Popular Categories": {
                "titleHead": "Popular Categories",
                "categoryId": "6",
                "data": []
                },
                "Lab Category List": {
                "titleHead": "Categories",
                "categoryId": "2",
                "data": []
                },
                "Lab Test List": {
                "titleHead": "Tests",
                "categoryId": "4",
                "data": []
                },
                "Laboraory List": {
                "titleHead": "Laboratories",
                "categoryId": "3",
                "data": []
                },
                "Lab Package List": {
                "titleHead": "Full Body Check Up",
                "categoryId": "1",
                "data": []
                },

                "Homepage Upper Slider": [
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
                "Homepage Lower Fixed": [],
                "Homepage Lower Slider": [],
                "Cart Count": 2


            }
        
      
     * @apiErrorExample {json} Error-Response:
                    {
                        "status": false,
                        "message": "Falied to get Home page contents",
                        "dataList": []
                    }
     */

    public function homepage_Single_get()
    {

        // Cart product count getting.

        $authorization = $this->input->get_request_header('Authorization');
        
        if (!empty($authorization)) 
        {
             // From authorization , get user id 
             $this->auth();
             $userid = $this->user_data->id;
             $arrayCount = $this->Homepage_model->getCartcount($userid);
                       
        }
        else
        {
            $cartItemCount = $this->cart->contents(); // get session cart contants
            if( $cartItemCount != null)
            {
                foreach ($cartItemCount as $key => $item) {
                    $arraynea[] = $item['id'];
                }
                $arrayCount =  count($arraynea); 
            }
   
           
        }
        
        
        // Anymedion Deals.
        $productList = $this->Homepage_model->getAnymedDeals();
        if ($productList) {
            $AnyDeals = new stdClass;
            $AnyDeals->titleHead = 'Anymedion Deals';
            $AnyDeals->categoryId = '1';

            foreach ($productList as $key => $product) {
                if ($productList[$key]['image']) {
                    $productList[$key]['image'] = base_url() . "assets/images/products/single/" . $productList[$key]['image'];
                }
            }
            $AnyDeals->data = $productList;
        }


        //Featured products
        $productList = $this->Homepage_model->getFeasturedProducts();
        if ($productList) {
            $FeaturedPdts = new stdClass;
            $FeaturedPdts->titleHead = 'Featured Produts';
            $FeaturedPdts->categoryId = '2';

            foreach ($productList as $key => $product) {
                if ($productList[$key]['image']) {
                    $productList[$key]['image'] = base_url() . "assets/images/products/single/" . $productList[$key]['image'];
                }
            }
            $FeaturedPdts->data = $productList;
        }





        //Deal of the day

        $productList = $this->Homepage_model->getDealOfDay();
        if ($productList) {
            $DealOfDay = new stdClass;
            $DealOfDay->titleHead = 'Deal Of The Day';
            $DealOfDay->categoryId = '3';

            foreach ($productList as $key => $product) {
                if ($productList[$key]['image']) {
                    $productList[$key]['image'] = base_url() . "assets/images/products/single/" . $productList[$key]['image'];
                }
            }
            $DealOfDay->data = $productList;
        }



        //Popular deals

        $productList = $this->Homepage_model->getPopular();
        if ($productList) {
            $PopularDeal = new stdClass;
            $PopularDeal->titleHead = 'Popular Deals';
            $PopularDeal->categoryId = '4';

            foreach ($productList as $key => $product) {
                if ($productList[$key]['image']) {
                    $productList[$key]['image'] = base_url() . "assets/images/products/single/" . $productList[$key]['image'];
                }
            }
            $PopularDeal->data = $productList;
        }




        //Trending products
        $productList = $this->Homepage_model->getTrending();
        if ($productList) {
            $TrendingPdt = new stdClass;
            $TrendingPdt->titleHead = 'Trending Products';
            $TrendingPdt->categoryId = '5';

            foreach ($productList as $key => $product) {
                if ($productList[$key]['image']) {
                    $productList[$key]['image'] = base_url() . "assets/images/products/single/" . $productList[$key]['image'];
                }
            }
            $TrendingPdt->data = $productList;
        }





        // Homepage Popular categories get api 
        $catList = $this->Homepage_model->getCategories();
        //$homeCategoryList = [];
        // $index = 0;

        foreach ($catList as $catId => $category) {
            $catList = $this->Homepage_model->getCategoryList($category->id);

            if ($catList) {
                $homeCategoryList = new stdClass;
                $homeCategoryList->titleHead = $category->name;
                $homeCategoryList->categoryId = $category->id;

                foreach ($catList as $key => $category) {
                    if ($catList[$key]['image']) {
                        $catList[$key]['image'] = base_url() . "assets/images/category/" . $catList[$key]['image'];
                    }
                }

                $homeCategoryList->data = $catList;
            }
        }
        // Homepage Popular categories get api ending here



        // Homepage Laboratory's category list
        $catList = $this->Institution_model->getCategories();



        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getcategoryList($category->id);
            if ($productList) {
                $LabCategoryList = new stdClass;
                $LabCategoryList->titleHead = $category->name;
                $LabCategoryList->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "assets/images/category_lab/single/" . $productList[$key]['image'];
                    }
                }
                $LabCategoryList->data = $productList;
            }
        }
        //Homepage  Laboratory's category list ends here




        // Homepage Lab test list 
        $catList = $this->Institution_model->getCategories();


        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getLabTestList($category->id);
            if ($productList) {
                $LabTestList = new stdClass;
                $LabTestList->titleHead = $category->name;
                $LabTestList->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "assets/images/lab_tests/single/" . $productList[$key]['image'];
                    }
                }
                $LabTestList->data = $productList;
            }
        }
        // Home page Lab test list ends here



        // Homepage Laboratory List 
        $catList = $this->Institution_model->getCategories();

        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getLabList($category->id);
            if ($productList) {
                $HomeLabList = new stdClass;
                $HomeLabList->titleHead = $category->name;
                $HomeLabList->categoryId = $category->id;
                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "upload/users/institution/single/" . $productList[$key]['image'];
                    }
                }
                $HomeLabList->data = $productList;
            }
        }
        // HOmepage Laboratory LIst ends here


        // Homepage laboratory Package LIst
        $catList = $this->Institution_model->getCategories();

        foreach ($catList as $catId => $category) {
            $productList = $this->Institution_model->getProductList($category->id);
            if ($productList) {
                $LabPackageList = new stdClass;
                $LabPackageList->titleHead = $category->name;
                $LabPackageList->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {

                        $productList[$key]['image'] = base_url() . "assets/images/labPackages/single/" . $productList[$key]['image'];
                    }
                }
                $LabPackageList->data = $productList;
            }
        }
        // Homepage laboratory package list - Endshere




        // Home page Advertisement Banner 
        $upperFixed = $this->Advertisement_model->fetch_banner('1');
        $upperSlider = $this->Advertisement_model->fetch_banner('2');
        $lowerFixed = $this->Advertisement_model->fetch_banner('3');
        $lowerSlider = $this->Advertisement_model->fetch_banner('4');


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

        // Home page Advertisement Banner - Endshere 



        $itemKeys = array();

        // Check for data availability 
        if (!empty($AnyDeals)) {
            $itemKeys[] = 'Anymedion Deals';
        }

        if (!empty($FeaturedPdts)) {
            $itemKeys[] = 'Featured Products';
        }

        if (!empty($DealOfDay)) {
            $itemKeys[] = 'Deal Of The Day';
        }


        if (!empty($PopularDeal)) {
            $itemKeys[] = 'Popular Deals';
        }

        if (!empty($TrendingPdt)) {
            $itemKeys[] = 'Trending Products';
        }

        if (!empty($homeCategoryList)) {
            $itemKeys[] = 'Popular Categories';
        }

        if (!empty($LabCategoryList)) {
            $itemKeys[] = 'Lab Category List';
        }
        if (!empty($LabTestList)) {
            $itemKeys[] = 'Lab Test List';
        }

        if (!empty($HomeLabList)) {
            $itemKeys[] = 'Laboraory List';
        }

        if (!empty($LabPackageList)) {
            $itemKeys[] = 'Lab Package List';
        }

        //
        if (!empty($upperFixed)) {
            $itemKeys[] = 'Homepage Upper Fixed';
        }

        if (!empty($upperSlider)) {
            $itemKeys[] = 'Homepage Upper Slider';
        }

        if (!empty($lowerFixed)) {
            $itemKeys[] = 'Homepage Lower Fixed';
        }

        if (!empty($lowerSlider)) {
            $itemKeys[] = 'Homepage Lower Slider';
        }

        if (!empty($arrayCount)) {
            $itemKeys[] = 'Cart Count';
        }
      



        $NewArrray =  array(
            'status' => TRUE,
            'message' => 'Success',
            'itemKeys' => $itemKeys,
            'Anymedion Deals' =>  $AnyDeals,

            'Featured Products' =>  $FeaturedPdts,
            'Deal Of The Day' =>  $DealOfDay,

            'Popular Deals' =>  $PopularDeal,

            'Trending Products' =>  $TrendingPdt,

            'Popular Categories' => $homeCategoryList,
            'Lab Category List' => $LabCategoryList,
            'Lab Test List' => $LabTestList,
            'Laboraory List' => $HomeLabList,
            'Lab Package List' => $LabPackageList,


            'Homepage Upper Fixed' => $upperFixed,
            'Homepage Upper Slider' => $upperSlider,
            'Homepage Lower Fixed' => $lowerFixed,
            'Homepage Lower Slider' => $lowerSlider,

            'Cart Count' => $arrayCount

        );








        // Foreach array 

        foreach ($NewArrray as $key => $value) {
            if (empty($AnyDeals)) {
                unset($NewArrray['Anymedion Deals']);   // 1
            }

            if (empty($FeaturedPdts)) {
                unset($NewArrray['Featured Products']);   // 1
            }

            if (empty($DealOfDay)) {
                unset($NewArrray['Deal Of The Day']);   // 1
            }

            if (empty($PopularDeal)) {
                unset($NewArrray['Popular Deals']);   // 1
            }


            if (empty($TrendingPdt)) {
                unset($NewArrray['Trending Products']);   // 1
            }

            if (empty($homeCategoryList)) {
                unset($NewArrray['Popular Categories']);  //2
            }

            if (empty($LabCategoryList)) {
                unset($NewArrray['Lab Category List']);  //3
            }

            if (empty($LabTestList)) {
                unset($NewArrray['Lab Test List']);  //4
            }

            if (empty($HomeLabList)) {
                unset($NewArrray['Laboraory List']);  //5
            }

            if (empty($LabPackageList)) {
                unset($NewArrray['Lab Package List']);  //6
            }

            //
            if (empty($upperFixed)) {
                unset($NewArrray['Homepage Upper Fixed']);
            }
            if (empty($upperSlider)) {
                unset($NewArrray['Homepage Upper Slider']);
            }
            if (empty($lowerFixed)) {
                unset($NewArrray['Homepage Lower Fixed']);
            }
            if (empty($lowerSlider)) {
                unset($NewArrray['Homepage Lower Slider']);
            }
            //

            if (empty($arrayCount)) {
                unset($NewArrray['Cart Count']);
            }


        }

        $this->response(
            $NewArrray,
            self::HTTP_OK
        );
    }


    /**
     * @api {get} Homepage/ Product section get
     * @apiName  Product section get
     * @apiGroup Homepage 
     *
     * 
     * @apiSuccessExample {json} Success-Response:
                {
                "status": true,
                "message": "Success",
                "dataList": [
                    {
                    "category": "Anymedion deals",
                    "categoryId": "1",
                    "product": [
                        {
                        "id": "1",
                        "name": "Newmed1",
                        "product_type": "1",
                        "company": "Cipla",
                        "salt_composition": "rrr",
                        "description": "test description 1",
                        "image": "",
                        "prescription": "1",
                        "shedule": "",
                        "expiry": "0000-00-00",
                        "price": "1",
                        "gst": "0",
                        "cess": "0",
                        "anymedion_price": null,
                        "discount_price": null,
                        "vendor_id": "1",
                        "verify": "1",
                        "status": "1",
                        "created_at": "2021-07-03 11:49:17"
                        },
                
                    
                        {
                        "id": "2",
                        "name": "Newmed2",
                        "product_type": "1",
                        "company": "Sun",
                        "salt_composition": "ttt",
                        "description": "test description 2",
                        "image": "",
                        "prescription": "1",
                        "shedule": "",
                        "expiry": "0000-00-00",
                        "price": "1",
                        "gst": "0",
                        "cess": "0",
                        "anymedion_price": null,
                        "discount_price": null,
                        "vendor_id": "1",
                        "verify": "1",
                        "status": "1",
                        "created_at": "2021-07-03 11:49:17"
                        }
                    ]
                    }
                
                ]
                }
      
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get product category list",
                        "dataList": []
                    }
     */
    public function index_get()
    {
        $catList = $this->Homepage_model->getCategories();
        $productCategoryList = [];
        $index = 0;
        foreach ($catList as $catId => $category) {
            $productList = $this->Homepage_model->getProductList($category->id);
            if ($productList) {
                $productCategoryList[$index] = new stdClass;
                $productCategoryList[$index]->category = $category->name;
                $productCategoryList[$index]->categoryId = $category->id;

                foreach ($productList as $key => $product) {
                    if ($productList[$key]['image']) {
                        $productList[$key]['image'] = base_url() . "assets/images/products/single/" . $productList[$key]['image'];
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
                'message' => 'Falied to get product category list ',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }



    /**
     * @api {get} Homepage/categories Popular categories get
     * @apiName  Popular categories get
     * @apiGroup Homepage 
     *
     * 
     * @apiSuccessExample {json} Success-Response:
                {
                "status": true,
                "message": "Success",
                "dataList": [
                    {
                    "category": "Popular categories",
                    "categoryId": "6",
                    "categories": [
                        {
                        "id": "10",
                        "name": "shalbin",
                        "parent_id": "3",
                        "image": "",
                        "date": "2021-04-12 12:52:19"
                        },
                        {
                        "id": "2",
                        "name": "Anti viral",
                        "parent_id": "1",
                        "image": "http://localhost/anymedion/assets/images/category/gallery/942c095da269f8cf5cf6f6edb59549d1.jpg",
                        "date": "2021-03-26 13:56:12"
                        },
                        {
                        "id": "4",
                        "name": "Ace Inhibitors Statins Fibrate",
                        "parent_id": "3",
                        "image": "http://localhost/anymedion/assets/images/category/gallery/3d9ff05fe48304594f35512641edfc40.jpg",
                        "date": "2021-03-26 13:58:13"
                        }
                    ]
                    }
                ]
                }
      
     * @apiErrorExample {json} Error-Response:
                  {
                        "status": false,
                        "message": "Falied to get category details",
                        "dataList": []
                    }
     */
    
    public function categories_get()
    {
        $catList = $this->Homepage_model->getCategories();
        $homeCategoryList = [];
        $index = 0;

        foreach ($catList as $catId => $category) {
            $catList = $this->Homepage_model->getCategoryList($category->id);

            if ($catList) {
                $homeCategoryList = new stdClass;
                $homeCategoryList->category = $category->name;
                $homeCategoryList->categoryId = $category->id;

                foreach ($catList as $key => $category) {
                    if ($catList[$key]['image']) {
                        $catList[$key]['image'] = base_url() . "assets/images/category/" . $catList[$key]['image'];
                    }
                }
                $homeCategoryList->categories = $catList;
                $index = $index + 1;
            }
        }

        if ($homeCategoryList) {
            $this->response([
                'status' => TRUE,
                'message' => 'Success',
                'dataList' => $homeCategoryList,
            ], self::HTTP_OK);
        } else {
            $this->response([
                'status' => FALSE,
                'message' => 'Falied to get category details',
                'dataList' => [],
            ], self::HTTP_OK);
        }
    }
}
