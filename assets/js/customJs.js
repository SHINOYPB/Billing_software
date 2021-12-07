window.onload = function()
{


	/* GENERAL JAVASCRIPT HERE  */
	$('.thead-primary').addClass('cell-border')
	$('#myTableDiv2').hide();
    /* GENERAL JAVASCRIPT ENDS HERE  */


	

												/* ORDER MANAGEMENT  */

	$('#datatable20').hide();
	$('#myTableDiv').hide();
	$('.temp1').hide();
	//DETAILED ORDER VIEW
	
    //LOAD PRODUCT_type  SELECT BOX AT LOAD
    $.ajax
    ({
            type: 'POST',
            url: surl + 'Order/ajax_load',

            success: function (data) {
                var ndata = JSON.parse(data);


                if (ndata.return == true) {
                    var myOptions = ndata.a;

                    var mySelect = $('#selectbox1');

                    myOptions.forEach(function (data) {
                        mySelect.append($('<option></option>').val(data.id).html(data.name));
                    });

                }
                else if (ndata.return == false) {
                    $('.error').text(ndata.message);
                }
                else {
                    $('.error').text('something went wrong');
                }

            },
            error: function () {
                $('.error').text('something went wrong');
            }

        });

		
    //PRODUCT NAMES LOAD
    function nameload() {
        $('#selectbox2').empty();
        var pdtTypeId = $("#selectbox1").val();
        $.ajax({
            type: 'POST',
            url: surl + 'Order/product_load',
            data: {
                id: pdtTypeId
            },
            success: function (data) {
                var ndata = JSON.parse(data);

                if (ndata.return == true) {
                    var myOptions = ndata.a;

                    var mySelect = $('#selectbox2');
                    mySelect.append($('<option></option>').val("").html("Select Product"));
                    myOptions.forEach(function (data) {

                        mySelect.append($('<option></option>').val(data.id).html(data.name + '-->'+ data.price));
                    });

                }
                else if (ndata.return == false) {
                    $('.error').text(ndata.message);
                }
                else {
                    $('.error').text('something went wrong');
                }

            },
            error: function () {
                $('.error').text('not return json data');
            }

        });

    }

    $(".load").on("change", nameload);

    $('#selectbox2').select2();
    $('#selectbox1').select2();




										/*  WHOLESALE MANAGEMENT   */
										/*  ORDER PRODUCT   */


	//LOAD PRODUCT SELECT BOX AT LOAD

		$.ajax({
			type: 'POST',
			url: surl + 'Vendor/ajax_load',

			success: function (data)
			{
				var ndata = JSON.parse(data);


				if (ndata.return == true)
				{
					var myOptions = ndata.a;

					var mySelect = $('#mySelectWholesale');

					myOptions.forEach(function(data)
					{
						mySelect.append(  $('<option></option>').val(data.id).html(data.name ) );
					});

				}
				else if (ndata.return == false)
				{
					$('.error').text(ndata.message);
				}
				else
				{
					$('.error').text('something went wrong');
				}

			},
			error: function ()
			{
				$('.error').text('something went wrong');
			}

		});


	//PRODUCT DETAIL WITH PRICE -> BUTTON CLICK

	$('.add_medicine').on('click',function ()
		{
			$('#wholeSelect').empty();
			var medicineId = $("#mySelectWholesale").val();

			$.ajax({
				type: 'POST',
				url: surl + 'Vendor/wholeSaleLoad',
				data: {
					id: medicineId
				},
				success: function (data)
				{
					var ndata = JSON.parse(data);

					if (ndata.return == true)
					{
						var myOptions = ndata.a;

						var mySelect = $('#wholeSelect');

						myOptions.forEach(function(data)
						{
							mySelect.append( $('<option></option>').val(data.id).html(data.price+data.name) );
						});

					}
					else if (ndata.return == false)
					{
						$('.error').text(ndata.message);
					}
					else
					{
						$('.error').text('something went wrong');
					}

				},
				error: function ()
				{
					$('.error').text('not return json data');
				}

			});

		});


	//ADD SELECTED PRODUCT IN THIRD COLUMN 

		$('#addr').on('click',function ()
		{
			//wholeSelect =         vendor details select box
			//mySelectWholesale =   product select box


			//ADD SELECTED DATA TO FORM SECTION IN COLUMN 3
			var vendor_pdt_id = $("#wholeSelect").val();
			var medicineName = $("#mySelectWholesale").children("option:selected").html(); //
			console.log(vendor_pdt_id);  // vendor_product table id
			console.log(medicineName); // medicine name


			var sp_count = $('.sp_cn1').length;
			alert(sp_count);
			var items = "";
			// items += "<div class='form-group contspecvalue1 rmov1" + sp_count + "'>";
			// items += "<input type='text' id='inpout"+sp_count+"' name='value[]' class='form-control sp_cn1' placeholder='Spec value'>";
			// items += "<a href='javascript:void(0)' class='remov_spec1' data-id=" + sp_count + ">-</a>";
			// items += "</div>";

			items += "<div class='form-group contspecvalue1 rmov1" + sp_count + "'>";
			items += "<select  id='inpout"+sp_count+"' name='value[]' class='form-control sp_cn1' >";
			items += "</select>";
			items += "<a href='javascript:void(0)' class='remov_spec1' data-id=" + sp_count + ">-</a>";
			items += "</div>";


			$('.htmlitem').append(items);
			//$('#inpout'+sp_count).val(medicineName);

			var mySelect1 = $('#inpout'+sp_count);
			mySelect1.append( $('<option></option>').val(vendor_pdt_id).html(medicineName) );


			//$('#inpout'+sp_count).attr('myval',vendor_pdt_id);
			//$('#inpout'+sp_count).val(vendor_pdt_id);



			//CLEAR SELECT FIELDS AT LAST
			$('#wholeSelect').empty()



				// var mySelect1 = $('#inpout'+counts);
				// mySelect1.append( $('<option></option>').val(vendor_pdt_id).html(whole_name_price) );
			//$('.htmlitemm').append(items);
			// $('#inpout'+counts).val(whole_name_price);


		});

	//REMOVE ADDED PRODUCT FROM THIRD COLUMN 
		$('body').on("click", ".remov_spec1", function ()
		{
			var crnt = $(this).data('id');
			alert(crnt);
			$('.rmov1' + crnt).remove();
		});




								/* CATEGORY MANAGEMENT  */

								  /* ADD CATEGORY  */

	//LOAD CATEGORY SELECT BOX AT LOAD
		$.ajax({
			type: 'POST',
			url: surl + 'Category_pdt/ajax_load',

			success: function (data)
			{
				var ndata = JSON.parse(data);

				if (ndata.return == true)
				{
					var myOptions = ndata.a;

					var mySelect = $('#mySelect1');

					myOptions.forEach(function(data)
					{
						mySelect.append(  $('<option></option>').val(data.id).html(data.name) );
					});

				}
				else if (ndata.return == false)
				{
					$('.error').text(ndata.message);
				}
				else
				{
					$('.error').text('something went wrong');
				}

			},
			error: function ()
			{
				$('.error').text('something went wrong');
			}

		});

							   /* ASSIGN CATEGORY TO PRODUCT  */

	//SECTION ONE SELECT BOX LOAD

		$.ajax({
			type: 'POST',
			url: surl + 'Category_pdt/fetchProductType',

			success: function (data)
			{
				var ndata = JSON.parse(data);


				if (ndata.return == true)
				{
					var myOptions = ndata.a;

					var mySelect = $('#myPdtSelectBox1');

					myOptions.forEach(function(data)
					{
						mySelect.append(  $('<option></option>').val(data.id).html(data.name ) );
					});

				}
				else if (ndata.return == false)
				{
					$('.error').text(ndata.message);
				}
				else
				{
					$('.error').text('something went wrong');
				}

			},
			error: function ()
			{
				$('.error').text('something went wrong');
			}

		});

	// product type select box text change funtion for loading products in second combo box

		$('#myPdtSelectBox1').on('change',function ()
		{
			
			$('#myPdtSelectBox').empty();
           	//SECTION TWO SELECT BOX LOAD
			var prodTypeId = $('#myPdtSelectBox1').find(":selected").val();

			$.ajax({
				type: 'POST',
				url: surl + 'Category_pdt/fetchProduct',
				data:{

					id: prodTypeId
				},
				success: function (data)
				{
					var ndata = JSON.parse(data);


					if (ndata.return == true)
					{
						var myOptions = ndata.a;

						var mySelect = $('#myPdtSelectBox');
						mySelect.append(  $('<option></option>').val('').html('Select Product') );
						myOptions.forEach(function(data)
						{
							mySelect.append(  $('<option></option>').val(data.id).html(data.name ) );
						});

					}
					else if (ndata.return == false)
					{
						$('.error').text(ndata.message);
					}
					else
					{
						$('.error').text('something went wrong');
					}

				},
				error: function ()
				{
					$('.error').text('something went wrong');
				}

			});

		});


		$('#myPdtSelectBox').on('change',function ()
			{

				$('#wholeSelect1').empty();
				var medicineId = $("#myPdtSelectBox").val();


				$.ajax({
					type: 'POST',
					url: surl + 'Category_pdt/getCategories',

					success: function (data)
					{
						var ndata = JSON.parse(data);


						if (ndata.return == true)
						{
							var myOptions = ndata.a;

							var mySelect = $('#wholeSelect1');
							mySelect.append(  $('<option></option>').val('').html('Select Category') );
							myOptions.forEach(function(data)
							{
								mySelect.append( $('<option></option>').val(data.id).html(data.name) );
							});

						}
						else if (ndata.return == false)
						{
							$('.error').text(ndata.message);
						}
						else
						{
							$('.error').text('something went wrong');
						}

					},
					error: function ()
					{
						$('.error').text('not return json data');
					}

				});


		});


		$('body').on("click", ".remov_spec2", function ()
		{
			var crnt = $(this).data('id');
			alert(crnt);
			$('.rmov2' + crnt).remove();
		});

	
		$('body').on("click", ".remove4", function ()
		{
			var crnt = $(this).data('id');
			$('.' + crnt).remove();
		});
	

		$('#wholeSelect1').on('change',function ()
		{
			$('#myTableDiv2').show();
			var product_id = $("#myPdtSelectBox").val();
			var pdt_type_id = $("#myPdtSelectBox1").val();
			var categoryId = $("#wholeSelect1").val();
			var category_name = $("#wholeSelect1").children("option:selected").html();
			var product_name = $("#myPdtSelectBox").children("option:selected").html();

			$('#myTable1 tbody').append('<tr>');
			$('#myTable1 tbody').append('<td class="' + categoryId + '">' + product_name + '</td>');
			$('#myTable1 tbody').append('<td class="' + categoryId+ '">' + category_name + '</td>');
			$('#myTable1 tbody').append('<td class="' + categoryId + '"><a class="btn-xs btn-danger  remove4" href="#" style="border-radius:5px;" data-id="'+categoryId+'" >Remove</a></td>');
			$('#myTable1 tbody').append('<input type="hidden" class="' + categoryId + '" value="' + categoryId + '" name="catId[]">');
			$('#myTable1 tbody').append('<input type="hidden" class="' + categoryId + '" value="' + product_id + '" name="pdt_id">');
			$('#myTable1 tbody').append('<input type="hidden" class="' + categoryId + '" value="' + pdt_type_id + '" name="pdt_type_id">');
			
		});

	

		/* Product Mangement */
		/* Allopathy */

		//Add products section

			
	/*	$('body').on("click", "#add11", function ()
		{
					var i = 1;
							
					alert("clicked");
					$('#dynamic_field').append('<tr id="row' + i + '" class="dynamic-added"><div class="input-field col s12" ><td><select data-placeholder="Choose category ..." id="category_id' + i + '"   name="category_id[]" class="chosen-select' + i + ' form-control" style="width: 300px;"><option value="">Choose Category</option><?php foreach ($categories as $category) { ?><option value="<?= $category->id ?>"><?= $category->name ?></option><?php  } ?></select></td><td><select data-placeholder="Choose Location ..."  id="locations' + i + '" class="chosen-select' + i + ' form-control" style="width: 300px;"><option value="">Choose Location</option><?php foreach ($categories as $category) { ?><option value="<?= $category->id ?>"><?= $category->name ?></option><?php  }?></select></td><td><select data-placeholder="Choose category ..." id="professional_id' + i + '"   name="professional_id[]" class="chosen-select' + i + '  form-control" style="width:250px;"><option value="">Choose Professional</option><!--<?php foreach ($categories  as $category) { ?><option value="<?= $category->id ?>"><?= $value->name ?></option><?php  }?>--></select></td><td><button type="button" name="remove" id="' + i + '" class="btn btn-danger btn_remove">X</button></td><label for="datedurationrequired">Date Duration Required</label></div></tr>');
		});*/
		
}









