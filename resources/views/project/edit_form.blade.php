{{ csrf_field() }}
@if(isset($_GET['id_menu_level']))
	@include('pluggins.select2_pluggin')
	@include('pluggins.datetimepicker_pluggin')
@else
	@include('../pluggins.select2_pluggin')
	@include('../pluggins.datetimepicker_pluggin')
@endif


<form method="post" id="id-EditForm" action="{{ url('project/edit') }}">
	
	<input type="hidden" id="id" name="id" value="{{ $project->id }}">
	
	<table class='table'>
		<!--
		<tr>
			<td>Add Unit</td>
			<td>
				<select class='form-control' name='add_unit'>
					<option>-- CHOOSE --</option>
				</select>
			</td>
		</tr>
		-->

		<tr>
			<td>Code</td>
			<td>
				<input type='text' id='code' name='code' class='form-control' placeholder='ID/ Code' required style='width:50%' value='{{ $project->code }}'  />
			</td>
		</tr>

		<tr>
			<td>Sub Holding</td>
			<td>
				<input type='text' id='subholding' name='subholding' class='form-control' placeholder='Sub Holding' required style='width:50%' value='{{ $project->subholding }}'  />
			</td>
		</tr>

		<tr>
			<td>Name</td>
			<td>
				<input type='text' id='name' name='name' class='form-control' placeholder='Project Name' value='{{ $project->name }}' required />
			</td>
		</tr>
		
		<tr>
			<td>Luas</td>
			<td>
				<input type='text' id='luas' name='luas' class='form-control' placeholder='Luas' value='{{ $project->luas }}' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>NPWP</td>
			<td>
				<input type='text' id='npwp' name='npwp' class='form-control' placeholder='NPWP No.' value='{{ $project->npwp }}' required />
			</td>
		</tr>
		
		<tr>
			<td>Phone</td>
			<td>
				<input type='text' id='phone' name='phone' class='form-control' placeholder='Phone' value='{{ $project->phone }}' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>Fax</td>
			<td>
				<input type='text' id='fax' name='fax' class='form-control' placeholder='Fax No.' value='{{ $project->fax }}' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>Email</td>
			<td>
				<input type='text' id='email' name='email' class='form-control' placeholder='Email' value='{{ $project->email }}' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>Contact Person</td>
			<td>
				<select class='form-control select2' name='contactperson' id='contactperson'>
				@foreach($project_pt_user as $key => $each)
					<option value='{{ $each->id }}' {{ ($project->contactperson == $each->id) ? 'selected' : '' }}>{{ $each->description }}</option>
				@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td>
				<textarea class='form-control' name="address" id="address" cols="45" rows="5" placeholder="Address">{{ $project->address }}</textarea>
			</td>
		</tr>

		<tr>
			<td>Zip Code</td>
			<td>
				<input type='text' id='zipcode' name='zipcode' class='form-control' placeholder='Kode pos'  required style='width:50%' value='{{ $project->zipcode }}'  />
			</td>
		</tr>
		
		<tr>
			<td>Descriptions</td>
		  <td>
				<textarea class='form-control' name="description" id="description" cols="45" rows="5" placeholder="Descriptions">{{ $project->description }}</textarea>
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
	var code = $("#code").val();
	var zipcode = $("#zipcode").val();
	var subholding = $("#subholding").val();
	var name = $("#name").val();
	var luas = $("#luas").val();
	var npwp = $("#npwp").val();
	var phone = $("#phone").val();
	var fax = $("#fax").val();
	var email = $("#email").val();
	var contactperson = $("#contactperson").val();
	var address = $("#address").val();
	var description = $("#description").val();
	var token = $('input[name=_token]').val();

	if (code == '') 
	{
		$("#div_message").html('<div class="custom-alerts alert alert-danger fade in">Please fill value on ( Code )</div>');
		return false;
	}
	else {
		$.post("{{ url('project/edit') }}", 
			{ 
				id: id,
				code: code,
				zipcode: zipcode,
				subholding: subholding,
				name: name,
				luas: luas,
				npwp: npwp,
				phone: phone,
				fax: fax,
				email: email,
				contactperson: contactperson,
				address: address,
				description: description,
				_token: token
			},
			function(data) 
			{
				$("#div_content_page").fadeToggle('fast');
				$("#div_content_page").load('{{ url('project/index') }}'+'?update=1', function()
				{
					$("#div_content_page").fadeIn('fast');
					
				});
			}
		);
		return false;
	}
}
</script>