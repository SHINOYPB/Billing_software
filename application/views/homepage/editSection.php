<div class="col-xl-12 col-md-12">
    <div class="ms-panel ms-panel-fh">
        <?php if ($msg = $this->session->flashdata('msg')) :   ?>
            <div class="row">
                <div class="col-md-6">
                    <div class="alert alert-dismissible alert-success">
                        <?php echo $msg; ?>
                    </div>
                </div>
            </div>
        <?php endif;  ?>
        <div class="ms-panel-header">
            <h6>EDIT HOMEPAGE SECTION</h6>
        </div>
        <?php if (count($sections)) : ?>
            <?php foreach ($sections as $test) : ?>
                <div class="ms-panel-body">

                    <!-- <form class="needs-validation clearfix" novalidate method="post" action="<?php echo base_url('Homepage/updateHomepage') ?>"> -->

                    <div class="form-row">

                        <input type="hidden" id="HompageId" name="HompageId" value="<?php echo $test->id ?>">

                        <div class="col-md-6 mb-3">
                            <label>Section Name</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="name" value="<?= $test->name ?>" placeholder="<?= $test->name ?>" id="sectionName" required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                        </div>



                    </div>

                    <div class="ms-panel">
                        <!--Assigned pdt/category showing table defenition -->
                        <div class="ms-panel-header">
                            <h6 class="text-center">Assigned Products</h6>
                        </div>

                        <div class="ms-content-wrapper">

                            <table id="loadInstitution" class="table table-bordered">
                                <thead>
                                    <th>Sl No</th>
                                    <th>Product Name</th>
                                    <th>Action</th>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                        </div>
                    </div>


                    <!-- // -->
                    <div class="ms-content-wrapper">
                        <div class="row" style="height:inherit;">

                            <!-- product assign part -->
                            <div class="container border ms-panel" id="productAssign" style="width: 850px;">


                                <div class="col-md-12  " style="margin-top: 36px;   margin-left: 82px;">

                                    <label style="font-size: 19px;" class="font-weight-bold"> Product Type</label>
                                    <div class="form-control contspecvalue4 " style="width: 220px;margin-left: 248px;">
                                        <select id="loadProductType" class="select" style="width: 100%;" name="sp_val[]">
                                            <option value="">Select Type</option>
                                        </select>
                                    </div>

                                </div>

                                <div class="col-md-12  " style="margin-top: 36px;   margin-left: 92px;">

                                    <label style="font-size: 19px;" class="font-weight-bold"> Product </label>
                                    <div class="form-control contspecvalue4 " style="width: 220px;margin-left: 284px;">
                                        <select id="produtsSelect" class="select" style="width: 100%;" name="sp_val[]">
                                            <option value="">Select Product</option>
                                        </select>
                                    </div>
                                </div>



                                <div class="col-md-12" style="margin-top: 31px;">




                                    <div id="myTableDiv2">
                                        <form action="<?php echo base_url('Homepage/assgnsection1/') ?>" method="POST">

                                        <input type="hidden" id="HompageId2" name="sectionID" value="<?php echo $test->id ?>">
                                        <input type="hidden" id="HompageId2" name="sectionName" value="<?php echo $test->name ?>">
                                            <div id="buttonStaticpdt">
                                                <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Assign</button>
                                            </div>

                                            <table id="myTable45" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Product Type</th>
                                                        <th>Product Name</th>
                                                        <th>Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>

                                               
                                            </table>
                                            <div id="btnpdtdown">
                                            <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Assign</button>
                                            </div>
                                        </form>
                                    </div>



                                </div>


                            </div>
                            <!-- /product assign part -->

                            <!-- category assign part -->
                            <div class="container border ms-panel" id="categoryAssign" style="width: 850px;">



                                <div class="col-md-12  " style="margin-top: 36px;   margin-left: 82px;">

                                    <label style="font-size: 19px;" class="font-weight-bold"> Seclect CAtegory</label>
                                    <div class="form-control contspecvalue4 " style="width: 220px;margin-left: 248px;">
                                        <select id="loadCatagory" class="select" style="width: 100%;" name="sp_val[]">
                                            <option value="">Select Type</option>
                                        </select>
                                    </div>
                                </div>





                                <div class="col-md-12 assCate" style="margin-top: 31px;">
                                    <!--  New table rendor  -->

                                    <div id="myTableDiv3">
                                        <form action="<?php echo base_url('Homepage/assCarSection1/') ?>" method="POST">
                                        <input type="hidden" id="HompageId2" name="sectionID" value="<?php echo $test->id ?>">
                                        <input type="hidden" id="HompageId2" name="sectionName" value="<?php echo $test->name ?>">
                                        <div id="buttonStaticcat">
                                                <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Assign</button>
                                            </div>
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
                                            <div id="btncatdown">
                                            <button type="submit" class=" btn btn-success btn-sm" style=" float: right; ">Assign</button>
                                            </div>
                                        </form>
                                    </div>



                                </div>


                            </div>
                            <!-- /category assign part -->


                        </div>
                    </div>


                    <!-- // -->



                    <!-- </form> -->
                </div>

            <?php endforeach; ?>
        <?php endif; ?>

        <input type="hidden" id="search_url" value="<?php echo base_url('/Homepage/prodtLoad'); ?>" />
    </div>
</div>




<script type="text/javascript">
    $(document).ready(function() {

    });
</script>

<script type="text/javascript">
    window.onload = function() {
        // $('#sectionload').select2();
        $('#loadProductType').select2();
        $('#produtsSelect').select2();
        $('#loadCatagory').select2();
        $('#myTable45').hide();
        $('#btnpdtdown').hide();
        $('#catAssign').hide(); //category assign table
        $('#btncatdown').hide();
        // $('#categoryAssign').hide();
        fetchCategory();

        var homepgId = $('#HompageId').val();
        if (homepgId == 6) {
            $('#productAssign').hide();
            $('#categoryAssign').show();
        } else {
            $('#categoryAssign').hide();
            $('#productAssign').show();
        }


        ajaxLoadv();
        ajaxLoad12();
        // $(".load").on("change", pdtload);

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

    function ajaxLoadv() { //it  gives assigned pdt or category in first table in this page
        var url = $('#search_url').val();
        table = $('#loadInstitution').DataTable({
            serverSide: true,
            searching: false,
            processing: true,
            pagination: true,
            ajax: {
                url: url,
                method: 'POST',
                'data': function(data) {
                    data.id = $('#HompageId').val();

                },

                dataFilter: function(data) {
                    var json = jQuery.parseJSON(data);
                    json.recordsTotal = json.total_rows;
                    json.recordsFiltered = json.total_rows;
                    json.data = json.list;
                    return JSON.stringify(json); // return JSON string
                }
            },

            columnDefs: [{
                    orderable: false,
                    targets: [0, 1, 2]
                },
                {
                    "targets": 2,
                    "mRender": function(data) {

                        return '<a  onclick="myfunction(' + data + ')" class="btn btn-sm btn-danger " data-toggle="tooltip" data-placement="top" title="Delete">Delete</a>';

                    }
                },


            ]
        });



    }

    function myfunction(id) { //deleting assigned pdt/category  function
        $.ajax({
            type: 'POST',
            url: "<?php echo base_url(); ?>Homepage/deleteAssProducts",
            data: {
                id: id
            },
            success: function(data) {
                var ndata = JSON.parse(data);


                if (ndata.return == true) {

                    alert("success fully deleted");
                    table.destroy();
                    ajaxLoadv();


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

    function ajaxLoad12() { //section load function means homepage table show function
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
    } // not using here

    $('#loadProductType').on('change', function() { //loading pdt types in select box

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

    $('#produtsSelect').on('change', function() { //render table for pdts that assigned to sections(homepage)
        $('#myTableDiv2').show();
        $('#myTable45').show();
        $('#buttonStaticpdt').hide();
        $('#btnpdtdown').show();
        var product_id = $("#produtsSelect").val(); //pdt id
        var pdt_type_id = $("#loadProductType").val(); //product type id
        var sectionID = $('#HompageId').val();
        var sectionName = $("#sectionName").val();

        var productType = $("#loadProductType").children("option:selected").html();
        var product_name = $("#produtsSelect").children("option:selected").html();

        $('#myTable45 tbody').append('<tr>');
        $('#myTable45 tbody').append('<td class="' + product_id + '">' + productType + '</td>');
        $('#myTable45 tbody').append('<td class="' + product_id + '">' + product_name + '</td>');
        $('#myTable45 tbody').append('<td class="' + product_id + '"><a class="btn-xs btn-danger  remove4" href="#" style="border-radius:5px;" data-id="' + product_id + '" >Remove</a></td>');
        //$('#myTable45 tbody').append('<input type="hidden" class="' + product_id + '" value="' + sectionID + '" name="sectionID">');
        $('#myTable45 tbody').append('<input type="hidden" class="' + product_id + '" value="' + product_id + '" name="pdt_id[]">');
        //$('#myTable45 tbody').append('<input type="hidden" class="' + product_id + '" value="' + sectionName + '" name="sectionName">');

    });

    $('body').on("click", ".remove4", function() { //remove assigned pdts from table 
        var crnt = $(this).data('id');
        $('.' + crnt).remove();
    });


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

    $('#loadCatagory').on('change', function() { //render table for assiged category to repective homepage sections
        $('#myTableDiv3').show();
        $('#catAssign').show();
        $('#btncatdown').show();
        $('#buttonStaticcat').hide();
        // var product_id = $("#produtsSelect").val(); //pdt id
        var categoryId = $("#loadCatagory").val(); //category id
        var sectionID = $('#HompageId').val(); //section id

        var category_name = $("#loadCatagory").children("option:selected").html();
        var sectionName = $("#sectionName").val();


        alert(sectionName);

        $('#catAssign tbody').append('<tr>');
        // $('#myTable45 tbody').append('<td class="' + product_id + '">' + product_name + '</td>');
        $('#catAssign tbody').append('<td class="' + categoryId + '">' + category_name + '</td>');
        $('#catAssign tbody').append('<td class="' + categoryId + '"><a class="btn-xs btn-danger  remove5" href="#" style="border-radius:5px;" data-id="' + categoryId + '" >Remove</a></td>');
       // $('#catAssign tbody').append('<input type="hidden" class="' + categoryId + '" value="' + sectionID + '" name="sectionID">');
        $('#catAssign tbody').append('<input type="hidden" class="' + categoryId + '" value="' + categoryId + '" name="catId[]">');
        //$('#catAssign tbody').append('<input type="hidden" class="' + categoryId + '" value="' + sectionName + '" name="sectionName">');
    });

    $('body').on("click", ".remove5", function() { //delete assiged category from rendered category table
        var crnt = $(this).data('id');
        $('.' + crnt).remove();
    });
</script>