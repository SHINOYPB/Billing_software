<!-- body-wrapper -->
<div class="ms-content-wrapper">
  <div class="row">

    <div class="col-md-12">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb pl-0">
          <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Administrator</a></li>

          <li class="breadcrumb-item active" aria-current="page">Administrator List</li>
        </ol>
      </nav>
    </div>
    <div class="col-xl-12 col-md-12">
      <div class="ms-panel ms-panel-fh">
        <div class="ms-panel-header">
          <h6><?php echo lang('create_user_heading'); ?></h6>

        </div>
        <div class="ms-panel-body">


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
            </div>
          </div>




          <form class="needs-validation clearfix" novalidate method="post" action="<?php echo base_url('auth/create_user') ?>">


            <div class="form-row">

              <div class="col-md-6 mb-3">
                <label>First Name</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($first_name, ['class' => "form-control"])); ?>
                  <div class="invalid-feedback">
                    Please Enter Name.
                  </div>
                </div>
              </div>
            </div>


            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Last Name</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($last_name, ['class' => "form-control"])); ?>
                  <!--              <div class="valid-feedback">-->
                  <!--                Looks good!-->
                  <!--              </div>-->
                  <div class="invalid-feedback">
                    Please Enter Last Name
                  </div>
                </div>
              </div>
            </div>


            <?php if ($identity_column !== 'email') { ?>
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label><?php echo form_error('identity'); ?></label>
                  <div class="input-group">
                    <?php echo form_input(array_merge($email, ['class' => "form-control"])); ?>
                    <!--              <div class="valid-feedback">-->
                    <!--                Looks good!-->
                    <!--              </div>-->
                    <div class="invalid-feedback">
                      Please Enter Email
                    </div>
                  </div>
                </div>
              </div>
            <?php } ?>


            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Email</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($email, ['class' => "form-control"])); ?>
                  <!--              <div class="valid-feedback">-->
                  <!--                Looks good!-->
                  <!--              </div>-->
                  <div class="invalid-feedback">
                    Please Enter Email
                  </div>
                </div>
              </div>
            </div>


            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Phone</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($phone, ['class' => "form-control"])); ?>
                  <!--              <div class="valid-feedback">-->
                  <!--                Looks good!-->
                  <!--              </div>-->
                  <div class="invalid-feedback">
                    Please Enter Phone
                  </div>
                </div>
              </div>
            </div>



            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Password</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($password, ['class' => "form-control"])); ?>

                  <!--              <div class="valid-feedback">-->
                  <!--                Looks good!-->
                  <!--              </div>-->
                  <div class="invalid-feedback">
                    Please Enter Password
                  </div>
                </div>
              </div>
            </div>



            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Password</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($password_confirm, ['class' => "form-control"])); ?>
                  <!--              <div class="valid-feedback">-->
                  <!--                Looks good!-->
                  <!--              </div>-->
                  <div class="invalid-feedback">
                    Please Enter Password
                  </div>
                </div>
              </div>
            </div>



            <?php if ($this->ion_auth->is_admin()) : ?>

              <div class="row">
                <div class="col-12">
                  <label for="description"><h6>Select Groups</h6></label>
                </div>
                <!-- <div class="input-field col s12"> -->
                  <?php foreach ($groups as $group) : ?>
                    <div class=" col-3 py-3" >
                      <input type="checkbox" id="group_<?php echo $group['id']; ?>" name="groups[]" value="<?php echo $group['id']; ?>">
                      <label for="group_<?php echo $group['id']; ?>"><?php echo htmlspecialchars($group['name'], ENT_QUOTES, 'UTF-8'); ?></label>
                    </div>
                  <?php endforeach ?>
                <!-- </div> -->
              </div>
            <?php endif ?>

            



            <!-- <h2 class="page-header"><?php echo 'Create Group'; ?></h2>
            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Gruop Name</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($group_name, ['class' => "form-control"])); ?>
                  <div class="invalid-feedback">
                    Please Enter Gruop Name
                  </div>
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label>Description</label>
                <div class="input-group">
                  <?php echo form_input(array_merge($description, ['class' => "form-control"])); ?>
                  <div class="invalid-feedback">
                    Please Enter Description
                  </div>
                </div>
              </div>
            </div>


            <div class="form-row">
              <label>Permissions ( When Create New Group )</label>
              <div class="col-md-6 mb-3">

                <?php foreach ($allPermissions as $permission) : ?>
                  <div class="input-group">
                    <input type="checkbox" name="permissions[]" value="<?php echo $permission->permission_name ?>" id="<?php echo $permission->permission_name ?>" class="filled-in chk-col-pink" <?php echo in_array($permission->permission_name, $permissions) ? 'checked' : '' ?>>
                    <label for="<?php echo $permission->permission_name ?>"><?php echo $permission->description ?></label>
                  </div>
                <?php endforeach ?>
              </div>
            </div> -->

            <button class="btn btn-primary d-block float-right" type="submit">Save and Continue</button>
          </form>



        </div>
      </div>




    </div>
  </div>
</div>
</div>
</div>