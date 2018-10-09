@include('label_global')
@include('pluggins.datatable_pluggin')
<div id="div_content_page">
	<div class="page-bar">
	        <ul class="page-breadcrumb">
	            <li>
	                <a href="#">Master Data</a>
	                <i class="fa fa-arrow-circle-right"></i>
	            </li>
	            <li>
	            	<a href="#">Barang</a>
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
					'href' => url('items/index'),
					'caption' => 'Back'
				])

		

		<br/>
		<?php
			$decodeResults = json_decode($results);
			$totalStock = 0;
			$satuanbaku='';
			foreach(json_decode($stockResults) as $key => $value)
			{
				$totalStock +=$value->total_stock;
				$satuanbaku=$value->satuan;
			}
		?>
		<p/>
		<div class="content-loader">
			<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="panel panel-success">
			 		<div class="panel-heading"><strong>{{ $decodeResults->item_category }} -> {{ $decodeResults->name }}</strong></div>
				 	<div class="panel-body">
				 		<div class="col-lg-3 col-md-3 col-xs-6">
				 			<strong>Stock Min.</strong>
							<br/>
							<strong>Total Stock On Hand</strong>
							<br/>
							<strong>Total Stock Avaible</strong>
							<br/>
							<strong>Notification</strong>
							<br/>
							<strong>Is Inventory</strong>
						</div>

						<div class="col-lg-3 col-md-3 col-xs-6">
							<strong>: {{ $decodeResults->stock_min }} {{ $satuanbaku }}</strong>
							<br/>
							<strong>: {{ $totalStock }} {{ $satuanbaku }}</strong>
							<br/>
							<strong>: {{ $totalStock - (is_null($booking) ? 0 : $booking->booking)}} {{ $satuanbaku }}</strong>
							<br/>
							<strong>: {{ $decodeResults->satuan_warning ? 'Enable' : 'Disable'}}</strong>
							<br/>
							<strong>: {{ $decodeResults->is_inventory ? 'Yes' : 'No' }}</strong>
						</div>

						<div class="col-lg-2 col-md-2 col-xs-6">
							<strong>Is Consumable</strong>
							<br/>
							<strong>Description</strong>
						</div>

						<div class="col-lg-3 col-md-3 col-xs-6">
							<strong>: {{ $decodeResults->is_consumable ? 'Yes' : 'No'}}</strong>
							<br/>
							<strong>: {{ $decodeResults->description or '-' }}</strong>
						</div>

						
				 	</div>
				 </div>
				 <div class="panel panel-success">
			 		<div class="panel-heading"><strong>Details Information</strong></div>
				 	<div class="panel-body">
				 		<ul class="nav nav-tabs">
						  <li role="presentation" class="active">
						  	<a href="#tab_stock" data-toggle="tab">Stock</a>
						  </li>
						  <li role="presentation">
						  	<a href="#tab_satuan" data-toggle="tab">Satuan</a>
						  </li>
						</ul>

						<div class="tab-content">
						  <div id="tab_stock" class="tab-pane fade in active">
						    <table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column nowrap">
								<thead style="background: #3FD5C0;">
									<tr>
										<th class="text-center">Warehouse</th>
										<th class="text-center">Satuan </th>
										<th class="text-center">Stock On hand</th>								
									</tr>
								</thead>
								<tbody>
									@if(count(json_decode($stockResults)) > 0)
										@foreach(json_decode($stockResults) as $key => $value)
											
											<tr>
												<td>{{ $value->warehouse_name }}</td>
												<td>{{ $value->satuan }}</td>
												<td class="text-right">{{ $value->total_stock }}</td>
											</tr>									
										@endforeach
										
									@else
										<tr>
											<td colspan="3">Empty</td>
										</tr>	
									@endif
								</tbody>
							</table>
						  </div>
						  <div id="tab_satuan" class="tab-pane fade">
						     <table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column nowrap">
									<thead style="background: #3FD5C0;">
										<tr>
											<th class="text-center">Satuan</th>							
										</tr>
									</thead>
									<tbody>
										@if(count(json_decode($resultSatuans)) > 0)
											@foreach(json_decode($resultSatuans) as $key => $value)
												
												<tr>
													<td class="text-center">{{ $value->satuan_name }}</td>
												</tr>									
											@endforeach
											
										@else
											<tr>
												<td>Empty</td>
											</tr>	
										@endif
									</tbody>
								</table>
						  </div>
						</div>
				 	</div>
				 </div>

			</div>
		</div>
    </div>
	<script type="text/javascript" charset="utf-8">
		
	</script>
</div>