<form method="post" id="id-SaveForm" action="{{ url('items/edit') }}">
	{{ csrf_field() }}
	<input type="hidden" id="id" name="id" value="{{ $items->id }}">
	<table class='table'>
		
		<tr>
			<td>Category </td>
			<td>
				<select class='form-control' name="item_category_id" id="item_category_id">
					<option value="">Pilih</option>
					@foreach($item_categories as $key => $value)
						<option value="{{ $value->id }}" {{ $value->id==$items->item_category_id ? 'selected' : '' }}>{{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>

		<tr id="sub_category">
			<td>Sub Category </td>
			<td>
				<select class='form-control' name="sub_item_category_id" id="sub_item_category_id">
					<option value="" id="append_here">Sub Category</option>
					@foreach($subcategories as $key => $value)
						<option value="{{ $value->id }}" {{ $value->id==$items->sub_item_category_id ? 'selected' : '' }}>{{$value->name}}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Name </td>
			<td>
				<input type='text' id='name' name='name' class='form-control' value='{{ $items->name }}' required />
			</td>
		</tr>
		
		<tr>
			<td>Warning Satuan </td>
			<td>
				<input type='checkbox' name='satuan_warning' id='satuan_warning' value="1" 
				@if($items->satuan_warning) 
					checked 
				@endif  />
			</td>
		</tr>

		<tr>
			<td>Is Inventory </td>
			<td>
				<input value="1" type='checkbox' name='is_inventory' id='is_inventory'
					@if($items->is_inventory)
						checked
					@endif
				/>
			</td>
		</tr>

		<tr>
			<td>Is Consumable </td>
			<td>
				<input type='checkbox' name='is_consumable' id='is_consumable' value="1" 
				@if($items->is_consumable)
						checked
					@endif />
			</td>
		</tr>
		
		<tr>
			<td>Minimum Stok </td>
			<td>
				<input type='text' id='stock_min' name='stock_min' class='form-control' placeholder='Stock Minimum' required style='width:50%' onKeyPress="return percentage(event,value)" onInput="checkLength()" value='{{ $items->stock_min }}' />
			</td>
		</tr>

		<tr>
			<td>Default Warehouse </td>
			<td>
				<select class='form-control' name="default_warehouse_id" id="default_warehouse_id">
					@foreach($warehouses as $key => $value)
						<option value='{{ $value->id }}' {{ ($items->default_warehouse_id == $value->id) ? 'selected' : '' }}>{{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Descriptions</td>
		  <td>
				<textarea class='form-control' name="description" id="description" cols="45" rows="5" placeholder='Descriptions'>{{ $items->description }}</textarea>
			</td>
		</tr>

	</table>
	<div align="center">
		<button type="submit" class="btn green showtoast" name="btn-save" id="showtoast">
			<span class="fa fa-save"></span> Update
		</button>
	</div>
</form>




<script type="text/javascript">


$(document).ready(function()
{

	$('#item_category_id').change(function()
	{
		var _url = "{{ url('/item/getSubCategories') }}"
		$.ajax({
			type:'POST',
			data: {id:$(this).val(),_token : $('input[name=_token]').val()},
			url : _url,
			dataType : 'json',
			beforeSend:function()
			{
				$('#sub_category').hide();
			},
			success : function(data)
			{
				var strHtml = '<option value="">Sub Category</option>';
				$(data).each(function(i,v)
				{
					strHtml+='<option value="'+v.id+'">'+v.name+'</option>';
					console.log(v);
				});
				console.log(strHtml);
				$('#sub_item_category_id').find('option').remove().end().append(strHtml);//.append(strHtml);
			},
			complete:function()
			{
				$('#sub_category').show();
			}
		});
	});
	$('#id-SaveForm').submit(function(e)
	{
		
		e.preventDefault();
		var url 	= $(this).attr('action');
		var data 	= $(this).serialize();
		$('#id-SaveForm input').attr('disabled','disabled');
		$.ajax({
			type:'POST',
			dataType:'json',
			url:url,
			data:data,
			beforeSend:function()
			{
				
			},
			success:function(get)
			{
				if(get.return=='1')
				{
					$("#div_message").html('<div class="custom-alerts alert alert-success fade in"> Succesfully saved on '+ formattedtoday +'</div>');
					$('#id-SaveForm').trigger('reset');
				}

				$('#div_content').load("{{ url('items/index') }}");
				return false;
			},
			error:function(xhr,status,message)
			{
				console.log(message);
				$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( '+xhr.responseText+')</div>');
			},
			complete:function()
			{
				$('#id-SaveForm input').removeAttr('disabled');
			}
		});
	});
});
</script>