<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class professionals Model
 */
class Firebase_token_model extends MY_Model 
{

    public function __construct() 
    {
            parent::__construct();
            $this->table_name = "firebase_tokens";
    }

    public function notif_count() 
    {
        $q = $this->db->get($this->table_name);
        $count=$q->num_rows();
        return $count;
    }

    public function get_tokens($upper,$lower) 
    {
    	$this->db->limit($upper, $lower);
        $q = $this->db->get($this->table_name);
        return $q->result();
    }

    public function get_all()
    {
        $this->db->select('firebase_tokens.fcm_token');
       // $this->db->join('customer_tokens', 'customer_tokens.customer_id=customer_details.customer_id', 'inner');
        $q = $this->db->get_where('firebase_tokens');
        return $q->result();
    }

}
