@if($request->id)
	<select name="project_idcheck" id="project_idcheck" class="form-control">
		<option value="">Project</option>
		@foreach($projects as $key=>$value)
			<option value="{{ $value->id }}">{{ $value->name }}</option>
		@endforeach
	</select>
	<br/>
	<table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column" id="table_compare">
		{{ csrf_field() }}
		<thead style="background-color: #3fd5c0;">
			<tr>
				<th>Harga</th>
				<th>Satuan</th>
				<th>Tanggal</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">Empty</td>
			</tr>
		</tbody>
	</table>

@endif
{{ csrf_field() }}
<table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column" id="table_data">
	
	<thead>
		<tr>
			<th>No</th>
			<th>Item</th>
			<th>Harga</th>
			<th>Satuan</th>
			<th>Tanggal</th>
			<!--th>Mata Uang</th>
			<th>Kurs</th>
			<th>Description</th-->
			@if($request->id)
				<th></th>
			@endif
		</tr>
	</thead>
	<tbody>
	@foreach($items_prices as $key => $each)
		<tr>
			<td>{{ $key + 1 }}</td>
			<td>{{ $each->item->name }}</td>
			<td>Rp. {{ number_format($each->price,2,".",",") }}</td>
			<td>{{ is_null($each->satuan) ? '-' : $each->satuan->name }}</td>
			<td>{{ date('d-m-Y',strtotime($each->date_price)) }}</td>
			@if($request->id)
				<td align="center">
					<btn id="{{ $each->id }}" href="javascript:;" class="btn btn-xs blue edit-link"> 
						<i class="fa fa-edit">&nbsp;Edit</i>
					</btn>
					<btn id="{{ $each->id }}" href="javascript:;" class="btn btn-xs red delete-link"> 
						<i class="fa fa-times">&nbsp;Delete</i>
					</btn>
				</td>
			@endif
		</tr>
	@endforeach
	</tbody>
</table>

<div id="div_ajax_func"> 
	@include('items_price.ajax_load')
</div>
@if($request->id)
<script type="text/javascript">
	$(document).ready(function()
	{
		$('#project_idcheck').change(function(){
			console.log($('#item_id').val());
			var strhtml="";
			$.ajax({
				url:"{{ url('/items_price/getComparePrice') }}",
				data: {_token : $('input[name=_token]').val(),project_id:$(this).val(),item_id:$('#item_id').val()},
				dataType:'json',
				type:'post',
				success:function(data)
				{
					if(data.length >0)
					{

						for(var i=0;i<data.length;i++)
						{
							strhtml+="<tr><td class='text-right'>"+data[i].price+"</td><td>"+data[i].satuan+"</td><td>"+data[i].date_price+"</td></tr>";
						}

					}
					else
					{
						strhtml="<tr><td colspan='3'>Empty</td></tr>";
					}
					$('#table_compare tbody').find('tr').remove().end().append(strhtml);
				}
			});
		});
	});
</script>
@endif
