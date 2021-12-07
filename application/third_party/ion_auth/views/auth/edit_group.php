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
      <h6><?php echo "Edit Group"; ?></h6>
    </div>

    <div class="ms-panel-body">

      <form class="needs-validation clearfix" novalidate method="post" action="<?php echo current_url() ?>">

        <div class="form-row">

          <div class="col-md-6 mb-3">
            <label for="categoryname" <?php if($group_name):?>class="active" <?php endif; ?>>Group Name</label>
            <div class="input-group">
              <?php echo form_input(array_merge($group_name, ['class' => "form-control",'disabled'=>"disabled"])); ?>
              <div class="invalid-feedback">
                Please Enter Name.
              </div>
            </div>
          </div>
</div>
<div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="description" <?php if($group_description):?>class="active" <?php endif; ?>>Description</label>
            <div class="input-group">
              <?php echo form_input(array_merge($group_description, ['class' => "validate"])); ?>
              <div class="invalid-feedback">
                Please Enter Last Name
              </div>
            </div>
          </div>
        </div>
<div class="form-row">
  <label >Permissions</label>
          <div class="col-md-6 mb-3">
            
            <?php foreach ($allPermissions as $permission): ?>
            <div class="input-group">
              <input type="checkbox" name="permissions[]" value="<?php echo $permission->permission_name?>" id="<?php echo $permission->permission_name?>" class="filled-in chk-col-pink" <?php echo in_array($permission->permission_name, $permissions)?'checked':''?>>
                                   <label for="<?php echo $permission->permission_name?>"><?php echo $permission->description ?></label>
            </div>
            <?php endforeach ?>
          </div>
        </div>
          
        <button class="btn btn-primary d-block float-right" type="submit">Save and Continue</button>
      </form>
    </div>
  </div>
</div>
