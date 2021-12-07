<!-- <div id="page-wrapper" > -->
  <div class="header"> 
    <h1 class="page-header"><?php echo lang('create_user_heading'); ?></h1>
    <ol class="breadcrumb">
      <li><a href="#">Home</a></li>
      <li><a href="#">Forms</a></li>
      <li class="active">Data</li>
    </ol>                
  </div>
  <div id="page-inner"> 
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-action"><?php echo lang('create_user_heading'); ?></div>
            <div class="card-content">
              <?php echo form_open_multipart("auth/create_user", 'class="col s12"'); ?>
                <div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($first_name, ['class' => "validate"])); ?>
                    <label for="categoryname">Subcategory Name</label>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($last_name, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>
<?php if ($identity_column !== 'email') { ?>
<div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($identity, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                    <label class="error" id="identity-error" for="identity">
                                    <?php echo form_error('identity');?>
                                </label>
                  </div>
                </div>
<?php } ?>
                <div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($email, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($phone, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($password, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($password_confirm, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>
<?php if ($this->ion_auth->is_admin()): ?>

  <div class="row">
    <label for="description">Description</label>
                  <div class="input-field col s12">
                    <?php foreach ($groups as $group): ?>
                                    <input type="checkbox" id="group_<?php echo $group['id']; ?>" name="groups[]" value="<?php echo $group['id']; ?>">
                                    <label for="group_<?php echo $group['id']; ?>"><?php echo htmlspecialchars($group['name'], ENT_QUOTES, 'UTF-8'); ?></label>
                                <?php endforeach ?>
                  </div>
                </div>
  <?php endif ?>
<h1 class="page-header"><?php echo 'Create Group'; ?></h1>
<div class="row">
                  <div class="input-field col s12">
                    <?php echo form_input(array_merge($group_name, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>

                <div class="input-field col s12">
                    <?php echo form_input(array_merge($description, ['class' => "validate"])); ?>
                    <label for="description">Description</label>
                  </div>
                </div>
<div class="row">
    <label for="description">Description</label>
                  <div class="input-field col s12">
                    <?php foreach ($allPermissions as $permission): ?>
                                    <input type="checkbox" name="permissions[]" value="<?php echo $permission->permission_name?>" id="<?php echo $permission->permission_name?>" class="filled-in chk-col-pink" <?php echo in_array($permission->permission_name, $permissions)?'checked':''?>>
                                   <label for="<?php echo $permission->permission_name?>"><?php echo $permission->description ?></label>
                                <?php endforeach ?>
                  </div>
                </div>
                <div class="row">
                  <div class="col s12">
                    <div class="input-field inline">
                      <?php echo form_submit('submit', 'Save', 'class="btn"'); ?>
                    </div>
                  </div>
                </div>
              <?php echo form_close(); ?>
              <div class="clearBoth"></div>
            </div>
         </div>
      </div> 
    </div>