{{ csrf_field() }}
<script type="text/javascript" src="{{ URL::asset('assets/global/plugins/typeahead/bootstrap3-typeahead.min.js') }}"></script>
<form method="post" id="id-EditForm" action="{{ url('items_satuan/edit') }}">
	
	<input type="hidden" id="id" name="id" value="{{ $items_satuans->id }}" />
	<input type="hidden" id="item_id" name="item_id" value="{{ $items_satuans->item_id }}" />
	<table class='table'>
		
		<tr>
			<td>Nama Satuan </td>
			<td>
				<input type='text' id='name' name='name' class='form-control' placeholder='Item Name' required value="{{ $items_satuans->name }}" />
			</td>
		</tr>
		
		<tr>
			<td>Konversi</td>
			<td>
				<input type='text' id='konversi' name='konversi' class='form-control' placeholder='Konversi' required style='width:50%' value="{{ $items_satuans->konversi }}" onKeyPress="return percentage(event,value)" onInput="checkLength()" />
			</td>
		</tr>

	</table>

</form>

<div align="center">
	<btn type="button" class="btn green showtoast" name="btn-save" id="showtoast" onclick='getSave();'>
		<span class="fa fa-save"></span> Update
	</btn>
</div>

<script type="application/javascript">
function getSave() 
{
	var id = $("#id").val();
	var item_id = $("#item_id").val();
	var name = $("#name").val();
	var konversi = $("#konversi").val();
	var token = $('input[name=_token]').val();

	if (item_id == '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( '+item_id+')</div>');
		return false;
	}
	else {
		$.post("{{ url('items_satuan/edit') }}", 
			{ 
				id: id,
				item_id: item_id,
				name: name,
				konversi: konversi,
				_token: token
			},
			function(data) 
			{
				if(data)
				{
					alertify.success('success updated!',4);
					$("#div_content_page").fadeToggle('fast');
					$("#div_content_page").load("{{ url('items_satuan/index') }}"+'?id='+item_id, function()
					{
						$("#div_content_page").fadeIn('fast');
						
					});
				}

			}
		);
		return false;
	}
}

$(document).ready(function()
{
		$('#name').typeahead({
			source : function(query,result)
			{
				$.ajax({
					url:"{{ url('/items_satuan/typeSatuan') }}",
					data:{_token:$('input[name=_token]').val(),terms:query},
					dataType:'json',
					type:'post',
					success:function(data)
					{
						result($.map(data,function(item){
							return item;
						}));
					}
				});
			},
			updater:function(item)
			{
				//console.log(item);
				return item;
			}
		});
});
</script>