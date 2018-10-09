<!DOCTYPE html>
<html>
@include('user.header')

<style type="text/css">
    #example3 th,
    #example3 td {
        white-space: nowrap;
    }
   
    @media only screen and (max-width: 600px) {
      .table {
        font-size :12px;
      }

      #label_rekap_penawaran {
        display: none;
      }
    
      .labeltable{
        font-size: 12px !important;
      }
     
      .card-body.tables{
        padding:0px !important;
      }

      .nav.nav-pills.ml-auto.p-2{
        font-size: 12px;
      }

      #detail_penawaran{
        font-size: 12px !important;
      }

      #example3_filter{
        display: none;
      }
    }
</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
  <!-- /.navbar -->
  @include('user.sidebar')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Project <strong>{{ $project->name or '' }}</strong></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item">Tender</li>
              <li class="breadcrumb-item active">Project {{ $tender->rab->workorder->project->first()->name or '' }}</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <a href="{{ url('/') }}\user\project" class="btn btn-warning">Back</a>
      @if ( $tender->approval->histories->where("user_id",$user->id)->first()->approval_action_id == "1")    
      <a href="#" class="btn btn-info" onclick="setapproved('6')" data-toggle="modal" data-target="#myModal4">Approve</a>
      <a href="#" class="btn btn-danger" onclick="setapproved('7')" data-toggle="modal" data-target="#myModal4">Reject</a>
      @elseif ( $tender->approval->histories->where("user_id",$user->id)->first()->approval_action_id == "6")  
      <span class="badge bg-success" style="font-size:20px;">Approved</span>  
      @endif
    </section>

    <!-- Main content -->
    <input type="hidden" name="project_id" id="project_id" value="{{ $tender->rab->workorder->project->first()->id }}"/>
    <input type="hidden" name="user_id" id="user_id" value="{{ $user->id }}"/>
    <input type="hidden" name="approval_id" id="approval_id" value="{{ $approval_id }}"/>    
    <input type="hidden" name="tender_id" id="tender_id" value="{{ $tender->id }}"/>
    <input type="hidden" name="apporval_value" id="apporval_value">
    {{ csrf_field() }}
    <section class="content" style="font-size:17px;">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Data Document <strong>Tender</strong></h3>
              
            
            </div>
            <!-- /.card-header -->
            
            <div class="card-body">
              <div class="col-md-6">
                <div class="card-body table-responsive p-0">
                  <table class="table table-hover table-striped table-bordered">
                    <tr>
                      <td style="background-color: grey;"><span style="color:white"><strong>No. Dokument</strong></span></td>
                      <td>{{ $tender->name }}</td>
                    </tr>               
                    <tr>
                      <td style="background-color: grey;"><span style="color:white"><strong>Project / Kawasan</strong></span></td>
                      <td>{{ $tender->rab->workorder->project->first()->name or '' }} </td>
                    </tr>
                     <tr>
                      <td style="background-color: grey;"><span style="color:white"><strong>Paket Pekerjaan</strong></span></td>
                      <td><a href="{{ url('/')}}/user/workorder/detail?id={{ $tender->rab->workorder->id }}">Workorder : {{ $tender->rab->workorder->no or ''}}</a></td>
                    </tr>
                    <tr>
                      <td style="background-color: grey;"><span style="color:white"><strong>RAB</strong></span></td>
                      <td><a href="{{ url('/')}}/user/rab/detail/?id={{ $tender->rab->id }}">{{ $tender->rab->no }}</a></td>
                    </tr>
                    <tr>
                      <td style="background-color: grey;"><span style="color:white"><strong>Nilai ( Exc. Ppn )</strong></span></td>
                      <td>Rp. {{ number_format($tender->rab->nilai,2) }}</td>
                    </tr>
                  </table><br>
                </div>
              </div> 

              <h3><u><center>Item Pekerjaan</center></u></h3>
              <div class="col-md-12">
                @foreach ( $tender->rab->units as $key => $value )
                  @if ( $value->asset_type != "App\\Unit")
                    <table class="table table-bordered">
                    <thead>
                      <tr style="background-color: #17a2b8 ">
                        <th>COA</th>
                        <th>Work Item</th>
                        <th>Volume</th>
                        <th>Unit</th>
                        <th>Nilai</th>
                        <th>Subtotal (Rp)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr style="background-color: grey;color:white;">
                      @foreach ( $tender->rab->pekerjaans as $key => $value )
                      @if ( $value->nilai != '')
                      <tr>
                        <td>{{ $value->itempekerjaan->code }}</td>
                        <td>{{ $value->itempekerjaan->name }}</td>
                        <td>{{ $value->volume }}</td>
                        <td>{{ $value->satuan }}</td>
                        <td>{{ number_format($value->nilai) }}</td>
                        <td>{{ number_format($value->nilai * $value->volume ) }}</td>                    
                      </tr>
                      @endif
                      @endforeach
                    </tbody>
                  </table>
                  @endif
                @endforeach
              </div>
              <h3><u><center>Rekanan</center></u></h3>
              <div class="col-md-12">
              <table class="table table-hover table-striped table-bordered">
                <tr>
                  <td colspan="4" style="background-color: grey;"><center>Daftar Rekanan</center></td>
                </tr>
                <tr style="background-color: #17a2b8 ">
                  <td style="padding-left: 0xp !important;">Rekanan</td>
                  <td>Address</td>
                  <td>Contact Number</td>
                  <td>Approval Status</td>
                </tr>
                @foreach($tender->rekanans as $key2 => $each )
                
                <tr>
                    <td>{{ $each->rekanan->group->name }} </td>  
                    <td>{{ $each->rekanan->surat_alamat }} </td>  
                    <td>{{ $each->rekanan->telp }} </td>  
                    @if ( $each->approval->histories->where("approval_id",$each->approval->id)->first()->approval_action_id == "6" )
                    <td style="background-color: green;color:white;"><strong>APPROVED</strong></td>
                    @elseif ( $each->approval->histories->where("approval_id",$each->approval->id)->first()->approval_action_id == "1" )
                    <td style="background-color: white;color:white;">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="approve{{$each->approval->id}}" id="approved{{$each->approval->id}}" value="6" checked>
                        <span class="badge bg-success"><strong>Approve</strong></span><br>
                        <input class="form-check-input" type="radio" name="approve{{$each->approval->id}}" id="rejected{{$each->approval->id}}" value="7">
                        <span class="badge bg-danger"><strong>Rejected by</strong></span><br>
                      </div>
                    </td>
                    @else
                    <td style="background-color: red;color:white;"><strong>REJECTED</strong></td>
                    @endif              
                </tr>
               
                @endforeach
              </table> 
              </div> <br>    
            <!-- ./card -->
              <div class="col-md-12">
              <table class="table table-bordered table-striped">
                <tr class="header_1">
                  <td style="width: 15%;">Username</td>
                  <td style="width: 15%;">Request At</td>
                  <td style="width: 15%;">Status</td>
                  <td style="width: 15%;">Time Left (days)</td>
                  <td>Reason</td>
                </tr>
                @if ( isset($approval->histories))
                @foreach ( $approval->histories as $key2 => $value2 )
                <tr>
                  <td>
                    @if ( $value2->approval_action_id == "6")
                    <input type="checkbox" name="approval_id" value="" id="" disabled checked> <strong>{{ $value2->user->details->first()->jabatan->name or '' }}</strong>
                    @else
                    <input type="checkbox" name="approval_id" value="" id="" disabled>{{ $value2->user->details->first()->jabatan->name or '' }}
                    @endif
                  </td>
                  <td>{{ $value2->created_at->format("d M Y ") }}</td>
                  <td>
                    @if ( $value2->approval_action_id == "7" )
                    <span class="reject"><strong>Reject</strong></span>                   
                    @elseif ( $value2->approval_action_id == "6")
                    <span class="approve"><strong>Approve</strong></span>
                    @else
                    <span class="waiting"><strong>Waiting</strong></span>
                    @endif
                  </td>
                  <td>
                    <strong>
                      @php
                      $str = $value2->created_at;
                      $str = strtotime(date("M d Y ")) - (strtotime($str));
                      echo ceil($str/3600/24);
                      @endphp
                    </strong>
                    (days)
                  </td>
                  <td>@if ( $value2->approval_action_id == "7")
                    {{ $value2->description or  '' }}
                  @endif</td>
                </tr>
                @endforeach
                @endif
              </table>
            </div>

            </div>
            <!-- /.card-body -->

          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.0-alpha
    </div>
    <strong>Copyright &copy; 2014-2018 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>


</div>
<!-- ./wrapper -->
@include('user.footer')
@include('project.user.tender_js')

<script type="text/javascript">
  $(document).ready(function() {
    $('#example3').DataTable( {
        scrollY:        300,
        scrollX:        true,
        scrollCollapse: true,
        paging:         false,
        fixedColumns:   {
          leftColumns: 1,
        }
    } );
  });
</script>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal4">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
      </div>
      <div class="modal-body">
        <span id="title_approvaled"><strong></strong></span>
        <p></p>
        <div id="listdetail">
            <textarea name="description" id="description" rows="6" cols="30"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_saved_tendered" data-value="" onclick="requestTender()">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
