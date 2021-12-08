<?php
defined('BASEPATH') or exit('No direct script access allowed');


use setasign\Fpdi\Fpdi;
// use \setasign\Fpdi\FpdfTpl;

require_once(FCPATH . 'vendor/setasign/fpdf/fpdf.php');
require_once(FCPATH . 'vendor/setasign/fpdi/src/autoload.php');


class Billing extends Admin_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->lang->load('auth');
		$this->load->model('Billing_model');
	}

	public function index() //invoice form render function
	{
		$this->data['main_menu_active'] = '';
		$this->data['menu_active'] = 'billing';
		$this->data['sub_menu_active'] = 'create_billing';
		$this->data['page_title'] = 'Home List';

		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'billing_form', $this->data);
	}

	public function create_bill()
	{


		$name = $this->input->post('name', true);  //array
		$price = $this->input->post('price', true); //array
		$tax = $this->input->post('tax', true); //array
		$qty = $this->input->post('qty', true); //array
		$total = $this->input->post('total', true); //array
		$total_amount = $this->input->post('total_amount', true); //array

		//Array prepration for pdf table data generation 
		$arraycount =  count($price);

		if ($price[0] != null) {
			$pdt_array = array();
			for ($i = 0; $i < $arraycount; $i++) {

				$pdt_array[] = array(

					'name' => $name[$i],
					'price' => $price[$i],
					'tax' => $tax[$i],
					'qty' => $qty[$i],
					'total' => $total[$i],
				);
			}

			$okay = $this->Billing_model->insertINvoicePDt($pdt_array);
		}

			// initiate FPDI
			$pdf = new Fpdi('P', 'mm', 'A5'); //(Orientation  , Measuement unit , Papersize)
			// add a page
			$pdf->AddPage();
			// set the source file
			$pdf->setSourceFile(FCPATH . 'invoice.pdf');
			// import page 1
			$tplIdx = $pdf->importPage(1);
			// use the imported page and place it at position 10,10 with a width of 100 mm(ignored commevt)
			$pdf->useTemplate($tplIdx); //Directly use template 

	
			//Margin eliminating 
			$pdf->SetMargins(0, 0, 0);
			$pdf->SetAutoPageBreak(false, 0);
	
			// now write some text above the imported page
		
			//Print Delivery NO , GSt IN , Fassai no
			$pdf->SetFont('Arial', '', 7);
						
			$x = 7;
			$y = 33;
			$slNO = 1;
			// For product details 
			// $pdf->ln(15);
			foreach ($pdt_array as $ds) {
				//Cell(width , height , text , border , end line , [align] )
				$pdf->SetFont('Arial', '', 9);
				$pdf->SetXY($x, $y);
				// $pdf->Cell(52, 5, $slNO, 1, 0, 'C');
				$pdf->Cell(54.5, 5, $ds['name'], 0, 0, 'C');
				$pdf->Cell(20.5, 5, $ds['price'], 0, 0, 'C');
				$pdf->Cell(21, 5, $ds['tax'], 0, 0,'C');
				$pdf->Cell(18.4, 5, $ds['qty'], 0, 0, 'C');
				$pdf->SetFont('Arial', '', 9);
				$pdf->Cell(19, 5, $ds['total'], 0, 0, 'C');
				$y = $y + 9;
				$slNO = $slNO + 1;
			}

			$pdf->SetXY(127, 150.5);
			$pdf->Write(0, $total_amount);
	
			$pdf->Output('I', 'generated.pdf');


	}
	
}
