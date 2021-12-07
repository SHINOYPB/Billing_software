<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    <?php echo lang('deactivate_heading'); ?>
                </h2>
            </div>
            <div class="body">
                <?php echo form_open("auth/deactivate/" . $user->id, 'class="form-horizontal"'); ?>
                <h2 class="card-inside-title"><?php echo sprintf(lang('deactivate_subheading'), $user->first_name . " " . $user->last_name); ?></h2>
                <div class="demo-radio-button">
                    <input type="radio" name="confirm" id="confirm_y" value="yes" checked="checked" />
                    <?php echo lang('deactivate_confirm_y_label', 'confirm_y'); ?>
                    <input type="radio" name="confirm" id="confirm_n" value="no" />
                    <?php echo lang('deactivate_confirm_n_label', 'confirm_n'); ?>
                </div>
                <?php echo form_hidden($csrf); ?>
                <?php echo form_hidden(array('id' => $user->id)); ?>
                <div class="row clearfix">
                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                        <?php echo form_submit('submit', lang('deactivate_submit_btn'), 'class="btn btn-primary m-t-15 waves-effect"'); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
