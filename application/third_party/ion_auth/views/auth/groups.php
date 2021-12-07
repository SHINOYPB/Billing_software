<!-- <div class="ms-panel">
    <div class="ms-panel-header">
        <h6>Groups List</h6>
    </div>
    <div class="ms-panel-body">
        <div class="table-responsive">
            <div id="data-table-4_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                <div class="row">
                    <div class="col-sm-5 ">
                        <div class="dataTables_length" id="data-table-4_length"><label>Show <select name="data-table-4_length" aria-controls="data-table-4" class="custom-select custom-select-sm form-control form-control-sm">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select> </label></div>
                    </div>
                    <div class="col-sm-5 ">
                        <div id="data-table-4_filter" class="dataTables_filter"><label><input type="search" class="form-control form-control-sm" placeholder="Search Data..." aria-controls="data-table-4"></label></div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <table id="data-table-4" class="table w-100 thead-primary dataTable no-footer" role="grid" aria-describedby="data-table-4_info" style="width: 986px;">
                            <thead>
                                <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-4" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Id: activate to sort column descending" style="width: 28px;">SI.No</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-4" rowspan="1" colspan="1" aria-label="Product Name: activate to sort column ascending" style="width: 142px;">Name</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-4" rowspan="1" colspan="1" aria-label="Return Issue: activate to sort column ascending" style="width: 130px;">Description</th>


                                    <th class="sorting" tabindex="0" aria-controls="data-table-4" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending" style="width: 69px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $offset = 1;
                                foreach ($groups as $group) {
                                ?>


                                    <tr role="row" class="odd">
                                        <td class="sorting_1"> <?php
                                                                echo $offset;
                                                                ?></td>
                                        <td> <?php echo htmlspecialchars($group->name, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td> <?php echo htmlspecialchars($group->description, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td class="center"> <?php echo anchor("auth/edit_group/" . $group->id, '<span class="new badge blue" data-badge-caption="">Edit</span>', 'data-toggle="tooltip" data-placement="top" title="Completed" '); ?>

                                            <?php echo anchor("auth/delete_group/" . $group->id, '<span class="new badge red" data-badge-caption="">Delete</span>', 'data-toggle="tooltip" data-placement="top" title="Delete" onclick="return confirm(\'Are you sure?\');"'); ?></td>

                                    </tr>
                                <?php
                                    $offset++;
                                }
                                ?>


                            </tbody>
                        </table>

                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="data-table-4_info" role="status" aria-live="polite">Showing 1 to 10 of 15 entries</div>
                    </div>
                    <div class="col-sm-12 col-md-7">

                    </div>
                </div>
            </div>
        </div>
    </div>

</div> -->




<!-- body-wrapper -->
<div class="ms-content-wrapper">
    <div class="row">

        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pl-0">
                    <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Administrator</a></li>

                    <li class="breadcrumb-item active" aria-current="page">Group List</li>
                </ol>
            </nav>
        </div>
        <div class="col-xl-12 col-md-12">
            <div class="ms-panel ms-panel-fh">
                <div class="ms-panel-header">
                    <h6>Group List</h6>
                </div>
                <div class="ms-panel-body">

                    <div class="table-responsive">
                        <table class="table thead-primary">
                            <thead>
                                <tr>
                                    <th scope="col">Sl.No</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Action</th>
                                   
                                </tr>
                            </thead>

                            <tbody>
                                <?php
                                $offset = 1;
                                foreach ($groups as $group) {
                                ?>


                                    <tr role="row" class="odd">
                                        <td class="sorting_1"> <?php
                                                                echo $offset;
                                                                ?></td>
                                        <td> <?php echo htmlspecialchars($group->name, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td> <?php echo htmlspecialchars($group->description, ENT_QUOTES, 'UTF-8'); ?></td>
                                        <td class="center"> <?php echo anchor("auth/edit_group/" . $group->id, '<span class="new badge blue" data-badge-caption="">Edit</span>', 'data-toggle="tooltip" data-placement="top" title="Completed" '); ?>

                                            <?php echo anchor("auth/delete_group/" . $group->id, '<span class="new badge red" data-badge-caption="">Delete</span>', 'data-toggle="tooltip" data-placement="top" title="Delete" onclick="return confirm(\'Are you sure?\');"'); ?></td>

                                    </tr>
                                <?php
                                    $offset++;
                                }
                                ?>


                            </tbody>

                        </table>
                    </div>



                </div>
            </div>
        </div>
    </div>
</div>