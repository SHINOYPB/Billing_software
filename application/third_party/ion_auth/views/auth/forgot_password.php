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
                <a href="javascript:void(0);"><?php echo lang('forgot_password_heading'); ?></a>
                <small></small>
            </div>
            <div class="card">
                <div class="body">
                    <?php echo form_open("auth/forgot_password", 'id="forgot_password" novalidate="novalidate"'); ?>
                    <div class="msg">
                        <?php echo sprintf(lang('forgot_password_subheading'), $identity_label); ?>
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
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <?php echo form_input($identity); ?>
                        </div>
                        <?php if (!empty($identity_error)) { ?>
                            <label id="identity-error" for="identity" class="error"><?php echo $identity_error; ?></label>
                        <?php } ?>
                    </div>

                    <?php echo form_submit('submit', lang('forgot_password_submit_btn'), 'class="btn btn-block btn-lg bg-pink waves-effect"'); ?>

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