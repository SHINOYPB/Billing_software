<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends Admin_Controller {

	function __construct() {
		// $this->data['main_menu_active'] = '';
        // $this->data['menu_active'] = '';
        // $this->data['sub_menu_active'] = '';
        // $this->data['page_title'] = '';
        parent::__construct();
	}
	public function index() 
	{
		$this->data['main_menu_active'] = '';
        $this->data['menu_active'] = 'home';
        $this->data['sub_menu_active'] = 'home';
        $this->data['page_title'] = 'Home List';

		$this->_render_admin('/' . DIRECTORY_SEPARATOR . 'dashboard', $this->data);
	}

	public function login()
	{
		$this->load->view('header/header');
		$this->load->view('header/navleft');
		$this->load->view('header/navtop');
		$this->load->view('admin/login');
		$this->load->view('header/footer');
	}

	public function checkAdmin()
	{
		$data['email'] = $this->input->post('email', 'true');
		$data['password'] = $this->input->post('password', 'true');

		$admindata = $this->ModAdmin->checkAdmin($data);
		$admin_id = $admindata[0]['id'];

		//check admin_group table for getting group of current admin
		$adminGroupData = $this->ModAdmin->findGroup($admin_id);
		$group_id = $adminGroupData[0]['group_id'];
		echo $adminGroupData;
		die();
		$group_id = $adminGroupData[0]['group_id'];

		//Find permission from permission table using group_id
		$permissions = $this->ModAdmin->findPermission($group_id);


		if($admindata)
		{
			echo "Logged in successfully";

			 $forsession = array(
			 	'aName' => $admindata[0]['name'],
			 	'aEmail' => $admindata[0]['email'],
			 	);
			$this->session->set_userdata($forsession);
		}

		else
		{
			echo "Login filed";
		}

	}

	public function addAdmin()
	{
		$data['groups'] = $this->ModAdmin->getGroup();
		$this->load->view('admin/header/header');
		$this->load->view('admin/header/navleft');
		$this->load->view('admin/header/navtop');
		$this->load->view('admin/home/admin/addAdmin',$data);
		$this->load->view('admin/header/footer');
	}

	public function createAdmin()
	{
		$data['name'] = $this->input->post('name', 'true');
		$data['email'] = $this->input->post('email', 'true');
		$data['password'] = $this->input->post('password', 'true');

		$admin_group['group_id'] = $this->input->post('group', 'true');

		//insert admin data and get auto incremented admin id
		$admin_group['admin_id'] = $this->ModAdmin->insertAdmin($data);

		if($admin_group['admin_id'])
		{
		    //get admin_id and group id and insert into admin-group table
			$isInserted = $this->ModAdmin->insert_admin_group($admin_group);

			if ($isInserted)
			{
				echo "AdminModel-group table insertion successfull";

				redirect('admin/addAdmin');
			}
			else
			{
				echo "AdminModel-group table insertion failed";
				die();
			}
		}
		else
		{
			echo "AdminModel creation failed";
			die();
		}
	}

}
