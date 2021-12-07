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
        $this->table_name = "permissions";
    }

    public function getPdt_price($pdtID)
    {
        $this->db->where('id', $pdtID);
        return $this->db->get('products')->result_array();
    }

    public function getInvoiceNo()
    {
        return $this->db->order_by('invoice_no', "desc")
            ->limit(1)
            ->get('invoice_billing')
            ->row();
    }

    public function CreateInvoice($data)
    {
        return $this->db->insert('invoice_billing', $data);
    }

    public function insertcustomer($customer_details)
    {
        $this->db->insert('customer_details', $customer_details);
        $insertId = $this->db->insert_id();
        return  $insertId;
    }

    public function insertInvoiceDetails($invoice_details)
    {
        return $this->db->insert('invoice_billing', $invoice_details);
    }

    public function insertINvoicePDt($pdt_array)
    {
        return $this->db->insert_batch('invoice_billing_products', $pdt_array);
    }

    public function getInvoice($limit = 10, $offset = 0)
    {
        $data = array();

        $this->db->select('invoice_billing.invoice_no,invoice_billing.invoice_date,invoice_billing.total_amount,

        invoice_billing.id,customer_details.name,customer_details.phone');

        $this->db->limit($limit, $offset);
        //join
        $this->db->join('customer_details', 'customer_details.id = invoice_billing.customer_id', 'inner');


        $q = $this->db->get_where('invoice_billing');

        if ($q->num_rows() > 0) {
            foreach ($q->result_array() as $row) {
                $data[] = $row;
            }
        }
        return $data;
    }

    public function totalCount()
    {
        $this->db->select('invoice_billing.invoice_no,invoice_billing.invoice_date,invoice_billing.total_amount,

        invoice_billing.id,customer_details.name,customer_details.phone');


        //join
        $this->db->join('customer_details', 'customer_details.id = invoice_billing.customer_id', 'inner');

        $q = $this->db->get_where('invoice_billing');
        return $q->num_rows();
    }


    public function getInvoiceDetails($id)
    {
        $this->db->select('
        customer_details.name,
        customer_details.phone,
        customer_details.place,
        customer_details.address,
        customer_details.pincode,
      
        
        
        invoice_billing.invoice_no,
        invoice_billing.invoice_date,
        invoice_billing.invoice_time,
        invoice_billing.doctor,
        invoice_billing.taxableAmount,
        invoice_billing.total_gst,
        invoice_billing.total_cess,
        invoice_billing.totalDiscount,
        invoice_billing.total,
        invoice_billing.total_amount');


        $this->db->join('customer_details', 'customer_details.id = invoice_billing.customer_id', 'inner');


        $this->db->where('invoice_billing.id', $id);
        return $this->db->get('invoice_billing')->result_array();
    }


    public function getProductDetails($invoice_no)
    {
        $this->db->select('   
    products.name as product_name,
    invoice_billing_products.invoice_no,
    invoice_billing_products.hsn,
    invoice_billing_products.mfr,
    invoice_billing_products.qty,
    invoice_billing_products.price,
    invoice_billing_products.gst,
    invoice_billing_products.discount,
    invoice_billing_products.batch_no,
    invoice_billing_products.amount,
    invoice_billing_products.pureAmount,
    invoice_billing_products.expiry');

        $this->db->join('products', 'products.id = invoice_billing_products.product_id', 'inner');

        $this->db->where('invoice_billing_products.invoice_no', $invoice_no);
        return $this->db->get('invoice_billing_products')->result_array();
    }

    public function createTax($data)
    {
        return $this->db->insert('tax', $data);
    }

    public function createPackingInfo($data)
    {
        return $this->db->insert('packing_info', $data);
    }


    public function createPacking($data)
    {
        return $this->db->insert('packing', $data);
    }


}
