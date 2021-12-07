<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Forgot password</title>
        <!-- Favicon-->
        <link rel="icon" href="<?php echo base_url('assets/favicon.ico'); ?>" type="image/x-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

        <!-- Bootstrap Core Css -->
        <link href="<?php echo base_url('assets/plugins/bootstrap/css/bootstrap.css'); ?>" rel="stylesheet">

        <!-- Waves Effect Css -->
        <link href="<?php echo base_url('assets/plugins/node-waves/waves.css'); ?>" rel="stylesheet" />

        <!-- Animation Css -->
        <link href="<?php echo base_url('assets/plugins/animate-css/animate.css'); ?>" rel="stylesheet" />

        <!-- Custom Css -->
        <link href="<?php echo base_url('assets/css/style.css'); ?>" rel="stylesheet">
    </head>

    <body class="login-page">
        <div class="login-box">
            <div class="logo">
                <a href="javascript:void(0);"><?php echo lang('reset_password_heading'); ?></a>
                <small></small>
            </div>
            <div class="card">
                <div class="body">
                    <?php echo form_open('auth/reset_password/' . $code, 'id="seset_password" novalidate="novalidate"'); ?>
                    <label for="new_password"><?php echo sprintf(lang('reset_password_new_password_label'), $min_password_length); ?></label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <?php echo form_input(array_merge($new_password, ['class' => 'form-control'])); ?>
                        </div>
                    </div>
                    <?php echo lang('reset_password_new_password_confirm_label', 'new_password_confirm'); ?>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <?php echo form_input(array_merge($new_password_confirm, ['class' => 'form-control'])); ?>
                        </div>
                        <?php if ($message) { ?>
                            <label id="identity-error" for="identity" class="error"><?php echo $message; ?></label>
                        <?php } ?>
                    </div>
                    <?php echo form_input($user_id); ?>
                    <?php echo form_hidden($csrf); ?>

                    <?php echo form_submit('submit', lang('reset_password_submit_btn'), 'class="btn btn-block btn-lg bg-pink waves-effect"'); ?>

                    <div class="row m-t-20 m-b--5 align-center">
                        <a href="login">Sign In!</a>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>

        <!-- Jquery Core Js -->
        <script src="<?php echo base_url('assets/plugins/jquery/jquery.min.js'); ?>"></script>

        <!-- Bootstrap Core Js -->
        <script src="<?php echo base_url('assets/plugins/bootstrap/js/bootstrap.js'); ?>"></script>

        <!-- Waves Effect Plugin Js -->
        <script src="<?php echo base_url('assets/plugins/node-waves/waves.js'); ?>"></script>

        <!-- Validation Plugin Js -->
        <script src="<?php echo base_url('assets/plugins/jquery-validation/jquery.validate.js'); ?>"></script>

        <!-- Custom Js -->
        <script src="<?php echo base_url('assets/js/admin.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/pages/examples/forgot-password.js'); ?>"></script>
    </body>

</html>