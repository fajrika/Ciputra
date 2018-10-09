<!DOCTYPE html>
<html>
@include('user.header')
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
              <li class="breadcrumb-item"><a href="{{ url('/') }}/user/project/?id={{ $project->id or ''}}">Document</a></li>
              <li class="breadcrumb-item active">Budget</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <a href="{{ url('/') }}/user/project/?id={{ $project->id or '' }}" class="btn btn-warning">Back</a>
      <a href="{{ url('/') }}/user/budget/detail?id={{ $budget->id or '' }}&project_id={{ $project->id or ''}}" class="btn btn-primary">Detail</a>
     
    </section>

    <!-- Main content -->
    <input type="hidden" name="project_id" id="project_id" value="{{ $project->id or ''}}"/>
    <input type="hidden" name="user_id" id="user_id" value="{{ $user->id or ''}}"/>
    <input type="hidden" name="budget_id" id="budget_id" value="{{ $budget->id or ''}}"/>
    <section class="content" style="font-size:17px;">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
            <h3 class="card-title">Data Document</h3>
            
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr style="background-color: #17a2b8">
                  <th><center>Nama</center></th>
                  <th colspan="2"><center>Keterangan</center></th>
                </tr>
                </thead>
                <tbody>
                  <tr style="background-color: #ee82ee ;">
                    <td><strong><span style="color:white;font-size: 14px;">TOTAL BUDGET DEV COST</span></strong></td>
                    <td style="text-align: right;color:white;" colspan="2"><strong>Rp. {{ number_format($total_devcost)}}</strong></td>
                  </tr>
                  <tr style="background-color: grey;">
                    <td>&nbsp;</td>
                    <td style="color:white"><strong>Luas (m2)</strong></td>
                    <td style="color:white;"><strong>HPP (Rp/m2)</strong></td>
                  </tr>
                  <tr>
                    <td>Brutto</td>
                    <td style="text-align: left;">{{ number_format($project->luas)}} m2</td>
                    <td style="text-align: right;">{{ number_format($total_devcost/$project->luas) }}</td>
                  </tr>
                  <tr style="background-color: rgba(0,0,0,.05)">
                    <td>Netto</td>
                    <td style="text-align: left;">{{ number_format($project->netto)}} m2 /<br> Eff. ({{ number_format($project->efisiensi * 100,2) }}%)</td>
                    <td style="text-align: right;">{{ number_format($effisiensi_netto) }}</td>
                  </tr>
                  <tr>
                    <td style="background-color: grey;"></td>
                    <td style="background-color: grey;"></td>
                    <td style="background-color: grey;"></td>
                  </tr>
                  <tr>
                    <td>Fasilitas Kota</td>
                    <td style="text-align: right;" colspan="2">Rp. {{ number_format($budget_project) }}</td>
                  </tr>
                  <tr style="background-color: white;">
                    <td>Kawasan ( {{ count($project->kawasans)}} )</td>
                    <td style="text-align: right;" colspan="2">Rp. {{ number_format($budget_project_kawasan) }}</td>
                  </tr>
                  <tr style="background-color: #dda0dd;color:white;">
                    <td><strong>Total Budget Devcost</strong></td>
                    <td style="text-align: right;" colspan="2"><strong>Rp. {{ number_format($total_devcost) }}</strong></td>
                  </tr>
                 
                </tbody>
              </table><br>
              <div class="col-md-4">
              <table class="table table-bordered table-striped">
                <tr>
                  <td>Username</td>
                </tr>
                @if ( isset($approval->histories))
                @foreach ( $approval->histories as $key2 => $value2 )
                <tr>
                  <td>
                    @if ( $value2->approval_action_id == "6")
                    <input type="checkbox" name="approval_id" value="" id="" disabled checked> <strong>{{ $value2->user->user_name or '' }}</strong>
                    @else
                    <input type="checkbox" name="approval_id" value="" id="" disabled>{{ $value2->user->user_name or '' }}
                    @endif
                  </td>
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
<script type="text/javascript">
  function setapproved(values){

    if ( values == "6" ){
      $("#title_approval").attr("style","color:blue");
      $("#title_approval").text("These budgets will be APPROVED by You");
    }else{
      $("#title_approval").attr("style","color:red");
      $("#title_approval").text("These budgets will be REJECTED by You");
    }
    $("#btn_save_budgets").attr("data-value",values);
    
  }

  function requestApproval(){
    var description = $("#description").val()
    var request = $.ajax({
      url : "{{ url('/') }}/user/budget/approval/budget_faskot",
      data: {
          user_id : $("#user_id").val(),
          budget_id :$("#budget_id").val(),
          status : $("#btn_save_budgets").attr("data-value")
      },
      type :"get",
      dataType :"json"     
    });

    request.done(function(data){
      if ( data.status == "0"){
        window.location.reload();
      }else{
        alert("Error When Saving Approval");
        window.location.reload();
      }
    })
  }
</script>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
      </div>
      <div class="modal-body">
        <span id="title_approval"><strong></strong></span>
        <p></p>
        <div id="listdetail">
          <textarea name="description" id="description"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_save_budgets" data-value="" onclick="requestApproval()">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
