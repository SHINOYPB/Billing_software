 <!-- Sidebar Navigation Left -->
 <aside id="ms-side-nav" class="side-nav fixed ms-aside-scrollable ms-aside-left">

   <!-- condition for subhead show class setting -->
   <?php
    if (isset($subhead)) {
    } else {
      $subhead = '';
    }

    ?>
   <!-- Logo -->
   <div class="logo-sn ms-d-block-lg" style="padding-bottom: 0px;">
     <a class="pl-0 ml-0 text-center" href="<?php echo base_url('Admin/index'); ?>">
       <!-- <img src="<?php echo base_url('assets/admin/assets/img/dashboard/anymedion_logo.png') ?>" alt="logo"> </a> -->
   </div>

   <!-- Navigation -->
   <ul class="accordion ms-main-aside fs-14" id="side-nav-accordion">

     <!-- Dashboard -->
     <li class="menu-item">
       <a href="<?php echo base_url('Admin/index'); ?>" class="" aria-expanded="false" aria-controls="dashboard">
         <span><i class="material-icons fs-16">dashboard</i>Dashboard </span>
       </a>
     </li>
     <!-- /Dashboard -->


     <!--Administrators-->
     <!-- <li class="menu-item">
       <a href="#" class="has-chevron  <?= $menu_active == 'administrator' ? 'active' : ''; ?>" data-toggle="collapse" data-target="#order-page" aria-expanded="false" aria-controls="order-page">
         <span><i class="flaticons flaticon-user"></i>Administrator</span>
       </a>
       <ul id="order-page" class="collapse <?= $menu_active == 'administrator' ? 'show' : ''; ?> " aria-labelledby="order-page" data-parent="#side-nav-accordion">
         <li> <a <?= $sub_menu_active == 'lists' ? 'class="active "' : ''; ?> href="<?php echo base_url('auth/');  ?>">Administrator List</a> </li>
         <li> <a href="<?php echo base_url('auth/create_user');  ?>">Create Administrator</a> </li>
         <li> <a <?= $sub_menu_active == 'group_list' ? 'class="active "' : ''; ?> href="<?php echo base_url('auth/groups');  ?>">Group List</a> </li>
         <li> <a href="<?php echo base_url('auth/create_group');  ?>">Create Group</a> </li>
       </ul>
     </li> -->
     <!-- /Administrators -->


     <!--Billing-->
     <li class="menu-item">
       <a href="#" class="has-chevron  <?= $menu_active == 'billing' ? 'active' : ''; ?> " data-toggle="collapse" data-target="#Billing" aria-expanded="false" aria-controls="invoice">
         <i class="fa fa-list-alt" aria-hidden="true"></i>Billing Management</span>
       </a>
       <ul id="Billing" class="collapse <?= $menu_active == 'billing' ? 'show' : ''; ?> " aria-labelledby="Billing" data-parent="#side-nav-accordion">
         <li> <a <?= $sub_menu_active == 'create_billing' ? 'class="active "' : ''; ?> href="<?php echo base_url('Billing/');  ?>">Create</a> </li>
        
       </ul>
     </li>
     <!-- /Billing -->
  

     <!-- Logout -->
     <li class="menu-item">
       <a href="<?php echo base_url('auth/logout')?>" class=""  aria-expanded="false" aria-controls="basic-elements">
         <span><i class="fa fa-power-off"></i>log out</span>
       </a>
     </li>
      <!-- /Logout -->


   </ul>


 </aside>

 <!-- Sidebar Right -->
 <aside id="ms-recent-activity" class="side-nav fixed ms-aside-right ms-scrollable">

   <div class="ms-aside-header">
     <ul class="nav nav-tabs tabs-bordered d-flex nav-justified mb-3" role="tablist">
       <li role="presentation" class="fs-12"><a href="#activityLog" aria-controls="activityLog" class="active" role="tab" data-toggle="tab"> Activity Log</a></li>
       <li role="presentation" class="fs-12"><a href="#recentPosts" aria-controls="recentPosts" role="tab" data-toggle="tab"> Settings </a></li>
       <li><button type="button" class="close ms-toggler text-center" data-target="#ms-recent-activity" data-toggle="slideRight"><span aria-hidden="true">&times;</span></button></li>
     </ul>
   </div>

   <div class="ms-aside-body">

     <div class="tab-content">

       <div role="tabpanel" class="tab-pane active fade show" id="activityLog">
         <ul class="ms-activity-log">
           <li>
             <div class="ms-btn-icon btn-pill icon btn-light">
               <i class="flaticon-gear"></i>
             </div>
             <h6>Update 1.0.0 Pushed</h6>
             <span> <i class="material-icons">event</i>1 January, 2020</span>
             <p class="fs-14">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, ula in sodales vehicula....</p>
           </li>
           <li>
             <div class="ms-btn-icon btn-pill icon btn-success">
               <i class="flaticon-tick-inside-circle"></i>
             </div>
             <h6>Profile Updated</h6>
             <span> <i class="material-icons">event</i>4 March, 2018</span>
             <p class="fs-14">Curabitur purus sem, malesuada eu luctus eget, suscipit sed turpis. Nam pellentesque felis vitae justo accumsan, sed semper nisi sollicitudin...</p>
           </li>
           <li>
             <div class="ms-btn-icon btn-pill icon btn-warning">
               <i class="flaticon-alert-1"></i>
             </div>
             <h6>Your payment is due</h6>
             <span> <i class="material-icons">event</i>1 January, 2020</span>
             <p class="fs-14">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, ula in sodales vehicula....</p>
           </li>
           <li>
             <div class="ms-btn-icon btn-pill icon btn-danger">
               <i class="flaticon-alert"></i>
             </div>
             <h6>Database Error</h6>
             <span> <i class="material-icons">event</i>4 March, 2018</span>
             <p class="fs-14">Curabitur purus sem, malesuada eu luctus eget, suscipit sed turpis. Nam pellentesque felis vitae justo accumsan, sed semper nisi sollicitudin...</p>
           </li>
           <li>
             <div class="ms-btn-icon btn-pill icon btn-info">
               <i class="flaticon-information"></i>
             </div>
             <h6>Checkout what's Trending</h6>
             <span> <i class="material-icons">event</i>1 January, 2020</span>
             <p class="fs-14">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, ula in sodales vehicula....</p>
           </li>
           <li>
             <div class="ms-btn-icon btn-pill icon btn-secondary">
               <i class="flaticon-diamond"></i>
             </div>
             <h6>Your Dashboard is ready</h6>
             <span> <i class="material-icons">event</i>4 March, 2018</span>
             <p class="fs-14">Curabitur purus sem, malesuada eu luctus eget, suscipit sed turpis. Nam pellentesque felis vitae justo accumsan, sed semper nisi sollicitudin...</p>
           </li>
         </ul>
         <a href="#" class="btn btn-primary d-block"> View All </a>
       </div>

       <div role="tabpanel" class="tab-pane fade" id="recentPosts">

         <h6>General Settings</h6>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Location Tracking</span>
           <label class="ms-switch float-right">
             <input type="checkbox">
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Allow Notifications</span>
           <label class="ms-switch float-right">
             <input type="checkbox">
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Allow Popups</span>
           <label class="ms-switch float-right">
             <input type="checkbox" checked>
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <h6>Log Settings</h6>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Enable Logging</span>
           <label class="ms-switch float-right">
             <input type="checkbox" checked>
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Audit Logs</span>
           <label class="ms-switch float-right">
             <input type="checkbox">
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Error Logs</span>
           <label class="ms-switch float-right">
             <input type="checkbox" checked>
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <h6>Advanced Settings</h6>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Enable Logging</span>
           <label class="ms-switch float-right">
             <input type="checkbox" checked>
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Audit Logs</span>
           <label class="ms-switch float-right">
             <input type="checkbox">
             <span class="ms-switch-slider round"></span>
           </label>
         </div>
         <div class="ms-form-group">
           <span class="ms-option-name fs-14">Error Logs</span>
           <label class="ms-switch float-right">
             <input type="checkbox" checked>
             <span class="ms-switch-slider round"></span>
           </label>
         </div>

       </div>

     </div>

   </div>

 </aside>

 <!-- Main Content -->
 <main class="body-content">