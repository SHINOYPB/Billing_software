<!-- body-wrapper -->
<div class="ms-content-wrapper">
    <div class="row">

        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pl-0">
                    <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Billing Management</a></li>

                    <li class="breadcrumb-item active" aria-current="page">Add Packing Info</li>
                </ol>
            </nav>
        </div>
        <div class="col-xl-12 col-md-12">
            <div class="ms-panel ms-panel-fh">
                <div class="ms-panel-header">
                    <h6>ADD PACKING INFO</h6>
                </div>


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


                <div class="ms-panel-body">


                    <div class="ms-content-wrapper">

                        <div class="row" style="height:inherit;">

                            <form class="needs-validation clearfix" novalidate method="post" action="<?php echo base_url('Billing/createPackingInfo') ?>">

                             


                                    <div class="col-md-12  " style="margin-top: 36px;   margin-left: 82px;">
                                        <!--Product type-->
                                        <label style="font-size: 19px;" class="font-weight-bold"> Number</label>
                                        <div class="form-control contspecvalue4 " style="width: 220px;margin-left: 279px;">
                                            <input type="text" name="number" class="form-controll">
                                        </div>
                                    </div>


                                    <div class="col-md-12 " style="margin-top: 36px;  margin-left: 82px;">
                                        <!--Load Product select-->
                                        <label style="font-size: 19px;" class="font-weight-bold"> Description </label>
                                        <div class="form-control contspecvalue4 " style="width: 220px;margin-left: 252px;">
                                            <input type="text" name="description" class="form-controll">
                                            <!-- <a href="javascript:void(0)" class="show_category" style="padding-left: 29px; position:absolute; color: red;font-size: 29px;margin-top: -12px;">+</a> -->
                                        </div>
                                    </div>
                                   
                                    <div class="row">
                                    <div class="col-md-9">

                                    </div>
                                    <div class="col-md-3  " style="margin-top: 36px; ">
                                        <button type="submit" class=" btn btn-primary " style="float:right;">Add</button>
                                    </div>
                                </div>

                               

                            </form>

                        </div>


                    </div>
                </div>



            </div>
        </div>
    </div>
</div>
</div>





<!-- SCRIPTS -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#myPdtSelectBox1').select2();
        $('#myPdtSelectBox').select2();
        $('#wholeSelect1').select2();


    });
</script>