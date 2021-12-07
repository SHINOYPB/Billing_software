<?php
class Admin_model extends CI_Model
{
	public  function getGroup()
	{
		return $this->db->get('groups');
	}

	//Insert the admin table and and get the admin_id ,which is just inserted now
	public function insertAdmin($data)
	{
		$this->db->insert('admin', $data);
		$insert_id = $this->db->insert_id();
		return  $insert_id;
	}

	public function insert_admin_group($data)
	{
		return $this->db->insert('admin-group', $data);
	}

	public  function checkAdmin($data)
	{
		return  $this->db->get_where('admin', $data) ->result_array();
	}

	public function findGroup($admin_id)
	{
		return  $this->db->get_where('admin-group', array('admin_id' => $admin_id))->result_array();
		//return  $this->db->get_where('admin-group', $admin_id) ->result_array();
	}

	public  function findPermission($group_id)
	{
		//Find permission ids associated with $group_id
		return $this->db->select('permission_id')
			->from('group-permission')
			->where('group_id', 1)
			->get()
			->result_array();
		//Fetch permissions using permission ids
	}

}
