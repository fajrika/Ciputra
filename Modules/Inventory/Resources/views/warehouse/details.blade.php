@include('label_global')
@include('pluggins.editable_plugin')
@include('pluggins.alertify')
<div id="div_content_page">
	<div class="page-bar">
	        <ul class="page-breadcrumb">
	            <li>
	                <a href="#">Master Data</a>
	                <i class="fa fa-arrow-circle-right"></i>
	            </li>
	            <li>
	            	<a href="#">Warehouse</a>
	                <i class="fa fa-arrow-circle-right"></i>
	                
	            </li>
	            <li><span>Detail</span></li>
	        </ul>
	        <div class="page-toolbar">
	            <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
	                <i class="icon-calendar"></i>&nbsp;
	                <span class="thin uppercase hidden-xs"></span>&nbsp;
	                <i class="fa fa-angle-down"></i>
	            </div>
	        </div>
	    </div>
	<div class="portlet-body">
		
		<h3 class="page-title"> {{ $projectname }}
		</h3>
		@include('form.refresh')
		@include('form.a',
				[
					'href' => url('warehouse/index'),
					'caption' => 'Back'
				])
		<br/>
		
		<p/>
		<div class="content-loader">
			<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="panel panel-success">
			 		<div class="panel-heading"><strong>Details {{ $warehouse->name }}</strong>
			 			<br/></div>

				 	<div class="panel-body">
				 		<button class="btn btn-primary pull-right" id="btn-edit"><i class="fa fa-edit"></i></button><br/>
				 		<div class="col-lg-3 col-md-3 col-xs-6">
				 			<strong>Kode</strong>
							<br/>
							<strong>Nama</strong>
							<br/>
							<strong>Departemen</strong>
							<br/>
							<strong>Kota</strong>
							<br/>
							<strong>Alamat</strong>
							<br/>
							<strong>Created at</strong>
							<br/>
							<strong>Update at</strong>
							
						</div>

						<div class="col-lg-6 col-md-6 col-xs-6">
							<strong>: <a href="#" class="editable_header" 
										data-pk="{{ $warehouse->id}}" 
										data-name="code" 
										data-url="{{url('/warehouse/update')}}" 
										data-original-title="Kode Gudang"
										data-type="text" 
										data-value="{{ $warehouse->code}}">{{ $warehouse->code or '-' }}</a></strong>
							<br/>
							<strong>: <a href="#" class="editable_header" 
										data-pk="{{ $warehouse->id}}" 
										data-name="name" 
										data-url="{{url('/warehouse/update')}}" 
										data-original-title="Nama Gudang"
										data-type="text" 
										data-value="{{ $warehouse->name}}">{{ $warehouse->name }}</a></strong>
							<br/>
							<strong>: <a href="#" class="editable_header" 
											data-pk="{{$warehouse->id}}" 
											data-name="department_id" 
											data-url="{{url('/warehouse/update')}}" 
											data-original-title="Pilih Departemen"
											data-type="select" 
											data-value="{{$warehouse->department_id}}" 
											data-source="{{url('/general/department_source')}}">{{ $warehouse->department->name or '-' }}</a></strong>
							<br/>
							<strong>: <a href="#" class="editable_header" 
											data-pk="{{$warehouse->id}}" 
											data-name="city_id" 
											data-url="{{url('/warehouse/update')}}" 
											data-original-title="Pilih Kota"
											data-type="select" 
											data-value="{{$warehouse->city_id}}" 
											data-source="{{url('/general/city_source')}}">{{ is_null($warehouse->city) ? '-' : $warehouse->city->name }}</a></strong>
							<br/>
							<strong>: <a href="#" class="editable_header" 
											data-pk="{{ $warehouse->id}}" 
											data-name="address" 
											data-url="{{url('/warehouse/update')}}" 
											data-original-title="Alamat"
											data-type="textarea"
											data-value="{{ $warehouse->address }}">{{ $warehouse->address  or '-' }}</a></strong>
							<br/>
							<strong>: {{ date('d-m-Y H:m:s',strtotime($warehouse->created_at)) }}</strong>
							<br/>
							<strong>: {{ date('d-m-Y H:m:s',strtotime($warehouse->updated_at)) }}</strong>
						</div>
				 	</div>
				 </div>
				 

			</div>
		</div>
    </div>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function()
		{
			$.ajaxSetup({
			    headers: {
			        'X-CSRF-Token': $('input[name=_token]').val()
			    }
			});
			$('.editable_header').editable({
					disabled:true,
					ajaxOptions: {
					    type: 'post',
					    dataType: 'json'
					},
					success:function(data)
					{
						if(data)
						{
							alertify.success('success updated',3);
						}
					}
				}
			);

			$('#btn-edit').click(function()
			{
				$('.editable_header').editable('toggleDisabled');
			})
		});
	</script>
</div>