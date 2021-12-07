<!-- MAIN -->
		<div class="main">

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
	<h3 class="page-title">Elements</h3>

	<div class="row">
		<div class="col-md-12">

<!-- INPUTS -->
			<div class="panel">
				<div class="panel-heading">
					<h3 class="panel-title">Inputs</h3>
				</div>
				<hr>
				<div class="panel-body">
					<?php echo form_open("auth/create_user", 'class="form-horizontal"'); ?>
					<div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_user_fname_label', 'first_name'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line focused">
                                <?php echo form_input(array_merge($first_name, ['class' => "form-control", 'placeholder' => lang('create_user_fname_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_user_lname_label', 'last_name'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($last_name, ['class' => "form-control", 'placeholder' => lang('create_user_lname_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>

                <?php if ($identity_column !== 'email') { ?>
                    <div class="row clearfix">
                        <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                            <?php echo lang('create_user_identity_label', 'identity'); ?>
                        </div>
                        <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                            <div class="form-group">
                                <div class="form-line">
                                    <?php echo form_input(array_merge($identity, ['class' => "form-control", 'placeholder' => lang('create_user_identity_label')])); ?>
                                </div>
                                <label class="error" id="identity-error" for="identity">
                                    <?php echo form_error('identity');?>
                                </label>
                            </div>
                        </div>
                    </div>
                <?php } ?>
               
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_user_email_label', 'email'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($email, ['class' => "form-control", 'placeholder' => lang('create_user_email_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_user_phone_label', 'phone'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($phone, ['class' => "form-control", 'placeholder' => lang('create_user_phone_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_user_password_label', 'password'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($password, ['class' => "form-control", 'placeholder' => lang('create_user_password_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_user_password_confirm_label', 'password_confirm'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($password_confirm, ['class' => "form-control", 'placeholder' => lang('create_user_password_confirm_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php if ($this->ion_auth->is_admin()): ?>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <label>Select Groups</label>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="demo-checkbox ">
                                <?php foreach ($groups as $group): ?>
                                    <input type="checkbox" id="group_<?php echo $group['id']; ?>" name="groups[]" value="<?php echo $group['id']; ?>">
                                    <label for="group_<?php echo $group['id']; ?>"><?php echo htmlspecialchars($group['name'], ENT_QUOTES, 'UTF-8'); ?></label>
                                <?php endforeach ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endif ?>

                <h1 class="card-inside-title row container "><?php echo 'Create Group'; ?></h1>

                <div class="row clearfix ">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_group_name_label', 'group_name'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line focused">
                                <?php echo form_input(array_merge($group_name, ['class' => "form-control", 'placeholder' => lang('create_group_name_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('create_group_desc_label', 'description'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($description, ['class' => "form-control", 'placeholder' => lang('create_group_desc_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <label>Permissions</label>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <?php foreach ($allPermissions as $permission) { ?>
                            <div class="col-md-3">
                                <input type="checkbox" name="permissions[]" value="<?php echo $permission->permission_name?>" id="<?php echo $permission->permission_name?>" class="filled-in chk-col-pink" <?php echo in_array($permission->permission_name, $permissions)?'checked':''?>>
                                <label for="<?php echo $permission->permission_name?>"><?php echo $permission->description ?></label>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                        <?php echo form_submit('submit', lang('create_user_submit_btn'), 'class="btn btn-primary m-t-15 waves-effect"'); ?>
                    </div>
                </div>
					<input type="text" class="form-control" placeholder="text field"><br>
					<input type="password" class="form-control" value="asecret"><br>
					<textarea class="form-control" placeholder="textarea" rows="4"></textarea><br>
					<select class="form-control">
						<option value="cheese">Cheese</option>
						<option value="tomatoes">Tomatoes</option>
						<option value="mozarella">Mozzarella</option>
						<option value="mushrooms">Mushrooms</option>
						<option value="pepperoni">Pepperoni</option>
						<option value="onions">Onions</option>
					</select><br>

					<label class="fancy-checkbox">
						<input type="checkbox">
						<span>Fancy Checkbox 1</span>
					</label>
					<label class="fancy-checkbox">
						<input type="checkbox">
						<span>Fancy Checkbox 2</span>
					</label>
					<label class="fancy-checkbox">
						<input type="checkbox">
						<span>Fancy Checkbox 3</span>
					</label><br>

					<label class="fancy-radio">
						<input name="gender" value="male" type="radio">
						<span><i></i>Male</span>
					</label>
					<label class="fancy-radio">
						<input name="gender" value="female" type="radio">
						<span><i></i>Female</span>
					</label>
					<?php echo form_close(); ?>
				</div>
			</div>
			<!-- END INPUTS -->

		</div>
	</div>
	

				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
