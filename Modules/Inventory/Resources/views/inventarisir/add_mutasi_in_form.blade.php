<link href="{{ URL::asset('assets/global/plugins/typeahead/typeahead.css') }}" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{{ URL::asset('assets/global/plugins/typeahead/typeahead.bundle.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('assets/global/plugins/typeahead/bootstrap3-typeahead.min.js') }}"></script>

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
	<h3 class="page-title">
			{{ $projectname }}
		</h3>
		<strong class="page-title">Asset Dari Nomor Barang Keluar : {{ is_null($barangkeluar) ? '-' : $barangkeluar->no}}</strong>
	<hr>
		@include('form.a',[
			'href'=> is_null($barangkeluar) ? url('/inventarisir/index') : url('/inventarisir/index').'?id='.$barangkeluar->id, 
			'caption' => 'Cancel' 
		])
		@include('form.refresh')
</div>
<div class="col-lg-12 col-md-12 col-xs-12">
	<br/>
	<form method="post" id="id-SaveForm" method="post" class="form-horizontal form-label-left" action="{{ url('inventarisir/create') }}" autocomplete="off">
		{{ csrf_field() }}
		<input type="hidden" name="barangkeluar_id" id="barangkeluar_id" value="{{ is_null($barangkeluar) ? null : $barangkeluar->id }}" />
		

		  		
		  		<div class="item form-group">
	              <label class="control-label col-md-3 col-sm-3 col-xs-12">Pemberi</label>
	              <div class="col-md-4 col-sm-4 col-xs-12">
	                <div class="input-group">
	                  <input type="hidden" name="id_pic_giver" value="0" id="id_pic_giver" />
	                  <input type="text" name="giver" id="giver" class="form-control typeaHead" />
	                  <div class="input-group-addon">
	                    <button class="btn btn-success btn-xs" type="button"><i class="fa fa-user"></i></button>
	                  </div>
	                </div>
	              </div>
	            </div>

	             <div class="item form-group">
	              <label class="control-label col-md-3 col-sm-3 col-xs-12">Penerima</label>
	              <div class="col-md-4 col-sm-4 col-xs-12">
	                <div class="input-group">
	                  <input type="hidden" name="id_pic_recipient" value="0" id="id_pic_recipient" />
	                  <input type="text" name="pic_recipient" id="pic_recipient" class="form-control typeaHead" />
	                  <div class="input-group-addon">
	                    <button class="btn btn-success btn-xs" type="button"><i class="fa fa-user"></i></button>
	                  </div>
	                </div>
	              </div>
	            </div>

	            <div class="form-group">
		  			<label class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal</label>
		  			 <div class="col-md-4 col-sm-4 col-xs-12">
		  			 	<div class="input-group datePicker_">
		  			 		<div class="input-group-addon" ><i class="fa fa-calendar"></i></div>
		  			 			<input type="text" class="form-control date " name='date' id='date' value="{{ date('Y-m-d') }}">
		  			 	</div>
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
@include('pluggins.datetimepicker_pluggin')
<script type="text/javascript">
	$(document).ready(function()
	{
		//lookup PIC
      var sourceEngine = new Bloodhound({
                    datumTokenizer: Bloodhound.tokenizers.whitespace,
                    queryTokenizer: Bloodhound.tokenizers.whitespace,
                    remote: {
                          url: '/getUsers/type_user?q=%QUERY%',
                          wildcard: '%QUERY%'
                      }
                  });

      sourceEngine.initialize();

      var $inputType = $('.typeaHead');

      $inputType.typeahead({
        items : 4,
        source : sourceEngine.ttAdapter(),
        displayText : function(item)
        {
            return item.user_name;
        },
        updater: function(item)
        {
            $('input[name='+$(this)[0].$element.context.id+']').prev().val(item.id);
            //$('#id_pic_giver').val(item.id);
            //console.log($(this)[0].$element.context;
            return item.user_name;
        }
      });

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