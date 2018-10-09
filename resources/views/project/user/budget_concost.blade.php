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
                <tr>
                  <td rowspan="2">No.</td>       
                  <td rowspan="2">Tipe</td>
                  <td colspan="3"><center>Ukuran</center></td>      
                  <td rowspan="2">LB(m2)</td>
                  <td rowspan="2">TOTAL UNIT</td>       
                  <td rowspan="2">SUB TOTAL UNIT LB</td>
                  <td rowspan="2">H BANG / m2</td>
                  <td rowspan="2">H BANG/ unit</td>
                  <td rowspan="2">TOTAL HARGA</td>
                </tr>
                <tr style="background-color: #17a2b8">
                  <th><center>L</center></th>
                  <th><center>X</center></th>
                  <th><center>P</center></th>
                </tr>
                </thead>
                <tbody>
                  @for( $i=0; $i < count($type); $i++ )
                  <tr>
                    <td>{{ $i + 1 }}</td>
                    <td>{{ \App\UnitType::find($type[$i])->name }}</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>{{ \App\UnitType::find($type[$i])->luas_bangunan }}</td>
                    <td>{{ $i + 1 }}</td>
                    <td>{{ $i + 1 }}</td>
                    <td>{{ $i + 1 }}</td>
                    <td>{{ $i + 1 }}</td>
                    <td>{{ $i + 1 }}</td>
                  </tr>
                  @endfor
                </tbody>
              </table><br>
              <div class="col-md-4">

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
