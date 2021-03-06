<!-- jQuery 3 -->

<script src="{{ url('/')}}/assets/bower_components/jquery/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.7 -->

<script src="{{ url('/')}}/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- DataTables -->

<script src="{{ url('/')}}/assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>

<script src="{{ url('/')}}/assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- SlimScroll -->

<script src="{{ url('/')}}/assets/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- FastClick -->

<script src="{{ url('/')}}/assets/bower_components/fastclick/lib/fastclick.js"></script>

<!-- AdminLTE App -->

<script src="{{ url('/')}}/assets/dist/js/adminlte.min.js"></script>

<!-- AdminLTE for demo purposes -->

<script src="{{ url('/')}}/assets/dist/js/demo.js"></script>

<script src="{{ url('/')}}/assets/plugins/jquery.number.min.js" type="text/javascript"></script>

<!-- page script -->

<script>

  $(function () {

    $('#example1').DataTable();

    $('#example2').DataTable({

      'paging'      : false,

      'lengthChange': false,

      'searching'   : true,

      'ordering'    : false,

      'info'        : true,

      'autoWidth'   : false

    });

  })

</script>