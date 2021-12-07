<div class="ms-panel">
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
		<h6>ALL HOmepage sections</h6>
	</div>
	<div class="ms-panel-body">
		<div class="table-responsive">
			<div id="data-table-4_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

				<div class="row">

					
				</div>

				<div class="row">
					<input type="hidden" id="base" value="<?php echo base_url(); ?>">
					<div class="col-sm-12">
						<table id="newtable33"  class=" table thead-primary cell-border" role="" aria-describedby="" style="width: 700px;">
							<thead>
								<tr role="row">
									<th >Sl.No</th>
									<th>Section Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>

					</div>
				</div>
				<input type="hidden" id="search_url" value="<?php echo base_url('/Homepage/loadSections'); ?>" />
				<input type="hidden" id="active_url" value="<?php echo base_url('/Homepage/editSections/'); ?>" />
                <input type="hidden" id="delete_url" value="<?php echo base_url('/LabServices/deleteTest/'); ?>" />
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	
	window.onload = function() 
    {
		ajaxLoad();
	}


	//EASYHOUZ INTEGRATION

	function ajaxLoad()
    {
		if ($('#search_url')[0]) 
		{
	
 			var url = $('#search_url').val();
 			var active_url = $('#active_url').val();
            var delete_url = $('#delete_url').val();
			 	
 			//	$('#datatable17').DataTable().destroy();

 			table = $('#newtable33').DataTable({
 				serverSide: true,
				searching:false,
				ajax: 
				{
 					url: url,
 					method: 'POST',
 					
					dataFilter: function(data) 
					{
 						var json = jQuery.parseJSON(data);
 						json.recordsTotal = json.total_rows;
 						json.recordsFiltered = json.total_rows;
 						json.data = json.list;

 						return JSON.stringify(json); // return JSON string
 					}
 				},

 				columnDefs: 
				[{
 						orderable: false,
 						targets: [0, 1, 2]
 					},
 					{
 						"targets": 2,
 						"mRender": function(data) {

 							return '<a  data-toggle="tooltip" href="'+active_url+data+'" data-placement="top"  title="ADD"  class="btn btn-success btn-sm"  >Edit</a><a  data-toggle="tooltip" href="'+delete_url+data+'" data-placement="top"  title="ADD"  class="btn btn-danger btn-sm"  >Delete</a>';

 						}
 					},

					
 				]
 			});
 		
		}

		
	}
	
</script>