{{ csrf_field() }}
@include('pluggins.select2_pluggin')
@include('pluggins.datetimepicker_pluggin')

<div class="col-sm-12">
	<h3>Add Project</h3>
	<hr>
	@include('form.a',['href'=> url('project/index'), 'caption' => 'Cancel' ])
	@include('form.refresh')
	<hr>
</div>

<form method="post" id="id-SaveForm" action="{{ url('project/create') }}">
	<table class='table'>
		
		<tr>
			<td>Sub Holding</td>
			<td>
				<!--input type='text' id='subholding' class='form-control' placeholder='Sub Holding' required required style='width:50%'  /-->
				<select class="form-control" name="subholding" id="subholding">
					<option value="">(choose)</option>
					<option value="1">SH1</option>
					<option value="2">SH2</option>
					<option value="3">SH3A</option>
					<option value="4">SH3B</option>
				</select>
			</td>
		</tr>

		<tr>
			<td>Code</td>
			<td>
				<input type='text' id='code' name='code' class='form-control' placeholder='ID/ Code' required required style='width:50%'  />
			</td>
		</tr>

		<tr>
			<td>Project Name</td>
			<td>
				<input type='text' id='name' name='name' class='form-control' placeholder='Project Name' required />
			</td>
		</tr>
		
		<tr>
			<td>Luas Area Bruto (m2)</td>
			<td>
				<input type='text' id='luas' name='luas' class='form-control' placeholder='Luas' required style='width:50%' />
			</td>
		</tr>

		<tr>
			<td>Phone</td>
			<td>
				<input type='text' id='phone' name='phone' class='form-control' placeholder='Phone' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>Fax</td>
			<td>
				<input type='text' id='fax' name='fax' class='form-control' placeholder='Fax No.' required style='width:50%' />
			</td>
		</tr>
		
		<tr>
			<td>Email</td>
			<td>
				<input type='text' id='email' name='email' class='form-control' placeholder='Email' required />
			</td>
		</tr>
		
		<tr>
			<td>Contact Person</td>
			<td>
				<select class='form-control select2' name='contactperson' id='contactperson'>
					@foreach($project_pt_user as $each)
						<option value='{{ $each->id }}'>{{ $each->user->user_name }} / {{ $each->pt->name }} / {{ $each->project->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td>
				<textarea class='form-control' name="address" id="address" cols="45" rows="5" placeholder="Address"></textarea>
			</td>
		</tr>

		<tr>
			<td>Kode Pos</td>
			<td>
				<input type='text' id='zipcode' name='zipcode' class='form-control' placeholder='Kode Pos' required />
			</td>
		</tr>
		
		<tr>
			<td>Descriptions</td>
			<td>
				<textarea class='form-control' name="description" id="description" cols="45" rows="5" placeholder="Descriptions"></textarea>
			</td>
		</tr>

	</table>
</form>

@include('form.submit', [
	'url' => url('project/create'), 
	'variables' => [
		'code',
		'subholding',
		'name',
		'luas',
		'phone',
		'fax',
		'email',
		'contactperson',
		'address',
		'zipcode',
		'description'
		], 
	'arrays' => [] 
	])

<script src="./assets/global/plugins/jquery.number.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$("#luas").number(true,2);
</script>