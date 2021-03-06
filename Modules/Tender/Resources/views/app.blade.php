<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
    $.ajaxSetup({
      headers: {
          'X-CSRF-Token': $('input[name=_token]').val()
      }
    });

    $("#ambil_doc_date").datepicker({
        "dateformat" : "yy-mm-dd",
    });

    $("#aanwijzing_date").datepicker({
        "dateformat" : "yy-mm-dd",
        "minDate"    : "+7d"
    });

    $("#penawaran1_date").datepicker({
        "dateformat" : "yy-mm-dd",
        "minDate"    : "+14d"
    });

    $("#klarifikasi1_date").datepicker({
        "dateformat" : "yy-mm-dd",
        "minDate"    : "+21d"
    });

    $("#penawaran2_date").datepicker({
        "dateformat" : "yy-mm-dd",
        "minDate"    : "+28d"
    });

    $("#klarifikasi2_date").datepicker({
        "dateformat" : "yy-mm-dd",
        "minDate"    : "+35d"
    });

    $("#pengumuman_date").datepicker({
        "dateformat" : "yy-mm-dd",
        "minDate"    : "+42d"
    });
    $(".nilai_budget").number(true);

});

function removerekanan(id,name){
	if ( confirm("Apakah anda yakin ingin menghapus rekanan "+ name +" ini ? ")){
		var request = $.ajax({
			url : "{{ url('/')}}/tender/remove-rekanan",
			dataType : "json",
			data : {
				id : id
			},
			type : "post"
		});

		request.done(function(data){
			if ( data.status == "0"){
				alert("Rekanan " + name + " telah dihapus ");
				window.location.reload();
			}else{
				return false;
			}
		})
	}else{
		return false;
	}
}

function requestApproveRekanan(id,name){
	if ( confirm("Apakah anda yakin ingin merilis data rekanan " + name + " ini ?")){
		var request = $.ajax({
			url : "{{ url('/')}}/tender/approval-rekanan",
			dataType : "json",
			data : {
				id : id
			},
			type : "post"
		});

		request.done(function(data){
			if ( data.status == "0"){
				alert("Data Rekanan " + name +" ini telah dirilis ");
				window.location.reload();
			}else{
				window.location.reload();
			}
		})
	}else{	
		return false;
	}
}
</script>