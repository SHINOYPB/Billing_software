<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class professionals
 */
class Last_login extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('auth');
       $this->load->model('login_history_model');
        $this->data['main_menu_active'] = '';
        $this->data['menu_active'] = 'last_login';
        $this->data['page_title'] = 'Last Login';
    }

    /**
     * Redirect if needed, otherwise display the suggested_shops list
     */
    public function index() {
        // set the flash data error message if there is one
        $this->data['error'] = $this->session->flashdata('error');
        $this->data['message'] = $this->session->flashdata('message');
        if ($this->ion_auth->is_admin()) {
            $this->data['menu_active'] = 'last_login';
            $last_data = $this->login_history_model->fetch_all_array();
            $this->data['last_login'] = $last_data;
            $list = [];
            $this->_render_admin('last_login' . DIRECTORY_SEPARATOR . 'index', $this->data);
        }
    }
   
}