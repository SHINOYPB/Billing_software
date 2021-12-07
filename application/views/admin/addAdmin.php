<div class="col-xl-12 col-md-12">
	<div class="ms-panel ms-panel-fh">
		<div class="ms-panel-header">
			<h6>Create Users</h6>
		</div>

		<div class="ms-panel-body">

				<div class="form-row">
					<?php echo form_open_multipart($action = 'admin/createAdmin', $attributes = '', $hidden = '') ?>

					<div class="col-md-12 mb-3">
						<label for="validationCustom24">Name</label>
						<div class="input-group">
							<?php echo form_input('name', '', array('placeholder'=>'Enter  Name','class'=>'form-control'))  ?>
							<div class="invalid-feedback">
								Please provide a Name.
							</div>
						</div>
					</div>
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
					<div class="col-md-12 mb-3">
						<label for="validationCustom22">Group</label>
						<div class="input-group">
							<?php
							$groupOptions = array();
							foreach ($groups->result() as $group)
							{
								$groupOptions[$group->id] = $group->name;
							}

							echo form_dropdown('group',$groupOptions,'',array('placeholder'=>'Select Group ','class'=>'form-control'));


							?>
							<div class="invalid-feedback">
								Please select a Group.
							</div>
						</div>
					</div>

					<h4>Create Group</h4>

					<div class="col-md-12 mb-3">
						<label for="validationCustom24">Group Name</label>
						<div class="input-group">
							<?php echo form_input('group_name', '', array('placeholder'=>'Enter Group Name','class'=>'form-control'))  ?>
							<div class="invalid-feedback">
								Please provide a Group Name.
							</div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<label for="validationCustom20">Description</label>
						<div class="input-group">
							<?php echo form_input('description', '', array('placeholder'=>'Enter Description','class'=>'form-control'))  ?>
							<div class="invalid-feedback">
								Please provide Group Description.
							</div>
						</div>
					</div>

				</div>



				<?php echo form_submit('Add AdminModel', 'Add AdminModel', 'class="btn btn-primary"')  ?>
				<?php echo form_close();  ?>
		</div>
	</div>
</div>


