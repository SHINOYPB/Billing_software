<!-- body-wrapper -->
<div class="ms-content-wrapper">
    <div class="row">
        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pl-0">
                    <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Billing Manamgent</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Billing</li>
                </ol>
            </nav>
        </div>
        <div class="col-xl-12 col-md-12">
            <div class="ms-panel ms-panel-fh">
                <div class="ms-panel-header">
                    <h6>Create Invoice</h6>
                </div>
                <div class="ms-panel-body">


                    <form target="_blank" action="<?php echo base_url('Billing/test/') ?>" method="POST">


                        <!-- Section for Product select  -->

                        <div class="form-row">
                            <div class="col-12">

                                <div class="table-responsive">
                                    <table class="table table-borderless w-auto" id="autocomplete_table" style="border: none;">
                                        <thead>
                                            <tr>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Tax</th>
                                                <th scope="col">Qty</th>
                                                <th scope="col">Total</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tr>


                                            <td><input type="text" id="name" placeholder="Name" class="form-control fieldClear clearFields" /></td>
                                            <td><input type="text" id="price" placeholder="price" class="form-control fieldClear clearFields" /></td>
                                            <td>
                                                <select id='sel_gender' class="form-control fieldClear clearFields">
                                                    <option value=''>Select Tax</option>
                                                    <option value='0'>0%</option>
                                                    <option value='1'>1%</option>
                                                    <option value='5'>5%</option>
                                                    <option value='10'>10%</option>
                                                </select>
                                            </td>
                                            <td> <input type="text" id="qty" class="form-control  clearFields" name="qty" placeholder="Price"></td>

                                            <td><input type="text" id="total" placeholder="Total" class="form-control fieldClear clearFields" /></td>
                                            <td><button type="button" name="add" id="addmore" class="ms-btn-icon-outline btn-danger">Add</button></td>


                                            <input type="hidden" id="gstAmt" class="form-control fieldClear clearFields" />


                                        </tr>

                                    </table>
                                    <hr>
                                </div>
                                <!-- <input type="submit" class="btn-sm btn-" name="submit" id="submit" value="Submit"> -->
                            </div>

                            <!-- <div class="col-md-12 " style="margin-top: 31px;">

                                <div id="billing_table">


                                    <table id="INVOICETABLE" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">HSN</th>
                                                <th scope="col">MFR</th>
                                                <th scope="col">PRODUCT NAME</th>
                                                <th scope="col">BATCH.NO</th>
                                                <th scope="col">EXPIRYDATE</th>
                                                <th scope="col">QTY</th>
                                                <th scope="col">MRP</th>
                                                <th scope="col">TAX %</th>
                                                <th scope="col">DISCOUNT</th>
                                                <th scope="col">NET</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="ivoicetable1">

                                        </tbody>
                                    </table>

                                </div>


                            </div> -->

                        </div>

                        <!-- Section for product select ends here -->





                        <!-- Section for Total text box and create clear button -->

                        <div class="form-row">
                            <div class="col-6  ">
                            </div>
                            <div class="col-4 ">
                                <div class="input-group">

                                    <label for="total">Subtotal With Tax</label>
                                    <input type="text" class="form-control clearCustom" id="total" name="total_amount"> <!-- Billing Amount -->


                                </div>
                            </div>
                            <div class="col-2  ">

                                <div class="input-group">

                                    <label style="padding-top: 8px;padding-right: 22px;">Total</label>
                                    <input type="text" class="form-control clearCustom" id="total" name="total_amount"> <!-- Billing Amount -->

                                    <input type="hidden" class="form-control clearCustom" id="totalAmt" name="total"> <!-- Total Amount [without discount] with tax -->
                                    <input type="hidden" class="form-control clearCustom" id="totalDiscount" name="totalDiscount"> <!-- Total Discount  -->
                                    <input type="hidden" id="TotalGSt" name="totalGst" class="form-control fieldClear clearCustom" /> <!-- Total Gst   -->
                                    <input type="hidden" id="TotalAmount" class="form-control  clearCustom" /> <!-- Total Amount of single product -->
                                    <input type="hidden" class="form-control clearCustom" id="taxableAmount1" name="taxableAmount1"> <!-- Taxable Amount of single product  -->


                                </div>

                            </div>
                            <div class=" col-12 float-right">

                                <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Create</button>
                                <button class=" btn btn-warning btn-sm" id="clear" onclick="refreshPage()" style=" float: right; ">Clear</button>

                            </div>

                        </div>

                        <!-- Section ends here - Total text box and create clear button -->




                    </form>



                </div>
            </div>
        </div>
    </div>
</div>

<!-- Usless in this context -->
<script type="text/javascript">
    $('#sel_gender').on('change', function() { // Clear assigned table contents with clear button click

        alert('hai');
    });

    $('#qty').on('change', function() // Clear assigned table contents with clear button click
        {
            tax = $("#sel_gender").val();
            price = $("#price").val();
            qty = $("#qty").val();
            amount = price * qty;
            $('#total').val(amount);
            //alert(amount);
        });
</script>



<script type="text/javascript">
    $(document).ready(function() {

        var addBttn, rowcount, tableBody, submitBttn, closeBttn;

        addBttn = $("#addmore");
        submitBttn = $("#submit");
        closeBttn = $("#close");
        rowcount = $("#autocomplete_table tbody tr").length;
        tableBody = $("#autocomplete_table tbody");


        function formHtml() {

            html = '<tr id="row_' + rowcount + '">';

            // html += '<td  scope="row" class="delete_row" id="delete_' + rowcount + '">';
            // html += '<i class="fa fa-minus-circle" style="font-size: x-large;">';
            // html += '</i>';
            // html += '</td>';


            html += '<td>';
            html += '<div class="back_search">';
            html += '<div class="right-icon-control">';
            html += '<input type="text" class="form-control autocomplete_txt" placeholder="Name" data-field-name="material_code" name="materialcode" id="materialcode_' + rowcount + '">';
            html += '<div class="form-icon" style="margin-right: -18px;">';
            html += ' <a href="#" data-toggle="modal" data-target="#kt_datatable_modal_2" data-mat-id="delete_' + rowcount + '" style="float: right   ;">';
            html += '</i>';
            html += '</a>';
            html += '</td>';


            html += '<td>';
            html += '<input type="text" class="form-control autocomplete_txt" placeholder="Qty" data-field-name="name" name="materialname" id="materialname_' + rowcount + '">';
            html += '</td>';


            html += '<td>';
            html += '<input class="form-control autocomplete_txt" placeholder="Price" data-field-name="category" name="category"  id="category_' + rowcount + '">';
            html += '</td>';


            html += '<td>';
            html += ' <select id="sel_gender" class="form-control fieldClear clearFields"><option value="">Select Tax</option><option value="0">0%</option><option value="1">1%</option><option value="5">5%</option><option value="10">10 </option> </select>';
            html += '</td>';


            html += '<td>';
            html += '<input type="text" class="form-control price" placeholder="Total"  name="price" id="price_' + rowcount + '">';
            html += '</td>';


            // html += '<td>';
            // html += '<input type="text" class="form-control measurement"  name="measurement" id="measurement_' + rowcount + '">';
            // html += '</td>';


            // html += '<td>';
            // html += '<input type="text" class="form-control quantity" name="quantity" id="quantity_' + rowcount + '">';
            // html += '</td>';


            // html += '<td>';
            // html += '<input type="text" class="form-control time" name="time" id="time_' + rowcount + '">';
            // html += '</td>';

            rowcount++;

            return html;

        }

        function addNewRow() {
            rowcount = $("#autocomplete_table tbody tr").length;
            var html = formHtml();
            tableBody.append(html);
            console.log(html);
        }


        function registerevents() {
            addBttn.on("click", addNewRow);
            $(document).on('click', '.delete_row', deleteRow);
            $(document).on('focus', '.autocomplete_txt', handleautocomplete);
            submitBttn.on("click", submitForm);
        }
        registerevents();

    });
</script>




<!-- for time range -->
<!-- Wickedpicker for time 12hr formate picking jquery library     -->

<script src="<?php echo base_url('assets/js/wickedpicker.min.js') ?>"></script>

<script>
    $('#invoice_time').wickedpicker();


    function refreshPage() {

        location.reload();

    }
</script>

<!-- for time range end here -->