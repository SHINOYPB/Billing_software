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
                    <h6>Administrator List</h6>
                </div>
                <div class="ms-panel-body">


                    <div class="table-responsive">
                        <table class="table thead-primary">
                            <thead>
                                <tr>
                                    <th scope="col"><?php echo lang('index_fname_th'); ?></th>
                                    <th scope="col"><?php echo lang('index_lname_th'); ?></th>
                                    <th scope="col"><?php echo lang('index_email_th'); ?></th>
                                    <th scope="col"><?php echo lang('index_groups_th'); ?></th>
                                    <th scope="col"><?php echo lang('index_status_th'); ?></th>
                                    <th scope="col"><?php echo lang('index_action_th'); ?></th>
                                </tr>
                            </thead>

                            <tbody>

                                <?php foreach ($users as $user) :  ?>

                                    <tr role="row" class="odd">

                                        <td><?php echo htmlspecialchars($user->first_name, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td><?php echo htmlspecialchars($user->last_name, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td><?php echo htmlspecialchars($user->email, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td>
                                            <?php foreach ($user->groups as $group) : ?>
                                                <?php echo anchor("auth/edit_group/" . $group->id, htmlspecialchars($group->description, ENT_QUOTES, 'UTF-8')); ?><br />
                                            <?php endforeach ?>
                                        </td>
                                        <td><?php echo ($user->active) ? anchor("auth/deactivate/" . $user->id, lang('index_active_link')) : anchor("auth/activate/" . $user->id, lang('index_inactive_link')); ?></td>
                                        <td><?php echo anchor("auth/edit_user/" . $user->id, 'Edit'); ?></td>



                                    </tr>
                                <?php endforeach; ?>

                            </tbody>

                        </table>
                    </div>



                </div>
            </div>
        </div>
    </div>
</div>