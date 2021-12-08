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
                    <form target="_blank" action="<?php echo base_url('Billing/create_bill/') ?>" method="POST">
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
                                        <tbody>
                                            <tr id="row_0">
                                                <td><input type="text" required name="name[]" id="name_0" placeholder="Name" class="form-control fieldClear clearFields" /></td>
                                                <td><input type="text" required name="price[]" id="price_0" placeholder="price" class="form-control fieldClear clearFields" /></td>
                                                <td>
                                                    <select id='tax_0' required name="tax[]" class="form-control fieldClear clearFields">
                                                        <option value=''>Select Tax</option>
                                                        <option value='0'>0%</option>
                                                        <option value='1'>1%</option>
                                                        <option value='5'>5%</option>
                                                        <option value='10'>10%</option>
                                                    </select>
                                                </td>
                                                <td> <input type="text" required id="qty_0" class="form-control  clearFields qty" name="qty[]" placeholder="Price"></td>
                                                <td><input type="text" id="total_0" name="total[]" placeholder="Total" class="form-control fieldClear clearFields" /></td>
                                                <td><button type="button" name="add" id="addmore" class="ms-btn-icon-outline btn-danger">Add</button></td>
                                            </tr>
                                        </tbody>

                                    </table>
                                    <hr>
                                </div>
                                <!-- <input type="submit" class="btn-sm btn-" name="submit" id="submit" value="Submit"> -->
                            </div>
                        </div>
                        <!-- Section for product select ends here -->
                        <!-- Section for Total text box and create clear button -->
                        <div class="form-row">
                            <div class="col-2">

                            </div>
                            <div class="col-4  ">

                            </div>
                            <div class="col-4 ">

                            </div>
                            <div class="col-2  ">

                                <div class="input-group">
                                    <!--  -->
                                    <label style="padding-top: 8px;padding-right: 22px;"> Total </label>
                                    <input type="text" class="form-control clearCustom" id="final_total" name="total_amount"> 
                                </div>

                            </div>
                            <div class=" col-12 float-right">

                                <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Create</button>
                                <button class=" btn btn-warning btn-sm" id="clear" onclick="refreshPage()" style=" float: right; ">Clear</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        let subtotal = 0;
        $(".qty").keyup(function() {
            $("input[name='price[]']").each(function(index) {
                var qty = $("input[name='qty[]']").eq(index).val();
                var tax = $("select[name='tax[]']").eq(index).val();
               id = $(this).attr('id');
                idArr = id.split("_");
                rowNo = idArr[idArr.length - 1];
                var price = $("input[name='price[]']").eq(index).val();
                var output1 = parseInt(qty) * parseInt(price);
                var calculatedTax = (output1 * parseInt(tax)) / 100;
                var toatalamt = calculatedTax + output1;
                $("input[name='total[]']").eq(index).val(toatalamt);
                subtotal = parseInt(subtotal) + parseInt(toatalamt);
                $('#final_total').val(subtotal);
            });

        });
        var addBttn, rowcount, tableBody, submitBttn, closeBttn;
        addBttn = $("#addmore");
         rowcount = $("#autocomplete_table tbody tr").length;
        tableBody = $("#autocomplete_table tbody");
        function formHtml() {
            html = '<tr id="row_' + rowcount + '">';
            html += '<td>';
            html += '<div class="back_search">';
            html += '<div class="right-icon-control">';
            html += '<input type="text" required  id="name_' + rowcount + '" class="form-control autocomplete_txt" placeholder="Name" data-field-name="name" name="name[]">';
            html += '<div class="form-icon" style="margin-right: -18px;">';
            html += ' <a href="#" data-toggle="modal" data-target="#kt_datatable_modal_2" data-mat-id="delete_' + rowcount + '" style="float: right   ;">';
            html += '</i>';
            html += '</a>';
            html += '</td>';
            html += '<td>';
            html += '<input id="price_' + rowcount + '" required class="form-control autocomplete_txt" placeholder="Price" data-field-name="price" name="price[]"  >';
            html += '</td>';
            html += '<td>';
            html += ' <select id=""  id="tax_' + rowcount + '" required name="tax[]" class="form-control fieldClear clearFields"><option value="">Select Tax</option><option value="0">0%</option><option value="1">1%</option><option value="5">5%</option><option value="10">10 </option> </select>';
            html += '</td>';
            html += '<td>';
            html += '<input type="text"  id="qty_' + rowcount + '" required  class="form-control autocomplete_txt qty " placeholder="Qty" data-field-name="name" name="qty[]" >';
            html += '</td>';
            html += '<td>';
            html += '<input type="text"  id="total_' + rowcount + '"  class="form-control price" placeholder="Total"  name="total[]" >';
            html += '</td>';
            rowcount++;
            $(document).ready(function() {
                $(".qty").keyup(function() {
                    let output1;
                    var toatalamt = 0;
                    $("input[name='price[]']").each(function(index) {
                        var tax = $("select[name='tax[]']").eq(index).val();
                        var qty = $("input[name='qty[]']").eq(index).val();
                        id = $(this).attr('id');
                        idArr = id.split("_");
                        rowNo = idArr[idArr.length - 1];
                        var price = $("input[name='price[]']").eq(index).val();
                        var output1 = parseInt(qty) * parseInt(price);
                        var calculatedTax = (output1 * parseInt(tax)) / 100;
                        toatalamt = calculatedTax + output1;
                        $("input[name='total[]']").eq(index).val(toatalamt);
                    });
                    var subtotal2 = parseInt(subtotal) + parseInt(toatalamt);
                    $('#final_total').val(subtotal2);
                });
            });
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
<script>
       function refreshPage() {
        location.reload();
    }
</script> -->
