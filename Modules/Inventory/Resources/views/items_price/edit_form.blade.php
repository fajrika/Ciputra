@include('pluggins.datetimepicker_pluggin')
<form method="post" id="id-SaveForm" action="{{ url('items_price/edit') }}">
	{{ csrf_field() }}

	<input type="hidden" id="id" name="id" value="{{ $items_prices->id }}">
	<input type='hidden' id='item_id' name='item_id' class='form-control' style='width:50%' value='{{ $items_prices->item_id }}' />

	<table class='table'>
		<tr>
			<td>Price</td>
			<td>
				<div class="input-group">
					<div class="input-group-addon">Rp.</div>
					<input type='text' id='price' name='price' class='form-control' value="{{ $items_prices->price }}" />
					<input type="hidden" id="mprice" name="mprice" value="{{ $items_prices->price }}" />
				</div>
				
			</td>
		</tr>

		<tr>
			<td>Satuan </td>
			<td>
				<select style='width:50%' class='form-control' name="item_satuan_id" id="item_satuan_id">
					<option value="">Pilih</option>
					@foreach($satuans as $key =>$value)
						<option value="{{ $value->id }}" {{ $items_prices->item_satuan_id==$value->id ? 'selected' : '' }}>{{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Tanggal Harga </td>
			<td>
				<div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd">
					<div class="input-group-addon"><i class="fa fa-calendar"></i>
					</div>
					<input type="text" class="form-control" name="date" id="date" readonly value="<?php echo date('Y-m-d'); ?>" />
				</div>
			</td>
		</tr>
		
		<!--tr>
			<td>Mata Uang </td>
			<td>
				<input type='text' id='matauang' name='matauang' class='form-control' placeholder='Mata Uang' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>Kurs </td>
			<td>
				<input type='text' id='kurs' name='kurs' class='form-control' placeholder='Kurs' required style='width:50%' onKeyPress="return percentage(event,value)" onInput="checkLength()" value='0' />
			</td>
		</tr-->
		
		<tr>
			<td>Descriptions</td>
		  <td>
				<textarea class='form-control' name="description" id="description" cols="45" rows="5" placeholder='Descriptions'>{{ $items_prices->description }}</textarea>
			</td>
		</tr>

	</table>
	<div align="center">
	<button type="submit" class="btn green showtoast" name="btn-save" id="showtoast" >
		<span class="fa fa-save"></span> Update
	</button>
</div>
</form>


@include('form.general_form')
<script type="application/javascript">
/*function getSave() 
{
	var item_id = $("#item_id").val();
	var project_id = $("#project_id").val();
	var price_kecil = $("#price_kecil").val();
	var price_besar = $("#price_besar").val();
	var matauang = $("#matauang").val();
	var kurs = $("#kurs").val();
	var volume = $("#volume").val();
	var description = $("#description").val();
	var token = $('input[name=_token]').val();

	if (matauang == '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( '+matauang+')</div>');
		return false;
	}
	else if (description == '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( '+description+')</div>');
		return false;
	}
	else {
		$.post("{{ url('items_price/create') }}", 
			{ 
				item_id: item_id,
				project_id: project_id, 
				price_kecil: price_kecil,
				price_besar: price_besar,
				matauang: matauang, 
				kurs: kurs,
				volume: volume,
				description: description,
				_token: token
			},
			function(data) 
			{
				$("#div_message").html('<div class="custom-alerts alert alert-success fade in"> Succesfully saved on '+ formattedtoday +'</div>');
				$("#id-SaveForm")[0].reset();
			}
		);
		return false;
	}
}*/
$(document).ready(function(){
	fnSetAutoNumeric('#price');


	$('#id-SaveForm').submit(function(e)
	{
		e.preventDefault();

		var getMoney = $('#price').autoNumeric('get');
		$('#mprice').val(getMoney);
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
				if(get.stat)
				{
					$("#div_message").html('<div class="custom-alerts alert alert-success fade in"> Succesfully saved on '+ formattedtoday +'</div>');
					$('#id-SaveForm').trigger('reset');
					$('#div_content').load("{{ url('/items_price/index') }}"+"?id="+get.id);
				}

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