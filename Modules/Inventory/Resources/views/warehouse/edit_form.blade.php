

@include('label_global')
@include('pluggins.datetimepicker_pluggin')
@include('pluggins.select2_pluggin')
<form method="post" id="id-SaveForm" action="{{ url('warehouse/edit') }}">
	{{ csrf_field() }}
	<input type='hidden' id='id' name='id' value='{{ $warehouses->id }}' />
	
	<table class='table'>
		
		<tr>
			<td>City</td>
			<td>
				<select class='form-control select2' name='city_id' id='city_id'>
					@foreach($cities as $key => $value)
						<option value='{{ $value->id }}' {{ $warehouses->city_id == $value->id ? 'selected' : '' }}>({{ $value->zipcode }}) - {{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Name</td>
			<td>
				<input type='text' id='name' name='name' class='form-control' placeholder='Warehouse Name' required value='{{ $warehouses->name }}' />
			</td>
		</tr>
		
		
		
	</table>
	
</form>

<div align="center">
	<btn type="button" class="btn green showtoast" name="btn-save" id="showtoast" onclick='getSave();'>
		<span class="fa fa-save"></span> Save
	</btn>
</div>


<script type="application/javascript">
function getSave() 
{
	var id = $("#id").val();
	var city_id = $("#city_id").val();
	var name = $("#name").val();
	var capacity_volume = $("#capacity_volume").val();
	var token = $('input[name=_token]').val();

	if (capacity_volume == '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( Kapasitas/ Volume )</div>');
		return false;
	}
	else {
		$.post("{{ url('warehouse/edit') }}", 
			{ 
				id: id,
				city_id: city_id,
				name: name,
				capacity_volume: capacity_volume,
				_token: token
			},
			function(data) 
			{
				$("#div_content_page").fadeOut('slow', function()
				{
					$("#div_content_page").fadeIn('slow');
					$("#div_content_page").load('{{ url('warehouse/index') }}'+'?update=1');
					
				});
			}
		);
		return false;
	}
}
</script>
