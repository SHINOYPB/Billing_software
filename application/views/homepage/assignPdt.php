<div class="ms-panel" style="height:inherit;">

    <!--############### FLASH MESSAGE SECTION ####################################################################-->
    <?php if ($msg = $this->session->flashdata('msg')) :   ?>
        <div class="row">
            <div class="col-md-6">
                <div class=" alert alert-dismissible alert-success">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <?php echo $msg; ?>
                </div>
            </div>
        </div>
    <?php endif;  ?>



    <!-- <div class="ms-panel"> -->
    <div class="ms-panel-header">
        <h4 class="text-center">ASSIGN PRODUCT TO SECTION</h4>
    </div>
    <div class="ms-content-wrapper">
        <div class="row" style="height:inherit;">

            <div class="container border ms-panel" style="width: 850px;">


                <div class="col-md-12  " style="margin-top: 36px;   margin-left: 82px;">
                    <!--Product type-->
                    <label style="font-size: 19px;" class="font-weight-bold"> Sections</label>
                    <div class="form-control contspecvalue4 " style="width: 220px;margin-left: 284px;">
                        <select id="sectionload" data-info="34" class="select load" style="width: 100%;" name="sp_val[]">
                            <option value="">Select Section</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-12 selCatDiv " style="margin-top: 36px;   margin-left: 82px;">
                    <!--Product type-->
                    <label style="font-size: 19px;" class="font-weight-bold">Select Category</label>
                    <div class="form-control  " style="width: 220px;margin-left: 248px;">
                        <select id="loadCatagory" class="select" style="width: 100%;" name="sp_val[]">
                            <option value="">Select Category</option>
                        </select>
                    </div>
                </div>


                <div class="col-md-12 hidee " style="margin-top: 36px;   margin-left: 82px;">
                    <!--Product type-->
                    <label style="font-size: 19px;" class="font-weight-bold"> Product Type</label>
                    <div class="form-control  " style="width: 220px;margin-left: 248px;">
                        <select id="loadProductType" class="select" style="width: 100%;" name="sp_val[]">
                            <option value="">Select Type</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-12 hidee " style="margin-top: 36px;   margin-left: 92px;">
                    <!--Product type-->
                    <label style="font-size: 19px;" class="font-weight-bold"> Product </label>
                    <div class="form-control hidee " style="width: 220px;margin-left: 284px;">
                        <select id="produtsSelect" class="select" style="width: 100%;" name="sp_val[]">
                            <option value="">Select Product</option>
                        </select>
                    </div>
                </div>



                <div class="col-md-12 hidee" style="margin-top: 31px;">
                    <!--  New table rendor  -->

                    <div id="myTableDiv2">
                        <form action="<?php echo base_url('Homepage/assgnsection/') ?>" method="POST">
                            <table id="myTable45" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Product Type</th>
                                        <th>Action </th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Assign</button>
                        </form>
                    </div>



                </div>



                <div class="col-md-12 assCate" style="margin-top: 31px;">
                    <!--  New table rendor  -->

                    <div id="myTableDiv2">
                        <form action="<?php echo base_url('Homepage/assCarSection/') ?>" method="POST">
                            <table id="catAssign" class="table table-bordered">
                                <thead>
                                    <tr>
                                        
                                        <th>Category Name</th>
                                        <th>Action </th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Assign</button>
                        </form>
                    </div>



                </div>


            </div>




        </div>
    </div>
    <!-- </div> -->
    <!-- </div> -->


</div>

<!-- SCRIPTS -->
<script type="text/javascript">
    $(document).ready(function() {

    });
</script>

<script type="text/javascript">
    window.onload = function() {

        $('#loadCatagory').select2();
        $('#sectionload').select2();
        $('#loadProductType').select2();
        $('#produtsSelect').select2();
        $('#myTableDiv2').hide();
        $('.assCate').hide();


        $('.hidee').hide();

        $('.selCatDiv').hide();



        ajaxLoad12();
        fetchProductType();
        fetchCategory()

    }

    function fetchCategory() { //load categoris in loadcategory select box
        $.ajax({
            type: 'POST',
            url: surl + 'Category_pdt/ajax_load',

            success: function(data) {
                var ndata = JSON.parse(data);


                if (ndata.return == true) {
                    var myOptions = ndata.a;

                    var mySelect = $('#loadCatagory');

                    myOptions.forEach(function(data) {
                        mySelect.append($('<option></option>').val(data.id).html(data.name));
                    });

                } else if (ndata.return == false) {
                    $('.error').text(ndata.message);
                } else {
                    $('.error').text('something went wrong');
                }

            },
            error: function() {
                $('.error').text('something went wrong');
            }

        });
    }


    function fetchProductType() {
        $.ajax({
            type: 'POST',
            url: surl + 'Category_pdt/fetchProductType',

            success: function(data) {
                var ndata = JSON.parse(data);


                if (ndata.return == true) {
                    var myOptions = ndata.a;

                    var mySelect = $('#loadProductType');

                    myOptions.forEach(function(data) {
                        mySelect.append($('<option></option>').val(data.id).html(data.name));
                    });

                } else if (ndata.return == false) {
                    $('.error').text(ndata.message);
                } else {
                    $('.error').text('something went wrong');
                }

            },
            error: function() {
                $('.error').text('something went wrong');
            }

        });
    }

    function ajaxLoad12() { //section load
        $.ajax({
            type: 'POST',

            url: "<?php echo base_url(); ?>Homepage/ajax_load",

            success: function(data) {
                var ndata = JSON.parse(data);


                if (ndata.return == true) {
                    var myOptions = ndata.a;

                    var mySelect = $('#sectionload');

                    myOptions.forEach(function(data) {
                        mySelect.append($('<option></option>').val(data.id).html(data.name).attr('data-info', data.limits));
                        // $('#sectionload').data('limit',data.limits); 
                    });

                } else if (ndata.return == false) {
                    $('.error').text(ndata.message);
                } else {
                    $('.error').text('something went wrong');
                }

            },
            error: function() {
                $('.error').text('something went wrong');
            }

        });
    }

    $('#sectionload').on('change', function() {

        var sectionName = $("#sectionload").children("option:selected").html();
        if (sectionName == 'Popular Categories') {

            alert('got polupar categories');

            $('.hidee').hide();

            $('.selCatDiv').show();
        } else {
            $('.selCatDiv').hide();
            $('.assCate').hide();
            $('.hidee').show();


        }

    });

    $('#loadCatagory').on('change', function() {
        $('.assCate').show();
       // var product_id = $("#produtsSelect").val(); //pdt id
        var categoryId = $("#loadCatagory").val(); //category id
        var sectionID = $("#sectionload").val(); //section id

        var category_name = $("#loadCatagory").children("option:selected").html();
       // var product_name = $("#produtsSelect").children("option:selected").html();

        $('#catAssign tbody').append('<tr>');
        // $('#myTable45 tbody').append('<td class="' + product_id + '">' + product_name + '</td>');
        $('#catAssign tbody').append('<td class="' + categoryId + '">' + category_name + '</td>');
        $('#catAssign tbody').append('<td class="' + categoryId + '"><a class="btn-xs btn-danger  remove5" href="#" style="border-radius:5px;" data-id="' + categoryId + '" >Remove</a></td>');
        $('#catAssign tbody').append('<input type="hidden" class="' + categoryId + '" value="' + sectionID + '" name="sectionID">');
        $('#catAssign tbody').append('<input type="hidden" class="' + categoryId + '" value="' + categoryId + '" name="catId[]">');
        // $('#myTable45 tbody').append('<input type="hidden" class="' + categoryId + '" value="' + pdt_type_id + '" name="pdt_type_id">');
    });

    $('#loadProductType').on('change', function() {

        $('#produtsSelect').empty();
        //SECTION TWO SELECT BOX LOAD
        var prodTypeId = $('#loadProductType').find(":selected").val();

        $.ajax({
            type: 'POST',
            url: surl + 'Category_pdt/fetchProduct',
            data: {

                id: prodTypeId
            },
            success: function(data) {
                var ndata = JSON.parse(data);


                if (ndata.return == true) {
                    var myOptions = ndata.a;

                    var mySelect = $('#produtsSelect');
                    mySelect.append($('<option></option>').val('').html('Select Product'));
                    myOptions.forEach(function(data) {
                        mySelect.append($('<option></option>').val(data.id).html(data.name));
                    });

                } else if (ndata.return == false) {
                    $('.error').text(ndata.message);
                } else {
                    $('.error').text('something went wrong');
                }

            },
            error: function() {
                $('.error').text('something went wrong');
            }

        });

    });

    $('#produtsSelect').on('change', function() {
        $('#myTableDiv2').show();
        var product_id = $("#produtsSelect").val(); //pdt id
        var pdt_type_id = $("#loadProductType").val(); //product type id
        var sectionID = $("#sectionload").val(); //section id

        var category_name = $("#loadProductType").children("option:selected").html();
        var product_name = $("#produtsSelect").children("option:selected").html();

        $('#myTable45 tbody').append('<tr>');
        $('#myTable45 tbody').append('<td class="' + product_id + '">' + product_name + '</td>');
        $('#myTable45 tbody').append('<td class="' + product_id + '">' + category_name + '</td>');
        $('#myTable45 tbody').append('<td class="' + product_id + '"><a class="btn-xs btn-danger  remove4" href="#" style="border-radius:5px;" data-id="' + product_id + '" >Remove</a></td>');
        $('#myTable45 tbody').append('<input type="hidden" class="' + product_id + '" value="' + sectionID + '" name="sectionID">');
        $('#myTable45 tbody').append('<input type="hidden" class="' + product_id + '" value="' + product_id + '" name="pdt_id[]">');
        $('#myTable45 tbody').append('<input type="hidden" class="' + product_id + '" value="' + pdt_type_id + '" name="pdt_type_id">');

    });

    $('body').on("click", ".remove4", function() {
        var crnt = $(this).data('id');
        $('.' + crnt).remove();
    });

    $('body').on("click", ".remove5", function() {
        var crnt = $(this).data('id');
        $('.' + crnt).remove();
    });
</script>