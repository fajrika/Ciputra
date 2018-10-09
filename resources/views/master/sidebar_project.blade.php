

  <header class="main-header">

    <!-- Logo -->

    <a href="#" class="logo">

      <!-- mini logo for sidebar mini 50x50 pixels -->

      <span class="logo-mini"><b>A</b></span>

      <!-- logo for regular state and mobile devices -->

      <span class="logo-lg"><b>Admin</b></span>

    </a>

    <!-- Header Navbar: style can be found in header.less -->

    <nav class="navbar navbar-static-top">

      <!-- Sidebar toggle button-->

      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">

        <span class="sr-only">Toggle navigation</span>

      </a>



    

    </nav>

  </header>

  <!-- Left side column. contains the logo and sidebar -->

  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->

    <section class="sidebar">

      <!-- Sidebar user panel -->

      <div class="user-panel">

        <div class="pull-left image">

          <img src="{{ url('/')}}/assets/dist/img/logo-ciputra_original.png" class="img-circle" alt="User Image">

          <br>

        </div>

        <div class="pull-left info">

          <p>{{ $user->user_name }}</p>

          <i class="fa fa-circle text-success"></i> Online

        </div>

      </div>

      <!-- search form -->

      <form action="#" method="get" class="sidebar-form">

        <div class="input-group">

          <input type="text" name="q" class="form-control" placeholder="Search...">

          <span class="input-group-btn">

                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>

                </button>

              </span>

        </div>

      </form>

      <!-- /.search form -->

      <!-- sidebar menu: : style can be found in sidebar.less -->

      <ul class="sidebar-menu" data-widget="tree">

        <li class="header">MAIN NAVIGATION</li>
        <li><a href="{{ url('/')}}/home">Master Data</a></li>
        <li><a href="{{ url('/')}}/project/detail/?id={{ $project->id }}">Home</a></li>
        <li class="treeview menu-open">

          <a href="#">

            <i class="fa fa-pie-chart"></i>

            <span>Master Data Proyek</span>

            <span class="pull-right-container">

              <i class="fa fa-angle-left pull-right"></i>

            </span>

          </a>

          <ul class="treeview-menu" style="display: block;">

            <li><a href="{{ url('/')}}/project/unit-type/"><i class="fa fa-circle-o"></i> Unit Type</a></li>



          </ul>

        </li>

        <li class="treeview menu-open">

          <a href="#">

            <i class="fa fa-pie-chart"></i>

            <span>Planning</span>

            <span class="pull-right-container">

              <i class="fa fa-angle-left pull-right"></i>

            </span>

          </a>

          <ul class="treeview-menu" style="display: block;">

            <li><a href="{{ url('/')}}/project/kawasan"><i class="fa fa-circle-o"></i> Kawasan</a></li>

          </ul>

        </li>        

        <li class="treeview menu-open">

          <a href="#">

            <i class="fa fa-pie-chart"></i>

            <span>Budget</span>

            <span class="pull-right-container">

              <i class="fa fa-angle-left pull-right"></i>

            </span>

          </a>

          <ul class="treeview-menu" style="display: block;">

            <li><a href="{{ url('/')}}/budget/proyek/"><i class="fa fa-circle-o"></i> Budget Global</a></li>


          </ul>

        </li>

        <li class="treeview menu-open">

          <a href="#">

            <i class="fa fa-pie-chart"></i>

            <span>Kontrak</span>

            <span class="pull-right-container">

              <i class="fa fa-angle-left pull-right"></i>

            </span>

          </a>

          <ul class="treeview-menu" style="display: block;">

            <li><a href="{{ url('/')}}/workorder/"><i class="fa fa-circle-o"></i> Workorder</a></li>

            <li><a href="{{ url('/')}}/tender/"><i class="fa fa-circle-o"></i> Tender</a></li>

            <li><a href="{{ url('/')}}/spk/"><i class="fa fa-circle-o"></i> SPK - BAP</a></li>


            <li><a href="{{ url('/')}}/voucher/"><i class="fa fa-circle-o"></i> Voucher</a></li>

          </ul>

        </li>

        <li class="treeview menu-open">

          <a href="#">

            <i class="fa fa-pie-chart"></i>

            <span>Progress Lapangan</span>

            <span class="pull-right-container">

              <i class="fa fa-angle-left pull-right"></i>

            </span>

          </a>

          <ul class="treeview-menu" style="display: block;">
              <li><a href="{{ url('/')}}/progress/"><i class="fa fa-circle-o"></i>SPK</a></li>
          </ul>

          <li class="treeview">
            <a href="#">
              <i class="fa fa-pie-chart"></i>
              <span>Purchase Request</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu" style="display: block;">
                <li><a href="{{ url('/')}}/purchaserequest/"><i class="fa fa-circle-o"></i>Tambah PR</a></li>
                <li><a href="{{ url('/')}}/tenderpurchaserequest/pengelompokan"><i class="fa fa-circle-o"></i>Pengelompokan Tender PR</a></li>
                <li><a href="{{ url('/')}}/tenderpurchaserequest/"><i class="fa fa-circle-o"></i>Tender PR</a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-pie-chart"></i>
              <span>Purchase Order</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu" style="display: block;">
                <li><a href="{{ url('/')}}/purchaseorder/"><i class="fa fa-circle-o"></i>Tambah PO</a></li>
            </ul>
          </li>

        </li>

        <li class="treeview menu-open">
          <a href="#">
            <i class="fa fa-bank"></i>
            <span>Inventory</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: block;">
            <li><a href="{{ url('/')}}/inventory/warehouse/index"><i class="fa fa-circle-o"></i> Gudang</a></li>
            <li><a href="#"> </a></li>
            <li><a href="{{ url('/')}}/inventory/permintaan_barang/index"><i class="fa fa-circle-o"></i> Permintaan Barang</a></li>
            <li><a href="{{ url('/')}}/inventory/barang_keluar/index"><i class="fa fa-circle-o"></i> Barang Keluar</a></li>
            <li><a href="{{ url('/')}}/inventory/barangmasuk_hibah/index"><i class="fa fa-circle-o"></i> Barang Masuk Hibah</a></li>
            <li><a href="{{ url('/')}}/inventory/pengembalian_barang/index"><i class="fa fa-circle-o"></i> Pengembalian Barang</a></li>
            <li><a href="{{ url('/')}}/inventory/opname/listPeriod"><i class="fa fa-circle-o"></i> Stock Opname</a></li>
            <li><a href="{{ url('/')}}/inventory/"><i class="fa fa-circle-o"></i> Laporan</a></li>
            
          </ul>
        </li>
        
        <li><a href="{{ url('/')}}/logout">Logout</a></li>
      </ul>
      
    </section>

    <!-- /.sidebar -->

  </aside>