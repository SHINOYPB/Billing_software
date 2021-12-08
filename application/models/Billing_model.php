<?php

defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Class Permissions Model
 */
class Billing_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->table_name = "invoice";
    }
    public function insertINvoicePDt($pdt_array)
    {
        return $this->db->insert_batch($this->table_name , $pdt_array);
    }
    

}
