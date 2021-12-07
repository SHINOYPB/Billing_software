<!-- body-wrapper -->
<div class="ms-content-wrapper">
	<div class="row">

		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb pl-0">
					<li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Category Management</a></li>
					<li class="breadcrumb-item active" aria-current="page">Add Category</li>
				</ol>
			</nav>
		</div>
		<div class="col-xl-12 col-md-12">
			<div class="ms-panel ms-panel-fh">
				<div class="ms-panel-header">
					<h6>Add Category</h6>
				</div>


				<?php if ($msg = $this->session->flashdata('msg')) :   ?>
			<div class="row">
				<div class="col-md-6">
					<div class="alert alert-dismissible alert-success">
						<?php echo $msg; ?>
					</div>
				</div>
			</div>
		<?php endif; ?>



				<div class="ms-panel-body">

				<?php echo form_open_multipart('Category_pdt/createCategoryPdt'); ?>
			<!-- <form class="needs-validation clearfix" novalidate method="post" action="<?php //echo base_url('Category_pdt/createCategoryPdt') 
																							?>"> -->

			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label>Name</label>
					<div class="input-group">
						<input type="text" class="form-control" name="name" placeholder="Name" required>
						<div class="valid-feedback">
							Looks good!
						</div>
					</div>
				</div>

				<!-- SELECT BOX RENDER BY JQUERY -->
				<div class="col-md-6 mb-3  ">
					<label>Parent of:</label>
					<!-- <div class="form-control "> -->
						<select id="mySelect1" class="" style="width: 100%;" name="parent_id">
							<option value=null>No Parent</option>
						</select>
					<!-- </div> -->
				</div>

				<div class="col-md-6 mb-3">
					<label>Image</label>
					<div class="input-group">
						<input type="file" name="image" style="width: 100%;" />
						<div class="valid-feedback">
							Looks good!
						</div>
					</div>
				</div>


			</div>

			<button class="btn btn-primary d-block float-right" type="submit">Save and Continue</button>
			</form>


				</div>
			</div>
		</div>
	</div>
</div>


<!-- SCRIPTS -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#mySelect1').select2();
	});
</script>