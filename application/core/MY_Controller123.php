<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

//include Rest Controller library
require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

/**
 * The base controller which is used by the Front and the Admin controllers
 */
class Base_Controller extends CI_Controller {

    public function __construct() {

        parent::__construct();

        // load the migrations class
        $this->load->library('migration');
    }

    function toMysqlDate($date) {
        return date('Y-m-d', strtotime($date));
        // return $date;
    }

}

class Auth_Controller extends Base_Controller {

    function __construct() {

        parent::__construct();
        $this->load->add_package_path(APPPATH . 'third_party/ion_auth/');
        $this->load->library('ion_auth');
        $this->load->helper(array('url', 'language'));
        if ($this->ion_auth->logged_in()) {
            $this->data['user'] = $this->ion_auth->user()->row();
            $this->data['menu_active'] = '';
            $this->data['sub_menu_active'] = '';
            $this->data['page_title'] = '';
            $this->data['is_admin'] = $this->ion_auth->is_admin();
        } else {
            $this->data['user'] = '';
        }
    }

    public function pre($arr) {
        echo "<pre>";
        print_r($arr);
        exit();
    }

    public function pr($arr) {
        echo "<pre>";
        print_r($arr);
    }

    public function _render_admin($view, $data = NULL, $returnhtml = FALSE) {//I think this makes more sense
        $this->viewdata = (empty($data)) ? $this->data : $data;

        // This will return html on 3rd argument being true
        if ($returnhtml) {
            return $this->load->view($view, $this->viewdata, $returnhtml);
        } else {
            $this->load->view('header', $this->viewdata, $returnhtml);
            $this->load->view($view, $this->viewdata, $returnhtml);
            $this->load->view('footer', $this->viewdata, $returnhtml);
        }
    }

    /**
     * @return array A CSRF key-value pair
     */
    public function _get_csrf_nonce() {
        $this->load->helper('string');
        $key = random_string('alnum', 8);
        $value = random_string('alnum', 20);
        $this->session->set_flashdata('csrfkey', $key);
        $this->session->set_flashdata('csrfvalue', $value);

        return array($key => $value);
    }

    /**
     * @return bool Whether the posted CSRF token matches
     */
    public function _valid_csrf_nonce() {
        $csrfkey = $this->input->post($this->session->flashdata('csrfkey'));
        if ($csrfkey && $csrfkey === $this->session->flashdata('csrfvalue')) {
            return TRUE;
        }
        return FALSE;
    }

}

class Admin_Controller extends Auth_Controller {

    function __construct() {

        parent::__construct();

        if (!$this->ion_auth->logged_in()) {
            redirect('auth/login', 'refresh');
        }
    }

}

class Api_Controller extends REST_Controller {

    public $input_data = null;
    public $user_data = [];

    function __construct() {
        parent::__construct();
        $this->load->database();
        $this->input_data = json_decode(file_get_contents('php://input'), true);
    }

    public function auth() {
        //JWT Auth middleware
        $headers = $this->input_data['token'];
        $jwt_key = $this->config->item('jwt_key'); //secret key for encode and decode
        $token = "token";
        if (!empty($headers)) {
            if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
                $token = $matches[1];
            }
        }
        try {
            $decoded = JWT::decode($token, $jwt_key, array('HS256'));
            $this->user_data = $decoded;
        } catch (Exception $e) {
            $invalid = ['status' => $e->getMessage()]; //Respon if credential invalid
            $this->response($invalid, 401); //401
        }
    }

}
