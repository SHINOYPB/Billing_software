<?php
class Test_model extends My_Model
{

    //Setting global variable for setting table.
    public function __construct()
    {
        parent::__construct();
        // var $table_name = 'users';
        $this->table_name = "users";
    }
    
    public function insert_img($data_insert)
    {
        $this->db->insert('table', $data_insert);
    }
}
