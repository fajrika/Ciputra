<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin QS | Dashboard</title>
  @include("master/header")
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  @include("master/sidebar_project")

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>{{ $project->name }}</h1>

    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
             <ul class="breadcrumb">
                  <li>
                      <a href="{{ url('/inventory/inventory/stock/view_stock') }}">Inventory</a>
                  </li>
                  <li>
                       <a href="{{ url('/inventory/items/index') }}">Barang</a>
                  </li>
                  <li>
                  	<span>Satuan {{ $items->name }}</span>
                  </li>
              </ul>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="col-md-12">
              	<strong><span class="text-uppercase">
					@if($request->id)
						{{ $items->name }}
					@else
						semua data barang
					@endif
			</span></strong>
			@include('items_price.datatable')
</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
@include("master/footer_table")
@include('pluggins.alertify')
	<script type="text/javascript" charset="utf-8">
		var gentable = null;
		$(document).ready(function() {
			gentable = $('#table_data').DataTable({
				"columnDefs": [
            		{ "visible": false, "targets": 1 }
		        ],
		        "order": [[ 1, 'asc' ]],
		        "drawCallback": function ( settings ) {
			            var api = this.api();
			            var rows = api.rows( {page:'current'} ).nodes();
			            var last=null;
			 
			            api.column(1, {page:'current'} ).data().each( function ( group, i ) {
			                if ( last !== group ) {
			                    $(rows).eq( i ).before(
			                        '<tr class="success group"><td colspan="5" style="text-align:left;padding:10px;"><strong>'+group+'</strong></td></tr>'
			                    );
			 
			                    last = group;
			                }
			            } );
        		}
			});
			

			var token = $('input[name=_token]').val();
	$(".delete-link").click(function() {
		var id = $(this).attr("id");
		var tParent = $(this).parents("tr");
		var data = gentable.row(tParent).data();
		$.confirm({
			title: 'Confirm Delete ?',
			icon: 'fa fa-warning',
			content: 'Are you sure delete "' +data[1]+ '" ?',
			autoClose: 'cancelAction|8000',
			buttons: {
				deleteUser: {
					text: 'Delete',
					btnClass: 'btn-red any-other-class',
					action: function () {
						$.post('{{ url('items_price/delete') }}', 
						{
							id:id,
							_token: token
						}, 
						function(data) {
							if(data)
							{
								alertify.success('success deleted!',3);
								$("#div_content_page").load("{{ url('items_price/index') }}"+'?id='+item_id);
								
							}
							
						});	
					}
				},
				cancelAction: function () {
					
				}
			}
		});
		return false;
	});
	
	$(".edit-link").click(function() {
		var id = $(this).attr("id");
		var edit_id = id;
		var item_id = $("#item_id").val().trim();
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm Edit ?',
			icon: 'fa fa-edit',
			content: 'Are you sure edit Key ID '+edit_id+ ' !',
			autoClose: 'cancelAction|8000',
			buttons: {
				deleteUser: {
					text: 'Edit',
					btnClass: 'btn btn-info',
					action: function () {
						$(".content-loader").fadeToggle('fast');
						$(".content-loader").load('{{ url('items_price/edit_form') }}'+'?id='+edit_id, function() {
							$(".content-loader").fadeIn('fast');
							
							$("#btn-add").hide();
							$("#btn-view").show();
						});
					}
				},
				cancelAction: function () {
					
				}
			}
		});
		return false;
	});
		});
	</script>
</div>
