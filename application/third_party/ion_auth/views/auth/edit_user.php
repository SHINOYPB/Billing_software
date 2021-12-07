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
    <div class="ms-panel-header">
      <h6><?php echo "Edit Admin"; ?></h6>
    </div>

    <div class="ms-panel-body">

      <form class="needs-validation clearfix" novalidate method="post" action="<?php echo current_url() ?>">

        <div class="form-row">

          <div class="col-md-6 mb-3">
            <label for="categoryname" <?php if ($first_name) : ?>class="active" <?php endif; ?>>
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
            <label for="description" <?php if ($last_name) : ?>class="active" <?php endif; ?>>Last Name</label>
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
            <label for="description">Password :(if changing password)</label>
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
            <label for="description">Confirm Password :(if changing password)</label>
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
          <div class="form-row">
            <label>Member of groups</label>
            <div class="col-md-6 mb-3">

              <?php foreach ($groups as $group) : ?>

                <div class="input-group">
                  <?php
                  $gID = $group['id'];
                  $checked = null;
                  $item = null;
                  foreach ($currentGroups as $grp) {
                    if ($gID == $grp->id) {
                      $checked = ' checked="checked"';
                      break;
                    }
                  }
                  ?>

                  <input type="checkbox" id="group_<?php echo $group['id']; ?>" name="groups[]" value="<?php echo $group['id']; ?>" <?php echo $checked; ?>>
                  <label for="group_<?php echo $group['id']; ?>"><?php echo htmlspecialchars($group['name'], ENT_QUOTES, 'UTF-8'); ?></label>
                </div>
              <?php endforeach ?>
            </div>
          </div>

        <?php endif ?>

<!-- create group section  -->

        <!-- <div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="description">Group Name</label>
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
        </div> -->


        <!-- <div class="form-row">
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

        <!-- /create group section  -->


        <?php echo form_hidden('id', $user->id); ?>
        <button class="btn btn-primary d-block float-right" type="submit">Save and Continue</button>
      </form>
    </div>
  </div>
</div>