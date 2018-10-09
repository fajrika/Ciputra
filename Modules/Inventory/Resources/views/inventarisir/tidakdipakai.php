{{ csrf_field() }}
@include('label_global')
@include('pluggins.datetimepicker_pluggin')
@include('pluggins.select2_pluggin')

<div class="col-sm-12">
	<div class="page-bar">
	    <ul class="page-breadcrumb">
	        <li>
	            <a href="#">Inventory</a>
	            <i class="fa fa-arrow-circle-right"></i>
	        </li>
	        <li>
	            <a href="#">Inventarisir</a>
	            <i class="fa fa-arrow-circle-right"></i>
	        </li>
	        <li>
	        	<span>Tambah</span>
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
	<h3>{{ $projectname }}</h3>
	<hr>
		@include('form.a',[
			'href'=> is_null($barangkeluar) ? url('/inventarisir/index') : url('/inventarisir/index').'?id='.$barangkeluar->id, 
			'caption' => 'Cancel' 
		])
		@include('form.refresh')
</div>
<div class="col-lg-12 col-md-12 col-xs-12">
	<br/>
	<form method="post" id="id-SaveForm" method="post" class="form-horizontal form-label-left" action="{{ url('inventarisir/create') }}">

				<div class="item form-group">
				    <label class="control-label col-md-3 col-sm-3 col-xs-12">Dokumen Barang Keluar</label>
				    <div class="col-md-7 col-sm-7 col-xs-12">
				    	{{ csrf_field() }}
				    	<input type="hidden" name="barangkeluar_id" id="barangkeluar_id" value="{{ is_null($barangkeluar) ? null : $barangkeluar->id }}" />
						<input type='text' id='no' name='no' class='form-control' value="{{ is_null($barangkeluar) ? null : $barangkeluar->no }}" readonly="true" />
				    </div>
		  		</div>

		  		<div class="form-group">
		  			<label class="control-label col-md-3 col-sm-3 col-xs-12">PT</label>
		  			 <div class="col-md-7 col-sm-7 col-xs-12">
		  			 	<select class='form-control select2' name='pt_id' id='pt_id'>
							@foreach($pts as $key => $value)
								<option value="{{ $value->id }}" {{ $barangkeluar->permintaanbarang->pt->id == $value->id ? 'selected' :'' }}>({{ $value->code }}) - {{ $value->name }}</option>
							@endforeach
						</select>
		  			 </div>
		  		</div>
		  		<div class="form-group">
		  			<label class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal</label>
		  			 <div class="col-md-7 col-sm-7 col-xs-12">
		  			 	<div class="input-group">
		  			 		<div class="input-group-addon " ><i class="fa fa-calendar"></i></div>
		  			 			<input type="text" class="form-control date date-picker" data-date-format="yyyy-mm-dd" name='date' id='date' readonly value="{{ date('Y-m-d') }}">
		  			 	</div>
		  			 	</div>
		  		</div>

		  		<div class="form-group">
		  			<label class="control-label col-md-3 col-sm-3 col-xs-12">Description</label>
		  			 <div class="col-md-7 col-sm-7 col-xs-12">
		  			 	<textarea class='form-control' name="description" id="description" cols="45" rows="5" placeholder="Description"></textarea>
		  			 </div>
		  		</div>

		  		<div class="ln_solid"></div>
				<div class="form-group">
					<div class="col-md-6 col-md-offset-3">
						<button id="send" type="submit" class="btn btn-success"><i class="fa fa-save"></i> Save</button>
						<button id="reset" type="reset" class="btn btn-warning"><i class="fa fa-times"></i> Reset</button>
						
					</div>
				</div>

			</form>
	
</div>

<script type="text/javascript">
	$(document).ready(function()
	{
		$('#id-SaveForm').submit(function(e)
		{
			e.preventDefault();
			var _datasend = $(this).serialize();
			var _url = $(this).attr('action');
			$('#id-SaveForm input').attr("disabled", "disabled");
			
              $.ajax({
	                type: 'POST',
	                url: _url,
	                data: _datasend,
	                dataType: 'json',
	                beforeSend:function(){
	                	notify = new PNotify({text:'Sending ...'});
	                },
	                success:function(data){
	                	if(data.return=='1')
	                	{
	                		notify.update({
							   title: "Success",
							   text: "Success saved!"
							});
	                		$('#div_content').load("{{ url('/inventarisir/index')}}"+"?id="+$('#barangkeluar_id').val());
	                	}
	                	else
	                	{
	                		notify.update({
							   title: "Warning",
							   text: "Mohon periksa kembali data-data anda"
							});
	                	}
	                },
	                error:function(xhr,status,errormessage)
	                {
	                	notify.update({
							   title: "Warning",
							   text: "Terjadi Kesalahan : anda mungkin belum menambahkan detail ,silahkan periksa data-data detail anda kembali."
							});
	                },
	                complete:function()
	                {
	                	$('#id-SaveForm input').removeAttr('disabled');
	                  	$('.form-group').removeClass('has-success');
	                }
              });
		});
	});
</script>