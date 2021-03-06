@extends('layouts.master')
@section('css')
<link href="{{ URL::asset('assets/global/plugins/datatables/datatables.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('assets/global/plugins/datatables/fixedHeader.dataTables.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css')}}" rel="stylesheet" type="text/css" />

@endsection
@section('content')
<div class="panel panel-success">
  <div class="panel-heading"><strong>Approval Barang Keluar</strong></div>
  <div class="panel-body">
    <button class="btn btn-success" type="button" id="btn_refresh"><i class="fa fa-refresh"></i> Refresh</button>
    <p/>
    <table class="table table-bordered display table_master" id="table_master">
      <thead>
        <tr>
          <th>Barang Keluar </th>
          <th>Item</th>

          <th>Qty</th>
          <th>Stock On Hand</th>
          <th>Stock Avaible</th>
          <th>Satuan</th>
          <th>Tanggal</th>
          <th></th>
        </tr>
      </thead>
    </table>
  </div>
</div>
@endsection
@section('scripts')
<script type="text/javascript" src="{{ URL::asset('assets/global/plugins/datatables/datatables.min.js')}}"></script>
<script type="text/javascript" src="{{ URL::asset('assets/global/plugins/datatables/dataTables.fixedHeader.min.js')}}"></script>
<script src="{{ URL::asset('assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js')}}" 
type="text/javascript">
</script>
<script type="text/javascript">
  var gentable = null;
  var notify = null;
  var datatable_idUI = {
    "sProcessing":   "Sedang memproses...",
    "sLengthMenu":   "Tampilkan _MENU_ entri",
    "sZeroRecords":  "[tidak ada data]",
    "sInfo":         "Menampilkan _START_ sampai _END_ dari _TOTAL_ entri",
    "sInfoEmpty":    "Menampilkan 0 sampai 0 dari 0 entri",
    "sInfoFiltered": "(disaring dari _MAX_ entri keseluruhan)",
    "sInfoPostFix":  "",
    "sSearch":       "Cari: ",
    "sUrl":          "",
    "oPaginate": {
        "sFirst":    "Pertama",
        "sPrevious": "Sebelumnya",
        "sNext":     "Selanjutnya",
        "sLast":     "Terakhir"
    }
}
  $(document).ready(function()
  {
    $('#barangkeluar').addClass('active');
    $('.panel-success').outerHeight();
    gentable = $('#table_master').DataTable({
          fixedHeader: {
            header:true,
            headerOffset: $('#navMenu').outerHeight()
          },
          "language": datatable_idUI,
          processing: true,
          ajax: "{{ url('/inventory/hod_inventory/getListApprovalBarangKeluar') }}",
          columns:[

                 { data: 'no',name: 'no',"bSortable": false},
                 { data: 'item_name',name: 'item_name',"bSortable": false},
                 
                 { data: 'total_barangkeluar_afterkonversi',name: 'total_barangkeluar_afterkonversi','className':'text-right',"bSortable": false},                 
                 { data: 'stock_afterkonversi',name: 'stock_afterkonversi',"className":"text-center",'className':'text-right',"bSortable": false},
                 { data: 'stock_avaible',name: 'stock_avaible',"className":"text-center",'className':'text-right',"bSortable": false},
                 
                 { data: 'satuan_name',name: 'satuan_name',"className":"text-center","bSortable": false },
                 { data: 'tglkeluar',name: 'tglkeluar',"className":"text-right","bSortable": false},
                {
                  "className": "action text-center",
                  "data": null,
                  "bSortable": false,
                  "defaultContent": "" +
                  "<div class='' role='group'>" +
                  "<button class='approve btn btn-info btn-xs' rel='tooltip' data-toggle='tooltip' data-placement='left' title='Confirm'><i class='fa fa-check-square'></i></button> "+
                  "<button class='details btn btn-success btn-xs' rel='tooltip' data-toggle='tooltip' data-placement='right' title='Details'><i class='fa fa-list-alt'></i></button>"+

                  "</div>"
                }
          ],
          "columnDefs": [{ "visible": false, "targets": [0] }],
          "order": [[ 0, 'asc' ]],
          "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
            api.column(0, {page:'current'} ).data().each( function ( group, i ) {
              if ( last !== group ) {
                  $(rows).eq( i ).before(
                      '<tr class="group success" rowspan="2"><td colspan="7"><strong>'+group+'</strong></td></tr>'
                  );

                  last = group;
              }
          });
            
        }
    });

    var tBody = $('#table_master tbody');

    tBody.on('click','.approve',function(){
        var data =  gentable.row($(this).parents('tr')).data();
        var barangkeluar_id = data.barangkeluar_id;

        var _datasend = {'id':barangkeluar_id,_token:$('input[name=_token]').val()};
        var _url = "{{ url('/inventory/hod_inventory/approveBarangKeluar') }}"

          $.ajax({
                type: 'POST',
                url: _url,
                data: _datasend,
                dataType: 'json',
                beforeSend:function(){
                  //code here
                  notify = new PNotify({text:'Sending Request ...'});
                },
                success:function(data){
                  if(data)
                  {
                      notify.update({
                             title: "Success",
                             text: "Approved "
                          });
                      gentable.ajax.reload();
                  }
                },
                error:function(xhr,status,errormessage)
                {
                      notify.update({
                             title: "Error",
                             text: "Terjadi Kesalahan "+xhr.statusText
                          });
                }
            });
    }).
    on('click','.details',function(){
        var data =  gentable.row($(this).parents('tr')).data();
        var barangkeluar_id = data.barangkeluar_id;
        window.location.href="{{('/hod_inventory/detailsBarangKeluar')}}"+"/"+barangkeluar_id;
    });

    $('#btn_refresh').click(function()
    {
        gentable.ajax.reload();
    });

  });
</script>
@endsection