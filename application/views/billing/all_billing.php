
<!-- body-wrapper -->
<div class="ms-content-wrapper">
    <div class="row">

        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pl-0">
                    <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i>Bill Management</a></li>
                                        

                    <li class="breadcrumb-item active" aria-current="page">Invoice List View</li>
                </ol>
            </nav>
        </div>
        <div class="col-xl-12 col-md-12">
            <div class="ms-panel ms-panel-fh">
                <div class="ms-panel-header">
                    <h6>Invoice List View</h6>
                </div>
                <div class="ms-panel-body">

                  
                <div id="data-table-4_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
        <div class="row">


          <!-- SEARCH FILTER , SETS HIDDEN - NOW NOT NEEDED-->
          <div>
            <!-- Gender -->
            <select id='sel_gender' hidden>
              <option value=''>-- Select Gender --</option>
              <option value='male'>Male</option>
              <option value='female'>Female</option>
            </select>
            <!-- Name -->
            <input type="hidden" id="searchName" placeholder="Search Name">
          </div>

          <!-- /SEARCH FILTER , SETS HIDDEN - NOW NOT NEEDED-->



        </div>
        <div class="row">
          <div class="col-sm-12">
            <table id="datatable5" class="table w-100 thead-primary dataTable no-footer" role="grid" aria-describedby="data-table-4_info" style="width: 986px;">
              <thead>
                <tr>
                  <th>Sl.No</th>
                  <th>INVOICE NO</th>
                  <th>CUSTOMER NAME</th>
                  <th>PHONE</th>
                  <th>AMOUNT</th>
                  <th>INVOICE DATE</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <input type="hidden" id="view_url" value="<?php echo base_url('/Billing/InvDetailView/'); ?>" />
        
        </div>
      </div>


                </div>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
  window.onload = function() {

    ajaxLoad();
  }

  function ajaxLoad() { //Load Timing to table

    var view_url = $('#view_url').val();
   
    //	$('#datatable17').DataTable().destroy();

    table = $('#datatable5').DataTable({
      serverSide: true,
      searching: false,
      processing: true,
      pagination: true,
      ajax: {
        url: '<?php echo site_url("Billing/InvoiceLIst") ?>',
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

      columnDefs: [{
          orderable: false,
          targets: [0, 1, 2, 3, 4, 5,6]
        },
        {
          "targets": 6,
          "mRender": function(data) {

            return '<a class="delete_category btn-sm btn-primary" target="_blank" data-toggle="tooltip" href="' + view_url + data + '" data-placement="top" title="Delete">View</a>   ';

          }
        },


      ]
    });

  }
</script>