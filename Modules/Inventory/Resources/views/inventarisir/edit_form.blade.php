{{ csrf_field() }}
@include('label_global')
@include('pluggins.datetimepicker_pluggin')
@include('pluggins.select2_pluggin')

<div class="col-sm-12">
	<h3>Inventarisir Edit</h3>
	<hr>
		@include('form.a',[
			'href'=>url('/inventarisir/index'), 
			'caption' => 'Cancel' 
		])
		@include('form.refresh')
	<hr>
</div>

<form method="post" id="id-SaveForm" action="{{ url('inventarisir/edit') }}">
	<table class='table'>
		<tr>
			<td>Barang Keluar No.</td>
			<td>
				<input type="hidden" name="id" id="id" value="{{ $inventarisir->id }}" />
				<input class="form-control" type="text" name="barangkeluar_id" id="barangkeluar_id" value="{{ is_null($inventarisir->barangkeluar) ? '' : $inventarisir->barangkeluar->no }}" placeholder='Barang Keluar No.' readonly="true"/>
			</td>
		</tr>
		
		<tr>
			<td>Project</td>
			<td>
				<select class='form-control select2' name='project_id' id='project_id'>
					@foreach($projects as $key => $value)
						<option value='{{ $value->id }}' {{ $inventarisir->project_id == $value->id ? 'selected' : '' }}>({{ $value->code }}) - {{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>PT</td>
			<td>
				<select class='form-control select2' name='pt_id' id='pt_id'>
					@foreach($pts as $key => $value)
						<option value='{{ $value->id }}' {{ $inventarisir->pt_id == $value->id ? 'selected' : '' }}>({{ $value->code }}) - {{ $value->name }}</option>
					@endforeach
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Date</td>
			<td>
				<div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd">
					<input type="text" class="form-control" name='date' id='date' readonly required value="{{ date('Y-m-d', strtotime($inventarisir->date))}}">
					<span class="input-group-btn">
					<btn class="btn default" type="button">
					<i class="fa fa-calendar"></i>
					</btn>
					</span>
				</div>
			</td>
		</tr>

		<tr>
			<td>Desciption</td>
			<td>
				<textarea class='form-control' name="description" id="description" cols="45" rows="5" placeholder="Description">{{ $inventarisir->description }}</textarea>
			</td>
		</tr>

	</table>
	
</form>


@include('form.submit', ['url' => url('inventarisir/edit'), 
'variables' => [
	'id',
	'project_id',
	'pt_id',
	'date',
	'description',
	'token'
	], 
	'arrays' => [],
	'is_edit' => TRUE
	])
