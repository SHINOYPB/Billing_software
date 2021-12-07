<?php
defined('BASEPATH') or exit('No direct script access allowed');


// This class is for testing purpost only 
class Test extends Admin_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->lang->load('auth');
		$this->load->model('Purchase_model');
		$this->load->model('Institution_model');
	}

	public function reverseTax()
	{
		$netAmount = 57.55;
		$gst = 12;
		$gst1 = $gst / 100;
		$taxableAmount = $netAmount / (1 + $gst1);
		$gstAmount = $netAmount - $taxableAmount;

		//$fractionalPart = fmod($taxableAmount, 1); // Fetch fractional part of float number
		$taxableAmount = number_format((float)$taxableAmount, 2, '.', ''); // Show only 2 fractional part

		$gstAmount = number_format((float)$gstAmount, 2, '.', ''); // Show only 2 fractional part

		echo "Net amount  ->" . $netAmount;
		echo "<br>";

		echo "Gst %  ->" . $gst;
		echo "<br>";

		echo "Gst Amount ->" . $gstAmount;
		echo "<br>";

		echo "Taxable amount is ->" . $taxableAmount;
		echo "<br>";
	}

	//Test for lab package getting
	public function labPkgTest()
	{
		echo "In labPkgTest";
		echo "<br>";
		$LabTestcount = $this->Institution_model->labPkg_testCount(11);
		// echo "<pre>";
		var_dump($LabTestcount);
		exit();
	}



	// Image upload testing 
	public function imageupload()
	{
		//Insert single image to product table 
		if (!empty($_FILES['image']['name'])) {
			$imageData = [];
			$config['upload_path'] =  base_url('assets\images\products\single');
			$config['allowed_types'] = 'gif|jpg|jpeg|png';
			$config['max_size']      = "2048000";
			$config['remove_spaces'] = TRUE;
			$config['encrypt_name'] = TRUE;
			$this->load->library('upload', $config);
			// $this->listupload->initialize($config);
			
			if (isset($_FILES['image']) && !empty($_FILES['image']['name'])) 
			{
					if (!$this->listupload->do_upload('image')) {
					$this->data['error'] = "Invalid image";
				}
				else 
				{
					$imgName = $this->listupload->data();
					$img = $imgName['file_name'];
					$data['image'] = $img;


					// $this->load->library('image_lib');
					// //cropped thumbnail
					// $config['image_library'] = 'gd2';
					// $config['source_image'] = 'assets/images/products/single' . $data['image'];
					// $config['new_image'] = 'assets/images/products/single' . $data['image'];
					// //    $config['maintain_ratio'] = FALSE;
					// //    $config['width'] = 620;
					// //    $config['height'] = 230;
					// $this->image_lib->initialize($config);
					// $this->image_lib->resize();
					// $this->image_lib->clear();


				}
			}
		}
	}
}
