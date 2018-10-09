@include('pluggins.alertify')
<div id="div_content_page">
	<div class="portlet-body">
		<div class="page-bar">
	        <ul class="page-breadcrumb">
	            <li>
	                <a href="#">Master Data</a>
	                <i class="fa fa-arrow-circle-right"></i>
	            </li>
	            <li>
	                <span>Member</span>
	            </li>
	        </ul>
	        <div class="page-toolbar">
	            <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
	                <i class="icon-calendar"></i>&nbsp;
	                <span class="thin uppercase hidden-xs"></span>&nbsp;
	                <i class="fa fa-angle-down"></i>
	            </div>
	        </div>
	    </div>
		<h3 class="page-title">
			{{ $projectname }}
		</h3>
		<hr />
			@include('form.refresh')
		

		<div class="content-loader">
			<br/>
			<br/>
			<div class="panel panel-success">
		 		<div class="panel-heading"><strong>Member</strong> </div>
			 	<div class="panel-body">
					<ul class="nav nav-tabs" id="myTabs">
					  <li role="presentation" class="active">
					  	<a href="#tab_list" data-toggle="tab">List</a>
					  </li>
					  <li role="presentation">
					  	<a href="#tab_add" data-toggle="tab">Tambah</a>
					  </li>
					</ul>

					<br/>
					<div class="tab-content">
						  <div id="tab_list" class="tab-pane fade in active">
								<table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column nowrap table_master" id="table_data">
									<thead>
										<tr>
											<th>#</th>
											<th>Nama</th>
											<th>Deskripsi</th>
											<th>Created At</th>
											<th>Updated At</th>
											<th></th>
										</tr>
									</thead>
								</table>
							</div>

							<div id="tab_add" class="tab-pane fade">
								<form action="{{ url('/member/store') }}" method="post" class="form-horizontal form-label-left" id="form_data" autocomplete="off">
									<div class="item form-group">
									    <label class="control-label col-md-3 col-sm-3 col-xs-12">Nama</label>
									    <div class="col-md-5 col-sm-5 col-xs-12">
									    	{{ csrf_field() }}
									    	<input type="hidden" name="id" id="id" />
									    	<input type="text" class="form-control" name="name" id="name" />
									    </div>
								  	</div>

								  	<div class="item form-group">
									    <label class="control-label col-md-3 col-sm-3 col-xs-12">Deskripsi</label>
									    <div class="col-md-5 col-sm-5 col-xs-12">
									    	<textarea id="description" name="description" cols="20" rows="3" class="form-control"></textarea>
									    </div>
								  	</div>

								  	
								  	<div class="ln_solid"></div>
									<div class="form-group">
										<div class="col-md-6 col-md-offset-3">
											<button id="send" type="submit" class="btn btn-success"><i class="fa fa-save"></i> Simpan</button>
											
										</div>
									</div>
								</form>
							</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<br />



</div>
<script type="text/javascript">
	var gentable = null;
	$(document).ready(function() {
		var token = $('input[name=_token]').val();
		gentable = $('#table_data').DataTable({
			scrollY:        "300px",
	        scrollCollapse: true,
	        paging:         false,
			  processing: true,
	          ajax: "{{ url('/member/getData') }}",
	          columns:[
	                 { data: 'no',name: 'no',"bSortable": true},
	                 { data: 'name',name: 'name',"bSortable": false},
					 { data: 'remarks',name: 'remarks',"bSortable": false},
	                 { data: 'created_at',name: 'created_at',"bSortable": false},
	                 { data: 'updated_at',name: 'updated_at',"bSortable": false},
	                {
	                  "className": "action text-center",
	                  "data": null,
	                  "bSortable": false,
	                  "defaultContent": "" +
	                  "<div class='' role='group'>" +
	                  
	                  "<button class='delete btn btn-danger btn-xs' rel='tooltip' data-toggle='tooltip' data-placement='right' title='Hapus'><i class='fa fa-trash-o'></i></button>" +
	                  "<button class='edit btn btn-primary btn-xs' rel='tooltip' data-toggle='tooltip' data-placement='right' title='Edit'><i class='fa fa-edit'></i></button>"+
	                  "</div>"
	            }
	          ],
	          "columnDefs": [],
	          "order": [[ 0, 'asc' ]]//,
	        	//fixedColumns :{leftColumns:1}
		});


		var sbody = $('#table_data tbody');

		sbody.on('click','.edit',function()
		{
			var data = gentable.row($(this).parents('tr')).data();
			console.log(data);
			$('#name').val(data.name);
			$('#description').val(data.remarks);
			$('#id').val(data.id);
			//$('#tab_add').addClass('in active').tab('show');
			$('#myTabs li:eq(1) a').tab('show');
		}).
		on('click','.delete',function()
		{
				var data = gentable.row($(this).parents('tr')).data();
				var id = data.id;

				$.confirm({
				title: 'Confirm Delete ?',
				icon: 'fa fa-warning',
				content: 'Are you sure ' +data.name+ ' ?',
				autoClose: 'cancelAction|8000',
				buttons: {
					deleteUser: {
						text: 'Delete',
						btnClass: 'btn-red any-other-class',
						action: function () {
							$.post("{{ url('/member/delete') }}", 
							{
								id:id,
								_token: token
							}, 
							function(data) {

								if(data)
								{
									alertify.success('success deleted',2);
									gentable.ajax.reload();
								}
							});	
							
						}
					},
					cancelAction: function () {
						
					}
				}
			});
		});


		$('#form_data').submit(function(e)
		{
			e.preventDefault();
			var _datasend = $(this).serialize();
			var _url = $(this).attr('action');
			$('#form_data input').attr("disabled", "disabled");
			
              $.ajax({
	                type: 'POST',
	                url: _url,
	                data: _datasend,
	                dataType: 'json',
	                beforeSend:function(){
	                	alertify.error('sending ...',4);
	                },
	                success:function(data){
	                	if(data)
	                	{
	                		
	                		alertify.success('success saved!',2);
	                		gentable.ajax.reload();
	                		$('#myTabs li:eq(0) a').tab('show');
	                		$('#form_data').trigger('reset');
	                	}
	                },
	                error:function(xhr,status,errormessage)
	                {
	                	alertify.error('Warning '+xhr.responseText);
	                },
	                complete:function()
	                {
	                	$('#form_data input').removeAttr('disabled');
	                  	//$('.form-group').removeClass('has-success');
	                }
              });
		});
	});
</script>