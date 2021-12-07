<div class="col-xl-12 col-md-12">
	<div class="ms-panel ms-panel-fh">
		<div class="ms-panel-header">
			<h6>Login</h6>
		</div>

		<div class="ms-panel-body">

			<div class="form-row">
				<?php echo form_open_multipart($action = 'admin/checkAdmin', $attributes = '', $hidden = '') ?>
				<div class="col-md-12 mb-3">
					<label for="validationCustom20">Email Address</label>
					<div class="input-group">
						<?php echo form_input('email', '', array('placeholder'=>'Enter Email Address','class'=>'form-control'))  ?>
						<div class="invalid-feedback">
							Please provide a valid email.
						</div>
					</div>
				</div>
				<div class="col-md-12 mb-3">
					<label for="validationCustom21">Password</label>
					<div class="input-group">
						<?php echo form_input('password', '', array('placeholder'=>'Enter Password ','class'=>'form-control'))  ?>
						<div class="invalid-feedback">
							Please provide a password.
						</div>
					</div>
				</div>
			</div>
			<?php echo form_submit('submit', 'Login', 'class="btn btn-primary"')  ?>
			<?php echo form_close();  ?>

		</div>
	</div>
</div>


