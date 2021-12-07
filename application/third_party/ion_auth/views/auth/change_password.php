<div class="block-header">
    <h2><?php echo lang('index_heading'); ?></h2>
</div>
<?php if (!empty($message)) { ?>
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <?php echo $message; ?>
    </div>
<?php } ?>
<?php if (!empty($error)) { ?>
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <?php echo $error; ?>
    </div>
<?php } ?>
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    <?php echo lang('change_password_heading'); ?>
                </h2>
            </div>
            <div class="body">
                <?php echo form_open("auth/change_password", 'class="form-horizontal"'); ?>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('change_password_old_password_label', 'old_password'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($old_password, ['class' => "form-control", 'placeholder' => lang('change_password_old_password_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <label for="new_password"><?php echo sprintf(lang('change_password_new_password_label'), $min_password_length); ?></label>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($new_password, ['class' => "form-control", 'placeholder' => sprintf(lang('change_password_new_password_label'), $min_password_length)])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                        <?php echo lang('change_password_new_password_confirm_label', 'new_password_confirm'); ?>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
                        <div class="form-group">
                            <div class="form-line">
                                <?php echo form_input(array_merge($new_password_confirm, ['class' => "form-control", 'placeholder' => lang('change_password_new_password_confirm_label')])); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php echo form_input($user_id); ?>
                <div class="row clearfix">
                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                        <?php echo form_submit('submit', lang('change_password_submit_btn'), 'class="btn btn-primary m-t-15 waves-effect"'); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
