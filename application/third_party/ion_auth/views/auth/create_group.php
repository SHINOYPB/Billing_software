<!-- body-wrapper -->
<div class="ms-content-wrapper">
    <div class="row">

        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pl-0">
                    <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Administrator</a></li>

                    <li class="breadcrumb-item active" aria-current="page">Create Group</li>
                </ol>
            </nav>
        </div>
        <div class="col-xl-12 col-md-12">
            <div class="ms-panel ms-panel-fh">
                <div class="ms-panel-header">
                    <h2>
                        <?php echo lang('create_group_heading'); ?>
                        <!-- <small><?php echo lang('create_group_subheading'); ?></small> -->
                    </h2>
                </div>
                <div class="ms-panel-body">

                    <?php echo form_open("auth/create_group", 'class="form-horizontal"'); ?>
                    <div class="row clearfix">
                        <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                            <h6> <?php echo lang('create_group_name_label', 'group_name'); ?> </h6>
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
                            <h6> <?php echo lang('create_group_desc_label', 'description'); ?> </h6>
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
                        <div class="col-12 pt-3 pb-2">
                            <h5>Permissions</h5>
                        </div>

                        <?php foreach ($allPermissions as $permission) { ?>
                            <div class="col-3 py-3">
                                <input type="checkbox" name="permissions[]" value="<?php echo $permission->permission_name ?>" id="<?php echo $permission->permission_name ?>" class="filled-in chk-col-pink" <?php echo in_array($permission->permission_name, $permissions) ? 'checked' : '' ?>>
                                <label for="<?php echo $permission->permission_name ?>"><?php echo $permission->description ?></label>
                            </div>
                        <?php } ?>

                    </div>


                    <div class="row clearfix">
                        <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                            <?php echo form_submit('submit', lang('create_group_submit_btn'), 'class="btn btn-primary m-t-15 waves-effect"'); ?>
                        </div>
                    </div>
                    <?php echo form_close(); ?>


                </div>
            </div>
        </div>
    </div>
</div>






