<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="icon" href="../../favicon.ico">

    <title>HOD</title>
    <!-- Bootstrap core CSS -->
     <link rel="stylesheet" href="{{ url('/') }}/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
  

    <!-- Font Awesome -->

    <link rel="stylesheet" href="{{ url('/') }}/assets/bower_components/font-awesome/css/font-awesome.min.css">
     <link href="{{ URL::asset('assets/global/plugins/pnotify/dist/pnotify.css')}}" rel="stylesheet" type="text/css" />
     <link href="{{ URL::asset('assets/global/plugins/pnotify/dist/pnotify.brighttheme.css')}}" rel="stylesheet" type="text/css" />
     <link href="{{ URL::asset('assets/global/plugins/pnotify/dist/pnotify.buttons.css')}}" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template -->
    <style>
        body {
          min-height: 2000px;
          padding-top: 60px;
        }
        .push-right{
            text-align: right;
            padding-right: 50% !important;
        }
        .text-center{
            text-align: center;
          }
        .text-right{
            text-align: right;
        }
        .table_master > thead{
          background-color: #3FD5C0;
        }
    </style>
    @yield('css')
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav id="navMenu" class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">HOD Gudang</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="{{ url('/') }}">Home</a></li>
            <!--li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li-->
            <li class="dropdown" id="permintaan">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Permintaan Barang <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="{{ url('/inventory/hod_inventory/approval_permintaan') }}">Approval Permintaan</a></li>
                <li><a href="{{ url('/inventory/hod_inventory/daftar_permintaanbarang') }}">Daftar Permintaan</a></li>
              </ul>
            </li>
            <li class="dropdown" id="barangkeluar">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Barang Keluar <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="{{ url('/inventory/hod_inventory/approval_barangkeluar') }}">Approval Barang Keluar</a></li>
                <li><a href="{{ url('/inventory/hod_inventory/daftar_barangkeluar') }}">Daftar Barang Keluar</a></li>
              </ul>
            </li>
            <li class="dropdown" id="barangmasuk">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Barang Masuk <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="{{ url('/inventory/hod_inventory/approval_barangmasukhibah') }}">Approval Barang Masuk</a></li>
                <li><a href="{{ url('/inventory/hod_inventory/daftar_barangmasukhibah') }}">Daftar Barang Masuk</a></li>
              </ul>
            </li>
            <li class="dropdown" id="mutasiout">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mutasi Out <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="{{ url('/inventory/hod_inventory/approvalMutasiOut') }}">Approval Mutasi Out</a></li>
                <li><a href="{{ url('/inventory/hod_inventory/daftarMutasiOut') }}">Daftar Mutasi Out</a></li>
              </ul>
            </li>
            <li class="dropdown" id="mutasiin">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mutasi In <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="{{ url('/inventory/hod_inventory/approvalMutasiIn') }}">Approval Mutasi In</a></li>
                <li><a href="{{ url('/inventory/hod_inventory/DaftarMutasiIn') }}">Daftar Mutasi In</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="{{ url('/inventory/inventory/pengembalianbarang') }}"></a></li>
            <li class="dropdown" id="pengembalianbarang">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pengembalian Barang <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="{{ url('/inventory/hod_inventory/approval_pengembalianbarang') }}">Approval Pengembalian Barang</a></li>
                <li><a href="{{ url('/inventory/hod_inventory/daftar_pengembalianbarang') }}">Daftar Pengembalian Barang</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">
      <br/>
      <!-- Main component for a primary marketing message or call to action -->
      @yield('content')

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <script src="{{ url('/')}}/assets/bower_components/jquery/dist/jquery.min.js"></script>
  <!-- Latest compiled and minified JavaScript -->
<script src="{{ url('/')}}/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
   <script src="{{ URL::asset('assets/global/plugins/pnotify/dist/pnotify.js')}}" type="text/javascript"></script>
  <script src="{{ URL::asset('assets/global/plugins/pnotify/dist/pnotify.animate.js')}}" type="text/javascript">
  </script>
  <script src="{{ URL::asset('assets/global/plugins/pnotify/dist/pnotify.buttons.js')}}" type="text/javascript"></script>
   <script type="text/javascript">
       $.ajaxSetup({
          headers: {
              'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
          }
      });
        $('body').tooltip({
          selector: '[rel=tooltip]'
        });

      $(document).ready(function()
      {
        $('.navbar-nav').on('click','li',function()
        {
            $('.navbar-nav li.active').removeClass('active');
            $(this).addClass('active');
        });
      });
   </script>
   @yield('scripts')
  </body>
</html>
