<table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column nowrap" id="table_data">
	{{ csrf_field() }}
	<thead>
		<tr>
			<th>#</th>
			<!--th>Progress</th-->
			<th>Kawasan</th>
			<th>Sub Holding</th>
			<th>Code</th>
			<th>Name</th>
			<th>Luas (m2)</th>
			<th>Efisiensi</th>
			
			<!--th>Dev Cost Bruto</th>
			<th>Dev Cost Netto</th>
			<th>Con Cost Netto</th>
			<th>HPP Budget</th>
			<th>HPP Kontrak</th>
			<th>HPP Realisasi</th>

			<th>Address</th>
			<th>Kode Pos</th>
			<th>Phone</th>
			<th>Fax</th>
			<th>Email</th>
			<th>Contact Person</th>
			<th>Descriptions</th-->
			<th>Edit</th>
			<th>Delete</th>
			<th>Print</th>
		</tr>
	</thead>
	<tbody>
	@foreach($project as $key => $each)
		
		@if($each->deleted_at == null)
			<tr>
		@else
			<tr class="danger">
		@endif
			<td>{{ $key + 1 }}</td>

			<!--td align="center">
				@include('form.a',['href'=> url('project_units_progresess/index?id=').$each->id.'&unit_type=Project', 'caption' => $each->progresses->count() .' Pekerjaan', 'class'=>'btn-xs' ])
			</td-->
			<td align="center">
				@include('form.a',['href'=> url('project_kawasan/index?id=').$each->id, 'caption' => $each->kawasans->count() .' Kawasan', 'class'=>'btn-xs' ])
			</td>

			<td>{{ $each->subholding }}</td>
			<td>{{ $each->code }}</td>
			<td>{{ $each->name }}</td>
			<td align="right">{{ number_format($each->luas,2) }}</td>
			<td class="text-right">{{ number_format($each->efisiensi *100,2) }} %</td>

			<!--td style='text-align:right'>{{ number_format($each->dev_cost_budget_bruto, 2) }}</td>
			<td style='text-align:right'>{{ number_format($each->dev_cost_budget_netto, 2) }}</td>
			<td style='text-align:right'>{{ number_format(0, 2) }}</td>
			<td style='text-align:right'>{{ number_format($each->hpp_budget, 2) }}</td>
			<td style='text-align:right'>{{ number_format($each->hpp_kontrak, 2) }}</td>
			<td style='text-align:right'>{{ number_format($each->hpp_realisasi, 2) }}</td>

			<td>{{ $each->address }}</td>
			<td>{{ $each->zipcode }}</td>
			<td>{{ $each->phone }}</td>
			<td>{{ $each->fax }}</td>
			<td>{{ $each->email }}</td>
			<td>{{ $each->contactperson->user_name or '' }}</td>
			<td>{{ $each->description }}</td-->

			<td align="center">
				<btn id="{{ $each->id }}" href="javascript:;" class="btn btn-xs blue edit-link"> 
					<i class="fa fa-edit">&nbsp;Edit</i>
				</btn>
			</td>

			<td align="center">
				@if($each->deleted_at == null)
					<btn id="{{ $each->id }}" href="javascript:;" class="btn btn-xs red delete-link"> 
						<i class="fa fa-times">&nbsp;Delete</i>
					</btn>
				@else
					<btn id="{{ $each->id }}" href="javascript:;" class="btn btn-xs red restore-link"> 
						<i class="fa fa-times">&nbsp;Restore</i>
					</btn>
				@endif
			</td>
			<td>
				<btn id="{{ $each->id }}" href="javascript:;" class="btn btn-xs blue print-link"> 
						<i class="fa fa-print">&nbsp;Print</i>
				</btn>
			</td>
		</tr>
	@endforeach
	</tbody>
</table>

<div id="div_ajax_func"> 
	@include('project.ajax_load')
</div>

<script type="text/javascript">
// set color on not found text
function setNotFound() {
	findAndReplace("not found", function(text){
		return '<span style="'+fontColor+'">' + text + '</span>';
	});
	return false;
};

setNotFound();
</script>