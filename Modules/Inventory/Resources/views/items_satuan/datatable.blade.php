<table class="table table-striped table-bordered table-hover table-responsive table-checkable order-column" id="table_data">
	{{ csrf_field() }}
	<thead>
		<tr>
			<th>No</th>
			<th>Item</th>
			<th>Satuan</th>
			<th>Konversi</th>
			<th></th>
			
		</tr>
	</thead>
	<tbody>
	@foreach($items_satuans as $key => $each)
		<tr>
			<td>{{ $key + 1 }}</td>
			<td>{{ $each->item->name }}</td>
			<td>{{ $each->name }}</td>
			<td>{{ $each->konversi }}</td>
			<td align="center">
				<button id="{{ $each->id }}" href="#" class="btn btn-xs btn-primary edit-link"> 
					<i class="fa fa-edit"></i>
				</button>
				<button id="{{ $each->id }}" href="#" class="btn btn-xs btn-danger delete-link"> 
					<i class="fa fa-times"></i>
				</button>
			</td>
		
		</tr>
	@endforeach
	</tbody>
</table>
