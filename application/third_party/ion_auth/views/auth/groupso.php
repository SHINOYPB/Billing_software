<!-- Basic Table -->
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    <?php echo 'Groups'; ?>
                    <small><?php echo 'Below is the list of groups'; ?></small>
                </h2>
                <ul class="header-dropdown m-r--5">
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="material-icons">more_vert</i>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="javascript:void(0);">Action</a></li>
                            <li><?php echo anchor('auth/create_group', lang('index_create_group_link')) ?></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="body table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sl.No</th>
                            <th>Name</th>
                            <th>Descripton</th>
                            <th><?php echo lang('index_action_th'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <?php 
                            $offset=1;
                            foreach ($groups as $group): ?>
                            <tr>
                                <td><?php echo $offset;?></td>
                                <td><?php echo htmlspecialchars($group->name, ENT_QUOTES, 'UTF-8'); ?></td>
                                <td><?php echo htmlspecialchars($group->description, ENT_QUOTES, 'UTF-8'); ?></td>
                                <!--<td><?php echo anchor("auth/edit_group/" . $group->id, 'Edit'); ?><br /></td>-->
                                 <td>
                                    <?php echo anchor("auth/edit_group/" . $group->id, '<i class="material-icons">edit</i>', 'data-toggle="tooltip" data-placement="top" title="Edit"'); ?>
                                    <?php echo anchor("auth/delete_group/" . $group->id, '<i class="material-icons">delete</i>', 'data-toggle="tooltip" data-placement="top" title="Delete" onclick="return confirm(\'Are you sure?\');"'); ?>
                                </td>
                            </tr>
                        <?php
                        $offset++;
                        endforeach; ?>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- #END# Basic Table -->