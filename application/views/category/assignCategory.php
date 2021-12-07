<!-- body-wrapper -->
<div class="ms-content-wrapper">
	<div class="row">

		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb pl-0">
					<li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Category Management</a></li>

					<li class="breadcrumb-item active" aria-current="page">Assign Category</li>
				</ol>
			</nav>
		</div>
		<div class="col-xl-12 col-md-12">
			<div class="ms-panel ms-panel-fh">
				<div class="ms-panel-header">
					<h6>Assign Category</h6>
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

							<div class="container border ms-panel" style="width: 850px;">


								<div class="col-md-12  " style="margin-top: 36px;   margin-left: 82px;">
									<!--Product type-->
									<label style="font-size: 19px;" class="font-weight-bold"> Product Type</label>
									<div class="form-control contspecvalue4 " style="width: 220px;margin-left: 284px; height: 51px;">
										<select id="myPdtSelectBox1" class="select" style="width: 100%;" name="sp_val[]">
											<option value="">Select Type</option>
										</select>
									</div>
								</div>


								<div class="col-md-12 " style="margin-top: 36px;  margin-left: 82px;">
									<!--Load Product select-->
									<label style="font-size: 19px;" class="font-weight-bold"> Product </label>
									<div class="form-control contspecvalue4 " style="width: 220px;margin-left: 328px; height: 51px;">
										<select id="myPdtSelectBox" class="select_add_med" style="width: 100%;" name="sp_val[]">
											<option value="">Select Product</option>
										</select>
										<!-- <a href="javascript:void(0)" class="show_category" style="padding-left: 29px; position:absolute; color: red;font-size: 29px;margin-top: -12px;">+</a> -->
									</div>
								</div>


								<div class="col-md-12 " style="margin-top: 36px;margin-left: 82px;">
									<!--Load Category select-->
									<label style="font-size: 19px;" class="font-weight-bold">Categories</label>
									<div class="form-control" style="width: 220px;margin-left: 304px; height: 51px;">
										<select id="wholeSelect1" class="select_add_med" style="width: 100%;" name="sp_val[]">
											<option value="">Select Category</option>
										</select>
									</div>
									<!-- <a href="javascript:void(0)" class="btn-danger" id="select1">Add</a> -->
								</div>

								<div class="col-md-12" style="margin-top: 31px;">
									<!--  New table rendor  -->

									<div id="myTableDiv2">
										<form action="<?php echo base_url('Category_pdt/assgnCate/') ?>" method="POST">
											<table id="myTable1" class="table table-bordered">
												<thead>
													<tr>
														<th>Product name</th>
														<th>Category name</th>
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