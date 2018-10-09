<script type="application/javascript">

function printdiv(val) {
	var contents = $("#dvContents").html();
	var frame1 = $('<iframe />');
	frame1[0].name = "frame1";
	frame1.css({ "position": "absolute", "top": "-'fast'000px" });
	$("body").append(frame1);
	var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
	frameDoc.document.open();
	//Create a new HTML document.
	frameDoc.document.write('<html><head><title>'+val+' Report</title>');
	frameDoc.document.write('</head><body>');
	//Append the external CSS file.
	//frameDoc.document.write('<link href="style.css" rel="stylesheet" type="text/css" />');
	//Append the DIV contents.
	frameDoc.document.write(contents);
	frameDoc.document.write('</body></html>');
	frameDoc.document.close();
	setTimeout(function () {
		window.frames["frame1"].focus();
		window.frames["frame1"].print();
		frame1.remove();
	}, 500);
}

$(document).ready(function(){
	$(".delete-link").click(function() {
		var id = $(this).attr("id");
		var del_id = id;
		var parent = $(this).parent("td").parent("tr");
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm',
			icon: 'fa fa-warning',
			content: 'Are you sure delete Key ID ' +del_id+ ' !',
			autoClose: 'cancel|8000',
			buttons: {
				deleteUser: {
					text: 'Delete',
					btnClass: 'btn-red any-other-class',
					action: function () {
						$.post('{{ url('project/delete') }}', 
						{
							id:del_id,
							_token: token
						}, 
						function(data) {
							parent.fadeToggle('fast');
						});	
						
						$("#div_message").html('<div class="custom-alerts alert alert-warning fade in">Sucessfully delete on </div>');
					}
				},
				cancel: function () {
					
				}
			}
		});
		return false;
	});
	
	$(".edit-link").click(function() {
		var id = $(this).attr("id");
		var edit_id = id;
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm',
			icon: 'fa fa-edit',
			content: 'Are you sure edit Key ID '+edit_id+ ' !',
			autoClose: 'cancel|8000',
			buttons: {
				deleteUser: {
					text: 'Edit',
					btnClass: 'btn btn-info',
					action: function () {
						//$(".content-loader").fadeToggle('fast');
						$(".content-loader").load('{{ url('project/edit_form') }}'+'?id='+edit_id, function() {
							$(".content-loader").fadeIn('fast');
							
							$("#btn-add").hide();
							$("#btn-view").show();
						});
					}
				},
				cancel: function () {
					
				}
			}
		});
		return false;
	});
	
	$(".view-link").click(function() {
		var id = $(this).attr("id");
		var view_id = id;
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm',
			icon: 'fa fa-pencil-square',
			content: 'Are you sure want to Create Kawasans Key ID '+view_id+ ' !',
			autoClose: 'cancel|8000',
			buttons: {
				deleteUser: {
					text: 'Create',
					btnClass: 'btn green',
					action: function () {
						$("#div_content_page").fadeToggle('fast');
						$("#div_content_page").load('{{ url('project_kawasan/index') }}'+'?id='+view_id, function() {
							$("#div_content_page").fadeIn('fast');
							
						});
					}
				},
				cancel: function () {
					
				}
			}
		});
		return false;
	});

	$(".print-link").click(function() {
		var id = $(this).attr("id");
		var documentType = $(this).attr("data-value");
		var view_id = id;
		var token = $('input[name=_token]').val();
		
		$.confirm({
			title: 'Confirm',
			icon: 'fa fa-pencil-square',
			content: 'Are you sure want to Print Report? Key ID '+view_id,
			autoClose: 'cancel|8000',
			buttons: {
				deleteUser: {
					text: 'Print',
					btnClass: 'btn yellow',
					action: function () {
						
						xmlhttp = XMLHttpRequest();
						xmlhttp.open("GET", "{{ url('project/report') }}"+"?id="+view_id, false);
						xmlhttp.send();
						
						var new_tr = xmlhttp.responseText;
						
						$( new_tr ).insertAfter( '#dvCetakan' );
						
						
						printdiv('WorkOrder');
					}
				},
				cancel: function () {
					
				}
			}
		});
		return false;
	});
});
</script>