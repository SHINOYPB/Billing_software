<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Billing Software</title>
        <!-- Favicon-->
        <link rel="icon" href="<?php echo base_url('assets/favicon.ico'); ?>" type="image/x-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

        <!-- Bootstrap Core Css -->
        <link href="<?php echo base_url('assets/login/plugins/bootstrap/css/bootstrap.css'); ?>" rel="stylesheet">

        <!-- Waves Effect Css -->
        <link href="<?php echo base_url('assets/login/plugins/node-waves/waves.css'); ?>" rel="stylesheet" />

        <!-- Animation Css -->
        <link href="<?php echo base_url('assets/login/plugins/animate-css/animate.css'); ?>" rel="stylesheet" />

        <!-- Custom Css -->
        <link href="<?php echo base_url('assets/login/css/style.css'); ?>" rel="stylesheet">
    </head>

    <body class="login-page">
        <div class="login-box">
            <div class="logo">
                <a href="javascript:void(0);"><?php echo lang('login_heading'); ?></a>
                <small></small>
            </div>
            <div class="card">
                <div class="body">
                    <?php echo form_open("auth/login", 'id="sign_in"'); ?>
                    <div class="msg"><?php echo lang('login_subheading'); ?></div>
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
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <?php echo form_input($identity); ?>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <?php echo form_input($password); ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">

                            <?php echo form_checkbox('remember', '1', FALSE, 'id="remember" class="filled-in chk-col-pink"'); ?>
                            <?php echo lang('login_remember_label', 'remember'); ?>
                        </div>
                        <div class="col-xs-4">
                            <?php echo form_submit('submit', lang('login_submit_btn'), 'class="btn btn-block bg-pink waves-effect"'); ?>
                        </div>
                    </div>
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                        </div>
                        <div class="col-xs-6 align-right">
                            <a href="forgot_password"><?php echo lang('login_forgot_password'); ?></a>
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>

        <!-- Jquery Core Js -->
        <script src="<?php echo base_url('assets/login/plugins/jquery/jquery.min.js'); ?>"></script>

        <!-- Bootstrap Core Js -->
        <script src="<?php echo base_url('assets/login/plugins/bootstrap/js/bootstrap.js'); ?>"></script>

        <!-- Waves Effect Plugin Js -->
        <script src="<?php echo base_url('assets/login/plugins/node-waves/waves.js'); ?>"></script>

        <!-- Validation Plugin Js -->
        <script src="<?php echo base_url('assets/login/plugins/jquery-validation/jquery.validate.js'); ?>"></script>

        <!-- Custom Js -->
        <script src="<?php echo base_url('assets/login/js/admin.js'); ?>"></script>
        <script src="<?php echo base_url('assets/login/js/pages/examples/sign-in.js'); ?>"></script>
    </body>

</html>