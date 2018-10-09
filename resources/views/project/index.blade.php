@include('label_global')
@include('pluggins.datatable_pluggin')

	<div class="portlet-body">
		<h3 class="page-title"> 
			Project
			<small>index</small>
		</h3>

		<hr />
			@include('form.a',['href'=> url('project/add_form'), 'caption' => 'Add Project' ])
			@include('form.refresh')
		<hr />
		
		<div class="content-loader">
			@include('project.datatable')
		</div>
    </div>

	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$('#table_data').DataTable();
			$('#table_data')
			.removeClass( 'display' )
			.addClass('table table-bordered');
		});
	</script>