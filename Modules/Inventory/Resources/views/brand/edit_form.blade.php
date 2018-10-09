{{ csrf_field() }}
<form method="post" id="id-EditForm" action="{{ url('brand/edit') }}">
	<input type='hidden' id='id' name='id' value='{{ $brands->id }}' />
	<table class='table'>
		
		<tr>
			<td>Name </td>
			<td>
				<input type='text' id='name' name='name' class='form-control' placeholder='Name' required value='{{ $brands->name }}' />
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
	var name = $("#name").val();
	var token = $('input[name=_token]').val();
	
	var field_name = "";

	$("#id-EditForm").find('input, select, textarea').each
	(
		function(i, field)
		{
			if($(field).val() == '')
			{
			   field_name += field.name + ', ';
			}
		}
	);

	if (field_name != '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( '+field_name+')</div>');
		return false;
	}
	else {
		$.post("{{ url('brand/edit') }}", 
			{ 
				id: id,
				name: name,
				_token: token
			},
			function(data) 
			{
				if(data)
				{
					alertify.success('success updated!',2);
					$("#div_content_page").load('{{ url('brand/index') }}'+'?update=1', function()
					{
						$("#div_content_page").fadeIn('fast');
						
					});
				}
				
			}
		);
		return false;
	}
}
</script>