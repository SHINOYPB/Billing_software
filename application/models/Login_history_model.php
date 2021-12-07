<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class Quotes Model
 */
class Login_history_model extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->table_name = "login_history";
    }
}