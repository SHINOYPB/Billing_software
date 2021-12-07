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
			<h6>create section</h6>
		</div>

		<div class="ms-panel-body">

		<?php echo form_open_multipart('Homepage/saveSection');?>
			<!-- <form class="needs-validation clearfix" novalidate method="post" action="<?php //echo base_url('Category_pdt/createCategoryPdt') ?>"> -->

				<div class="form-row">
					<div class="col-md-6 mb-3">
						<label>Name</label>
						<div class="input-group">
							<input type="text" class="form-control" name="name"  placeholder="Name"  required>
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

<!-- SCRIPTS -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$('#mySelect1').select2();
	});
</script>


