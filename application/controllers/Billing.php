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

		//Get invoice Number from table - invoice_billing 
		$lastInvId = $this->Billing_model->getInvoiceNo();


		//If invoice table is empty assign a starting invoice number.
		if (empty($lastInvId)) {
			$InvoId = "ANYMED0001";
			$this->data['invoiceId'] = $InvoId;
		}

		//Get last invoice number and add 1 to it .
		else {
			$latId = $lastInvId->invoice_no;
			$idd = str_replace("ANYMED", "", $latId);
			$id = str_pad($idd + 1, 4, 0, STR_PAD_LEFT);
			$InvoId = 'ANYMED' . $id;
			$this->data['invoiceId'] = $InvoId;
		}

		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'billing_form', $this->data);
	}

	// AJAX FUNCTION
	public function fetch_pdt_price() //Fetch product price to show in invoice form
	{
		if ($this->input->is_ajax_request()) 
		{
			$pdtID = $this->input->post('id', true);
			$pdtPrice = $this->Billing_model->getPdt_price($pdtID);

			if (!empty($pdtPrice)) {
				$data['return'] = true;
				$data['a'] = $pdtPrice;
				echo json_encode($data);
			} else {
				$data['return'] = false;
				$data['message'] = 'cant get data from table';
				echo json_encode($data);
			}
		} 

		else 
		{
			$data['return'] = false;
			$data['message'] = 'Ajax request not getting';
			echo json_encode($data);
		}

	}

	public function CreateInvoice()  //Invoice save in db table function
	{

		// $this->form_validation->set_rules('invoice_no', 'invoice_no', 'required');
		// // $this->form_validation->set_rules('company', 'company', 'required');
		// // $this->form_validation->set_rules('description', 'Description', 'required');
		// // $this->form_validation->set_rules('price', 'Price', 'required');
		// if ($this->form_validation->run()) {

		$data['invoice_no'] = $this->input->post('invoice_no', true);

		
		$pdtPrice = $this->Billing_model->CreateInvoice($data);

		if (!empty($pdtPrice)) {
			$this->index();
		} else {
			echo "insertion not success";
		}

		// }
		// else
		// {

		// 	echo "post error";

		// }

	}


	public function create_pdf() //Sample template for pdf render usgin Fpdf lib.
	{

		//A4 width : 219mm
		//default margin : 10mm each side
		//writable horizontal : 219-(10*2)=189mm

		$pdf = new FPDF('L', 'mm', 'A5');

		$pdf->AddPage();

		//set font to arial, bold, 14pt
		$pdf->SetFont('Arial', 'B', 14);


		//Cell(width , height , text , border , end line , [align] )


		$pdf->Cell(65, 5, 'Anymedion', 0, 0);

		$pdf->SetFont('Arial', 'B', 14);
		$pdf->Cell(65, 5, 'Bill To', 0, 0);

		$pdf->SetFont('Arial', 'B', 14);
		$pdf->Cell(59, 5, 'INVOICE', 0, 1); //end of line


		//set font to arial, regular, 12pt
		$pdf->SetFont('Arial', '', 12);

		$pdf->Cell(75, 5, 'Olarikara Junction', 0, 0);
		$pdf->Cell(59, 5, 'Dasan P K', 0, 1); //end of line

		$pdf->Cell(75, 5, 'Thrissur, 680511', 0, 0);
		$pdf->Cell(55, 5, 'Kallingal Hse', 0, 0);
		$pdf->Cell(25, 5, 'Invoice #', 0, 0);
		$pdf->Cell(34, 5, 'ANYMED0001', 0, 1); //end of line

		$pdf->Cell(75, 5, 'Phone : +919447030356', 0, 0);
		$pdf->Cell(55, 5, 'P O Elavally', 0, 0);
		$pdf->Cell(25, 5, 'Date', 0, 0);
		$pdf->Cell(34, 5, '25/07/2021', 0, 1); //end of line

		$pdf->Cell(130, 5, '', 0, 0);
		$pdf->Cell(25, 5, '', 0, 0);
		$pdf->Cell(34, 5, '', 0, 1); //end of line

		//make a dummy empty cell as a vertical spacer
		$pdf->Cell(189, 10, '', 0, 1); //end of line





		//make a dummy empty cell as a vertical spacer
		$pdf->Cell(189, 10, '', 0, 1); //end of line

		//invoice contents
		$pdf->SetFont('Arial', 'B', 12);

		$pdf->Cell(29, 5, 'Sl.No', 1, 0);
		$pdf->Cell(35, 5, 'Name', 1, 0);
		$pdf->Cell(30, 5, 'Price', 1, 0);
		$pdf->Cell(31, 5, 'Qty', 1, 0);
		$pdf->Cell(32, 5, 'Tax', 1, 0);
		$pdf->Cell(32, 5, 'Amount', 1, 1); //end of line

		$pdf->SetFont('Arial', '', 12);

		//Numbers are right-aligned so we give 'R' after new line parameter
		$pdf->Cell(29, 5, '1', 1, 0);
		$pdf->Cell(35, 5, 'UltraCool Fridge', 1, 0);
		$pdf->Cell(30, 5, '56', 1, 0);
		$pdf->Cell(31, 5, '3', 1, 0);
		$pdf->Cell(32, 5, '4', 1, 0);
		$pdf->Cell(32, 5, '3,250', 1, 1, 'R'); //end of line

		$pdf->Cell(29, 5, '1', 1, 0);
		$pdf->Cell(35, 5, 'UltraCool Fridge', 1, 0);
		$pdf->Cell(30, 5, '56', 1, 0);
		$pdf->Cell(31, 5, '3', 1, 0);
		$pdf->Cell(32, 5, '4', 1, 0);
		$pdf->Cell(32, 5, '3,250', 1, 1, 'R'); //end of line

		$pdf->Cell(29, 5, '1', 1, 0);
		$pdf->Cell(35, 5, 'UltraCool Fridge', 1, 0);
		$pdf->Cell(30, 5, '56', 1, 0);
		$pdf->Cell(31, 5, '3', 1, 0);
		$pdf->Cell(32, 5, '4', 1, 0);
		$pdf->Cell(32, 5, '3,250', 1, 1, 'R'); //end of line

		//summary
		$pdf->Cell(125, 5, '', 0, 0);
		$pdf->Cell(23, 5, 'Subtotal', 0, 0);
		$pdf->Cell(9, 5, 'Rs', 1, 0);
		$pdf->Cell(32, 5, '4,450', 1, 1, 'R'); //end of line

		$pdf->Cell(125, 5, '', 0, 0);
		$pdf->Cell(23, 5, 'Taxable', 0, 0);
		$pdf->Cell(9, 5, 'Rs', 1, 0);
		$pdf->Cell(32, 5, '0', 1, 1, 'R'); //end of line

		$pdf->Cell(125, 5, '', 0, 0);
		$pdf->Cell(23, 5, 'Tax Rate', 0, 0);
		$pdf->Cell(9, 5, '%', 1, 0);
		$pdf->Cell(32, 5, '10%', 1, 1, 'R'); //end of line

		$pdf->Cell(125, 5, '', 0, 0);
		$pdf->Cell(23, 5, 'Total Due', 0, 0);
		$pdf->Cell(9, 5, 'Rs', 1, 0);
		$pdf->Cell(32, 5, '4,450', 1, 1, 'R'); //end of line



		$pdf->Output();
	}

	public function pdf()  //Unsuccessfull attempt to implement Fpdi for pdf template input and modification
	{
		$pdf = new FPDI('P', 'mm', array(178.9, 263.31));
		$pdf->AddPage();

		//Set the source PDF file
		$pagecount = $pdf->setSourceFile("Yemplate.pdf");
		$tpl = $pdf->importPage(1, PdfReader\PageBoundaries::MEDIA_BOX);
		$pdf->useTemplate($tpl);

		//Add Name for Invoice
		$pdf->SetXY(31, 37);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(50, 4, "John Doe", 0, 1, 'L', 1);

		//Add Company for invoice
		$pdf->SetXY(31, 42.80);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(50, 4, "John & Doe Co.", 0, 1, 'L', 1);

		//Add Address Line 1 for invoice
		$pdf->SetXY(31, 47.80);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(50, 3, "23 Areena Plaza, Street 45", 0, 1, 'L', 1);

		//Add Address Line 2 for invoice
		$pdf->SetXY(31, 51.80);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(50, 3, "Old Town, Boston, MA", 0, 1, 'L', 1);

		//Add Address Line 3 for invoice
		$pdf->SetXY(31, 56.80);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(50, 3, "United States", 0, 1, 'L', 1);

		//Add Invoice No.
		$pdf->SetXY(140, 37);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 8);
		$pdf->Cell(30, 5, "WPEASY-190726", 0, 1, 'L', 1);

		//Add Date for invoice
		$pdf->SetXY(140, 42.80);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 8);
		$pdf->Cell(30, 5, "26 July 2019", 0, 1, 'L', 1);

		//Add Product Name for invoice
		$pdf->SetXY(11, 82);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(80, 6, "WordPress Website Development & Designing", 0, 1, 'L', 1);

		//Add Price for Invoice
		$pdf->SetXY(146, 82);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', '', 9);
		$pdf->Cell(15, 6, "500.00 USD", 0, 1, 'L', 1);

		//Add Total Price for Invoice
		$pdf->SetXY(146, 171.8);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', 'B', 9);
		$pdf->Cell(15, 5, "500.00 USD", 0, 1, 'L', 1);

		//Add Total amount payable in Words
		$pdf->SetXY(9, 185);
		$pdf->SetFillColor(255, 255, 255);
		$pdf->SetFont('Arial', 'B', 9);
		$pdf->Cell(60, 5, "FIVE HUNDREDS DOLLARS ONLY", 0, 1, 'L', 1);

		//destination of dynamically generate pdf. F stands for saving the file.
		$pdf->Output("invoice_generated.pdf", "F");
	}


	public function numberTowords($num)  // Number to word conversion
	{

		$ones = array(
			0 => "ZERO",
			1 => "ONE",
			2 => "TWO",
			3 => "THREE",
			4 => "FOUR",
			5 => "FIVE",
			6 => "SIX",
			7 => "SEVEN",
			8 => "EIGHT",
			9 => "NINE",
			10 => "TEN",
			11 => "ELEVEN",
			12 => "TWELVE",
			13 => "THIRTEEN",
			14 => "FOURTEEN",
			15 => "FIFTEEN",
			16 => "SIXTEEN",
			17 => "SEVENTEEN",
			18 => "EIGHTEEN",
			19 => "NINETEEN",
			"014" => "FOURTEEN"
		);
		$tens = array(
			0 => "ZERO",
			1 => "TEN",
			2 => "TWENTY",
			3 => "THIRTY",
			4 => "FORTY",
			5 => "FIFTY",
			6 => "SIXTY",
			7 => "SEVENTY",
			8 => "EIGHTY",
			9 => "NINETY"
		);
		$hundreds = array(
			"HUNDRED",
			"THOUSAND",
			"MILLION",
			"BILLION",
			"TRILLION",
			"QUARDRILLION"
		); /*limit t quadrillion */
		$num = number_format($num, 2, ".", ",");
		$num_arr = explode(".", $num);
		$wholenum = $num_arr[0];
		$decnum = $num_arr[1];
		$whole_arr = array_reverse(explode(",", $wholenum));
		krsort($whole_arr, 1);
		$rettxt = "";
		foreach ($whole_arr as $key => $i) {

			while (substr($i, 0, 1) == "0")
				$i = substr($i, 1, 5);
			if ($i < 20) {
				/* echo "getting:".$i; */
				$rettxt .= $ones[$i];
			} elseif ($i < 100) {
				if (substr($i, 0, 1) != "0")  $rettxt .= $tens[substr($i, 0, 1)];
				if (substr($i, 1, 1) != "0") $rettxt .= " " . $ones[substr($i, 1, 1)];
			} else {
				if (substr($i, 0, 1) != "0") $rettxt .= $ones[substr($i, 0, 1)] . " " . $hundreds[0];
				if (substr($i, 1, 1) != "0") $rettxt .= " " . $tens[substr($i, 1, 1)];
				if (substr($i, 2, 1) != "0") $rettxt .= " " . $ones[substr($i, 2, 1)];
			}
			if ($key > 0) {
				$rettxt .= " " . $hundreds[$key] . " ";
			}
		}
		if ($decnum > 0) {
			$rettxt .= " and ";
			if ($decnum < 20) {
				$rettxt .= $ones[$decnum];
			} elseif ($decnum < 100) {
				$rettxt .= $tens[substr($decnum, 0, 1)];
				$rettxt .= " " . $ones[substr($decnum, 1, 1)];
			}
		}
		return $rettxt;
	}


	public function test() //actual pdf editing setup - By inputting pdf template using Fpdi lib.

	{
		//get customer deetails 
		$customer_details['name'] = $this->input->post('name', true);
		$customer_details['address'] = $this->input->post('address', true);
		$customer_details['place'] = $this->input->post('place', true);
		$customer_details['pincode'] = $this->input->post('pincode', true);
		$customer_details['phone'] = $this->input->post('phone', true);
	

		//get invoice details
		$invoice_details['invoice_no'] = $this->input->post('invoice_no', true);
		$invoice_details['invoice_date'] = $this->input->post('invoiceDate', true);


		$orgDate = $invoice_details['invoice_date'];
		$newDate = date("d-m-Y", strtotime($orgDate));


		$invoice_details['invoice_time'] = $this->input->post('invoiceTime', true);


		$a = $this->input->post('total_amount', true);  //Bill amount
		$invoice_details['total_amount'] = round($a); //Rounded amount - actual bill

		
		$fractionalPart = fmod($a, 1); // Fetch fractional part of float number
		$invoice_details['round_off_amt'] = number_format((float)$fractionalPart, 2, '.', '');
					

		$invoice_details['total_gst']   =  $this->input->post('totalGst', true);  // Total Gst 
		$invoice_details['total'] = $this->input->post('total', true); // total amount without decrease discount with tax
		$invoice_details['doctor'] = $this->input->post('doctor_name', true);
		$invoice_details['totalDiscount'] = $this->input->post('totalDiscount', true); //Discount total
		$invoice_details['taxableAmount'] = $this->input->post('taxableAmount1', true); //Total taxable amount

	

		$TotalGstAmount = $this->input->post('totalGst', true); // Float type 
		$SGST  = $TotalGstAmount / 2;
		$CGST = $SGST;
		//$TotalCessAmount = $this->input->post('totalCess', true);




		//get product details
		$pdt_no = $this->input->post('pdt_no', true);  //array
		$product_name = $this->input->post('pdt_name', true); //array

		$hsn = $this->input->post('hsn', true); //array
		$mfr = $this->input->post('mfr', true); //array

		$price = $this->input->post('price', true); //array
		$qty = $this->input->post('qty', true); //array
		$gst = $this->input->post('gst', true); //array
		$amount = $this->input->post('amount', true); //array
		$discount = $this->input->post('discount', true); //array
		$batchNo = $this->input->post('batchNo', true); //array
		$expiry = $this->input->post('expiry', true); //array
		$pureAmount = $this->input->post('pureAmount', true); //array


		//save customer information to customer_detail table
		$customerId = $this->Billing_model->insertcustomer($customer_details);

		if (!empty($customerId)) {

			$invoice_details['customer_id']  = $customerId;
			$isInserted = $this->Billing_model->insertInvoiceDetails($invoice_details);  //Insert to invoice_billing table

			if ($isInserted) {

				//Insert product detils to invoice_billing_product table

				$arraycount =  count($pdt_no);

				if ($pdt_no[0] != null) {
					$pdt_array = array();
					for ($i = 0; $i < $arraycount; $i++) {

						$pdt_array[] = array(
							'hsn' => $hsn[$i],
							'mfr' => $mfr[$i],
							'invoice_no' => $invoice_details['invoice_no'],
							'product_id' => $pdt_no[$i],
							'qty' => $qty[$i],
							'price' => $price[$i],
							'amount' => $amount[$i],
							'gst' => $gst[$i],   //chaged to cess+gst
							'discount' => $discount[$i],
							'pureAmount' => $pureAmount[$i],
							'batch_no' => $batchNo[$i],
							'expiry' => $expiry[$i]
						);
					}
					$isPdtInserted = $this->Billing_model->insertINvoicePDt($pdt_array);


					if ($isPdtInserted) {
						//echo "invoice created successfully";
					} else {
						echo "cant create invoice";
					}
				}
			}
		}



		//Array prepration for pdf table data generation 
		$arraycount =  count($pdt_no);

		if ($pdt_no[0] != null) {
			$pdt_array = array();
			for ($i = 0; $i < $arraycount; $i++) {

				$pdt_array[] = array(

					'hsn' => $hsn[$i],
					'mfr' => $mfr[$i],
					'product_id' => $pdt_no[$i],
					'product_name' => $product_name[$i],
					'batch_no' => $batchNo[$i],
					'expiry' => $expiry[$i],
					'qty' => $qty[$i],
					'price' => $price[$i],
					'amount' => $amount[$i],
					'discount' => $discount[$i],
					'pureAmount' => $pureAmount[$i],
					'gst' => $gst[$i]

				);
			}
		}



		// initiate FPDI
		$pdf = new Fpdi('L', 'mm', 'A5'); //(Orientation  , Measuement unit , Papersize)
		// add a page
		$pdf->AddPage();
		// set the source file
		$pdf->setSourceFile(FCPATH . 'anymedion_invoice.pdf');
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

		//Dealer NO
		$pdf->SetXY(40, 31);
		$pdf->Write(0, 'DL5040');

		// GST NO
		$pdf->SetXY(40, 34.3);
		$pdf->Write(0, 'ANYMED09898734IN');

		// FASSAI NO
		$pdf->SetXY(40, 37.5);
		$pdf->Write(0, 'FASSAI98789');



		//Print invoice number 
		$pdf->SetFont('Arial', '', 7);
		$pdf->SetXY(102, 25.3);
		$pdf->Write(0, $invoice_details['invoice_no']);
		$pdf->SetXY(102, 29.4);
		$pdf->Write(0, $newDate);
		$pdf->SetXY(102, 32.6);
		$pdf->Write(0, $invoice_details['invoice_time']);

		//Patient name
		$pdf->SetXY(149, 10.1);
		$pdf->Write(0, $customer_details['name']);

		//Contact no of pateint
		$pdf->SetXY(149, 14);
		$pdf->Write(0, $customer_details['phone']);

		// Doctor Name
		$pdf->SetXY(149, 20.9);
		$pdf->Write(0, $invoice_details['doctor']);


		// Patient address
		$pdf->SetXY(137, 28);
		$pdf->Write(0, $customer_details['address']);
		$pdf->SetXY(137, 32);
		$pdf->Write(0, $customer_details['place']);
		$pdf->SetXY(137, 36);
		$pdf->Write(0, $customer_details['pincode']);


		$x = 5.8;
		$y = 50;
		$slNO = 1;
		// For product details 
		// $pdf->ln(15);
		foreach ($pdt_array as $ds) {
			//Cell(width , height , text , border , end line , [align] )
			$pdf->SetFont('Arial', '', 7);
			$pdf->SetXY($x, $y);
			$pdf->Cell(7, 5, $slNO, 0, 0, 'C');
			$pdf->Cell(11.6, 5, $ds['hsn'], 0, 0, 'C');
			$pdf->Cell(11.5, 5, $ds['mfr'], 0, 0, 'C');
			$pdf->Cell(48, 5, $ds['product_name'], 0, 0);
			$pdf->Cell(18.4, 5, $ds['batch_no'], 0, 0, 'C');
			$pdf->SetFont('Arial', '', 7);
			$pdf->Cell(20, 5, $ds['expiry'], 0, 0, 'C');
			$pdf->SetFont('Arial', '', 7);
			$pdf->Cell(9.9, 5, $ds['qty'], 0, 0, 'C');
			$pdf->Cell(13, 5, $ds['price'], 0, 0, 'C');
			$pdf->Cell(19.4, 5, $ds['pureAmount'], 0, 0, 'C');
			$pdf->Cell(10, 5, $ds['discount'], 0, 0, 'C');
			$pdf->Cell(10.6, 5, $ds['gst'], 0, 0, 'C');
			$pdf->Cell(20, 5, $ds['amount'], 0, 0, 'C');
			$y = $y + 6;
			$slNO = $slNO + 1;
		}


		// Total amount
		$pdf->SetXY(102, 114.8);
		$pdf->Write(0, $invoice_details['taxableAmount']);  // Total Amount to be used for calculating tax

		// Total CGST
		$pdf->SetXY(102, 118.4);
		$pdf->Write(0, $CGST);  // Total CGST

		// Total SGST
		$pdf->SetXY(102, 121.7);
		$pdf->Write(0, $SGST);  // Total SGST

		// You Saved Rs 
		// Is  Total amount - Billing amount 
		$totalamount =  $invoice_details['total']; // Bill amount
		$mainBill   = $invoice_details['total_amount'];  //amount wihtout discount with tax calculated
		$yousaved = $totalamount - $mainBill; 
		$pdf->SetXY(102, 131.8);
		$pdf->Write(0,  $yousaved);   // Sum of all Discounts






		// Total amount 
		$pdf->SetXY(167, 106.7);
		$pdf->Write(0,  $invoice_details['total']); //Total Amount without discount with tax

		//Discount
		$pdf->SetXY(167, 110.2);
		$pdf->Write(0, $invoice_details['totalDiscount']); // Total discount


		//Round off amount
		$pdf->SetXY(167, 113.5);
		$pdf->Write(0, $invoice_details['round_off_amt']); 


		//Bill Amount
		$pdf->SetXY(167, 117.5);
		$pdf->Write(0, 'Rs  ' . $invoice_details['total_amount']);  // Main billing amount - customer to pay








		//convert Float to int 
		$billamtINt = intval($invoice_details['total_amount']);

		$word = $this->numberTowords($billamtINt);

		$pdf->SetXY(20, 106.5);
		$pdf->Write(0, $word);  // Rupees in words


		$pdf->Output('I', 'generated.pdf');

		//return redirect('Billing/CreateInvoice');
		//$this->CreateInvoice();
	}

	public function allBilling()
	{
		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'all_billing', $this->data);
	}

	public function InvoiceLIst()
	{
		$postData = $this->input->post();
		$offset = (!empty($postData['start']) && is_numeric($postData['start'])) ? $postData['start'] : 0;

		// $where1 = array();
		// if (isset($postData['search'])) {
		// 	if ($postData['search'] != '') {
		// 		$where1 = "(products.name LIKE '%" . $postData['search']['value'] . "%')";
		// 	}
		// }

		$professionals_data = $this->Billing_model->getInvoice($postData['length'], $offset);
		$total = $this->Billing_model->totalCount();
		$list = [];

		foreach ($professionals_data as $value) {
			$val = [];
			$offset++;
			$val[] = $offset;
			$val[] = $value['invoice_no'];
			$val[] = $value['name'];
			$val[] = $value['phone'];
			$val[] = $value['total_amount'];
			$val[] = $value['invoice_date'];
			$val[] = $value['id']; //invoice_billing.id 

			$list[] = $val;
		}

		$data['list'] = $list;
		$data['total_rows'] = $total;
		echo json_encode($data);
	}

	public function InvDetailView($id) //invoice_billing column - id (not invoice number) 
	{

		//Fetch inovie details using id
		$data = $this->Billing_model->getInvoiceDetails($id);

		$data1 = $this->Billing_model->getProductDetails($data[0]['invoice_no']);  //get products details according to imvoce no

		//Data format conversion
		$orgDate = $data[0]['invoice_date'];
		$newDate = date("d-m-Y", strtotime($orgDate));


		// initiate FPDI
		$pdf = new Fpdi('L', 'mm', 'A5'); //(Orientation  , Measuement unit , Papersize)
		// add a page
		$pdf->AddPage();
		// set the source file
		$pdf->setSourceFile(FCPATH . 'anymedion_invoice.pdf');
		// import page 1
		$tplIdx = $pdf->importPage(1);
		// use the imported page and place it at position 10,10 with a width of 100 mm(ignored commevt)
		$pdf->useTemplate($tplIdx); //Directly use template 


		//Margin eliminating 
		$pdf->SetMargins(0, 0, 0);
		$pdf->SetAutoPageBreak(false, 0);


		// now write some text above the imported page

		//Print Delivery NO , GSt IN , Fassai no
		$pdf->SetFont('Arial', '', 6);

		//Dealer NO
		$pdf->SetXY(40, 31);
		$pdf->Write(0, 'DL5040');

		// GST NO
		$pdf->SetXY(40, 34.5);
		$pdf->Write(0, 'ANYMED09898734IN');

		// FASSAI NO
		$pdf->SetXY(40, 37.5);
		$pdf->Write(0, 'FASSAI98789');


		//Print invoice number 
		$pdf->SetFont('Arial', '', 7);
		$pdf->SetXY(102, 25.3);
		$pdf->Write(0, $data[0]['invoice_no']);
		$pdf->SetXY(102, 29.4);
		$pdf->Write(0, $newDate);
		$pdf->SetXY(102, 32.6);
		$pdf->Write(0, $data[0]['invoice_time']);


		$pdf->SetFont('Arial', '', 7);
		//Patient name
		$pdf->SetXY(149, 10.1);
		$pdf->Write(0, $data[0]['name']);

		//Contact no of pateint
		$pdf->SetXY(149, 14);
		$pdf->Write(0, $data[0]['phone']);

		// Doctor Name
		$pdf->SetXY(149, 20.9);
		$pdf->Write(0, $data[0]['doctor']);


		// Patient address
		$pdf->SetXY(137, 28);
		$pdf->Write(0, $data[0]['address']);
		$pdf->SetXY(137, 32);
		$pdf->Write(0, $data[0]['place']);
		$pdf->SetXY(137, 36);
		$pdf->Write(0, $data[0]['pincode']);


		$x = 5.8;
		$y = 50;
		$slNO = 1;
		// For product details 
		// $pdf->ln(15);
		foreach ($data1 as $ds) {
			//Cell(width , height , text , border , end line , [align] )
			$pdf->SetFont('Arial', '', 7);
			$pdf->SetXY($x, $y);
			$pdf->Cell(7, 5, $slNO, 0, 0, 'C');
			$pdf->Cell(11.6, 5, $ds['hsn'], 0, 0, 'C');
			$pdf->Cell(11.5, 5, $ds['mfr'], 0, 0, 'C');
			$pdf->Cell(48, 5, $ds['product_name'], 0, 0);
			$pdf->Cell(18.4, 5, $ds['batch_no'], 0, 0, 'C');
			$pdf->SetFont('Arial', '', 7);
			$pdf->Cell(20, 5, $ds['expiry'], 0, 0, 'C');
			$pdf->SetFont('Arial', '', 7);
			$pdf->Cell(9.9, 5, $ds['qty'], 0, 0, 'C');
			$pdf->Cell(13, 5, $ds['price'], 0, 0, 'C');
			$pdf->Cell(19.4, 5, $ds['pureAmount'], 0, 0, 'C');
			$pdf->Cell(10, 5, $ds['discount'], 0, 0, 'C');
			$pdf->Cell(10.6, 5, $ds['gst'], 0, 0, 'C');
			$pdf->Cell(20, 5, $ds['amount'], 0, 0, 'C');
			$y = $y + 6;
			$slNO = $slNO + 1;
		}



		// Total amount
		$pdf->SetXY(102, 114.8);
		$pdf->Write(0, $data[0]['taxableAmount']);  // Total Amount to be used for calculating tax

		// Obtain cgst and sgst from total gst
		$total_gst =	$data[0]['total_gst'];
		$cgst = $total_gst / 2;
		$sgst = $cgst;

		// Total CGST
		$pdf->SetXY(102, 118.4);
		$pdf->Write(0, $cgst);  // Total CGST

		// Total SGST
		$pdf->SetXY(102, 121.7);
		$pdf->Write(0, $sgst);  // Total SGST
	

		// You Saved Rs
		// It Is  Total amount - Billing amount 
		$totalamount =  $data[0]['total'];
		$mainBill   = $data[0]['total_amount'];
		$yousaved = $totalamount - $mainBill;
		$pdf->SetXY(102, 131.8);
		$pdf->Write(0,  $yousaved);




		// Total amount
		$pdf->SetXY(163, 107);
		$pdf->Write(0, $data[0]['total']);

		//Discount
		$pdf->SetXY(163, 111);
		$pdf->Write(0, $data[0]['totalDiscount']);

		//Bill Amount
		$pdf->SetXY(163, 116);
		$pdf->Write(0, 'Rs  ' . $data[0]['total_amount']);



		//convert Float to int 
		$billamtINt = intval($data[0]['total_amount']);
		$word = $this->numberTowords($billamtINt);


		$pdf->SetXY(20, 106.5);
		$pdf->Write(0, $word);


		$pdf->Output('I', 'generated.pdf');
	}

	public function addTax()
	{
		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'addTax', $this->data);
	}

	public function createTax() //Inserting Tax into table
	{
		$this->form_validation->set_rules('description', 'description', 'required');
		$this->form_validation->set_rules('tax', 'tax', 'required');
		//$this->form_validation->set_rules('cess', 'cess', 'required');

		if ($this->form_validation->run()) {
			$data['description'] = $this->input->post('description', true);
			$data['tax'] = $this->input->post('tax', true);
			//$data['cess'] = $this->input->post('cess', true);

			$isInserted = $this->Billing_model->createTax($data);

			if (!empty($isInserted)) {
				$this->session->set_flashdata('msg', 'Tax saved Sucessfully');
			} else {
				$this->session->set_flashdata('msg', 'Falied to save Tax');
			}
		}
	}

	public function addPackingInfo()
	{
		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'addPacking_info', $this->data);
	}

	public function createPackingInfo()
	{
		$this->form_validation->set_rules('description', 'description', 'required');
		$this->form_validation->set_rules('number', 'tax', 'required');


		if ($this->form_validation->run()) {
			$data['description'] = $this->input->post('description', true);
			$data['number'] = $this->input->post('number', true);


			$isInserted = $this->Billing_model->createPackingInfo($data);

			if (!empty($isInserted)) {
				$this->session->set_flashdata('msg', 'Packing_info saved Sucessfully');
			} else {
				$this->session->set_flashdata('msg', 'Falied to save Packing_info');
			}
			$this->addPackingInfo();
		}
	}


	public function addPacking()
	{
		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'addPacking', $this->data);
	}

	public function createPacking()
	{
			$this->form_validation->set_rules('name', 'Name', 'required');


		if ($this->form_validation->run()) {
			
			$data['name'] = $this->input->post('name', true);


			$isInserted = $this->Billing_model->createPacking($data);

			if (!empty($isInserted)) {
				$this->session->set_flashdata('msg', 'Packing saved Sucessfully');
			} else {
				$this->session->set_flashdata('msg', 'Falied to save Packing');
			}
			$this->addPacking();
		}
	}


	// BILLING FOR FINGENT


	public function create_invoice()
	{

		$this->_render_admin('billing' . DIRECTORY_SEPARATOR . 'addPacking', $this->data);	

	}

	






}
