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
              	@include('form.a',[
						'href'=> url('/inventory/items_satuan/add_form').'?id='.$items->id,
						'class'=>'pull-right',
						'caption' => 'Tambah' 
					])
              	<input type="hidden" name="item_id" id="item_id" value="{{ is_null($request->id) ? '' : $items->id }}" />
              	<h3 class="page-title"> Satuan : 
				<strong><span class="text-uppercase">
						@if($request->id)
							{{ $items->name }}
						@else
							semua data barang
						@endif
				</span></strong>
			</h3>
              	@include('inventory::items_satuan.datatable')

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
			gentable = $('#table_data').DataTable(
			{
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

			$('#project_idcheck').change(function()
			{
				console.log($(this).val());
			});

			$(".delete-link").click(function() {
		var id = $(this).attr("id");
		var del_id = id;
		var parent = $(this).parent("td").parent("tr");
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm Delete ?',
			icon: 'fa fa-warning',
			content: 'Are you sure delete Key ID ' +del_id+ ' !',
			autoClose: 'cancelAction|8000',
			buttons: {
				deleteUser: {
					text: 'Delete',
					btnClass: 'btn-red any-other-class',
					action: function () {
						$.post("{{ url('/inventory/items/delete') }}", 
						{
							id:del_id,
							_token: token
						}, 
						function(data) {
							parent.fadeToggle('fast');
						});	
						
						$("#div_message").html('<div class="custom-alerts alert alert-warning fade in">Sucessfully delete on '+ formattedtoday +'</div>');
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
						$(".content-loader").load('{{ url('items/edit_form') }}'+'?id='+edit_id, function() {
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
	
	$(".harga-link").click(function() {
		var id = $(this).attr("id");
		var view_id = id;
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm Create Harga ?',
			icon: 'fa fa-pencil-square',
			content: 'Are you sure Create Harga Key ID '+view_id+ ' !',
			autoClose: 'cancelAction|8000',
			buttons: {
				deleteUser: {
					text: 'Create',
					btnClass: 'btn green',
					action: function () {
						$("#div_content_page").fadeToggle('fast');
						$("#div_content_page").load('{{ url('items_price/index') }}'+'?id='+view_id, function() {
							$("#div_content_page").fadeIn('fast');
						});
					}
				},
				cancelAction: function () {
					
				}
			}
		});
		return false;
	});
	
	$(".satuan-link").click(function() {
		var id = $(this).attr("id");
		var view_id = id;
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm Create Satuan ?',
			icon: 'fa fa-pencil-square',
			content: 'Are you sure Create Satuan Key ID '+view_id+ ' !',
			autoClose: 'cancelAction|8000',
			buttons: {
				deleteUser: {
					text: 'Create',
					btnClass: 'btn green',
					action: function () {
						$("#div_content_page").fadeToggle('fast');
						$("#div_content_page").load('{{ url('items_satuan/index') }}'+'?id='+view_id, function() {
							$("#div_content_page").fadeIn('fast');
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
</body>
</html>
