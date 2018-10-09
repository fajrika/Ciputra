{{ csrf_field() }}
<form method="post" id="id-EditForm" action="{{ url('category/edit') }}">
	
	<input type="hidden" id="id" name="id" value="{{ $categories->id }}">

	<table class='table'>
		<input type='hidden' id='id' name='id' value='{{ $categories->id }}' />
		<tr>
			<td>Parent Kategori </td>
			<td>
				<select class='form-control' name="parent_id" id="parent_id">
					<option value="0">Pilih</option>
					@foreach($ItemCategory as $key => $value)
						<option value="{{ $value->id }}" {{ ($categories->parent_id == $value->id) ? 'selected' : '' }}>{{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Nama </td>
			<td>
				<input type='text' id='name' name='name' class='form-control' placeholder='Category Name' required value='{{ $categories->name }}' />
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
	var parent_id = $('#parent_id').val();
	var name = $("#name").val();
	var token = $('input[name=_token]').val();

	if (name == '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( '+name+')</div>');
		return false;
	}
	else {
		$.post("{{ url('category/edit') }}", 
			{ 
				id: id,
				parent_id: parent_id,
				name: name,
				_token: token
			},
			function(data) 
			{
				if(data)
				{
					alertify.success('success updated!',3);
					$('#div_content').load('{{ url("category/index") }}');
				}
			}
		);
		//return false;
	}
}
</script>