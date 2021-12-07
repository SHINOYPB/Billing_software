$(function () {
    searching();
});
function searching() {
    if ($('#search_url')[0]) {
        var url = $('#search_url').val();
        // var delete_url = $('#delete_url').val();
        // var edit_url = $('#edit_url').val();
        var running_url = $('#running_url').val();
         var delivered_url = $('#delivered_url').val();
        var data = {};
        if($('#search_field').length){
            var x = $("#search_field").serializeArray();
            $.each(x, function(i, field){
                data[field.name] = field.value;
            });
        }
        table = $('.js-basic-example').DataTable({
            serverSide: true,
            ajax: {
                url: url,
                method: 'POST',
                data: data,
                dataFilter: function (data) {
                    var json = jQuery.parseJSON(data);
                    json.recordsTotal = json.total_rows;
                    json.recordsFiltered = json.total_rows;
                    json.data = json.list;

                    return JSON.stringify(json); // return JSON string
                }
            },
            columnDefs: [
                {orderable: false, targets: [0, 1, 2, -1, -2, -3]},
                {
                    "targets": -1,
                    "mRender": function (data) {
                        return '<a href="'+running_url+data+'" data-toggle="tooltip" data-placement="top" title="Running"><i class="material-icons">cached</i></a>'+
                           '<a href="'+delivered_url+data+'" data-toggle="tooltip" data-placement="top" title="Delivered"><i class="material-icons">done_all</i></a>';
                    }
                }]
        });
    }
}