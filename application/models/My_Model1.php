<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class My_Model extends CI_Model
{
	public  function  fetch_manufactur()
	{
		$manufacturer = $this->db->get('manufacturer');
		if ($manufacturer->num_rows() > 0) {

			return $manufacturer->result();
		}
	}


	public function linkCategory($data,$table)
	{

		return $this->db->insert_batch($table,$data);
	
		//return $this->db->insert($table,$data);
	}


	public function fetch_category()
	{	
		$categories = $this->db->get('category');
		if ($categories->num_rows() > 0) {

			return $categories->result();
		}
	}

	public function fetch_consult_time()
	{
		$query = $this->db->get('consultation_time');

		if ($query->num_rows() > 0)
		{
			foreach ($query->result() as $row)
			{
				$data[] = $row;
			}
			return $data;
		}
	}

	//FOR ALL USER LISTVIEWS 
	public function fetch_places($tabel_name,$column)
	{
		 ## Fetch records
		 $this->db->distinct();
		 $this->db->select($column);
		 $this->db->order_by($column,'asc');
		 $records = $this->db->get($tabel_name)->result();
	
		 $data = array();
	
		 foreach($records as $record )
		 {
			$data[] = $record->city;
		 }
	
		 return $data;
	 }
	 

	//FOR ALL PRODUCTS LISTVIEWS 


	public function fetch_pdt_names($tabel_name,$column,$type)
	{
		 ## Fetch records
		 $this->db->distinct();
		 $this->db->select($column);
		 $this->db->where('product_type',$type);
		 $this->db->order_by($column,'asc');
		 $records = $this->db->get($tabel_name)->result();
	
		 $data = array();
	
		 foreach($records as $record )
		 {
			$data[] = $record->$column;
		 }
	
		 return $data;
	 }

	public function fetch_vendor_names($tabel_name,$column)
	{
		$this->db->distinct();
		 $this->db->select($column);
		
		 $this->db->order_by($column,'asc');
		 $records = $this->db->get($tabel_name)->result();
	
		 $data = array();
	
		 foreach($records as $record )
		 {
			$data[] = $record->$column;
		 }
	
		 return $data;
	}

	 public function insertfaq($faq)
	 {
		
			return $this->db->insert_batch('frequently_ask_questions',$faq);
		 	
	 }
	 public  function createMedicine($data,$table)
	{
		$this->db->insert($table,$data);
		return $this->db->insert_id(); //current inserted id returning
	}
}




