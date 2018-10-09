<?php

namespace Modules\Inventory\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Inventory\Entities\Inventarisir;
use Modules\Inventory\Entities\InventarisirDetail;
use Modules\Project\Entities\Project;
use Modules\Inventory\Entities\Pt;
use Modules\Inventory\Entities\Barangkeluar;
use Modules\Department\Entities\Department;
use Modules\Inventory\Entities\CreateDocument;
use Modules\User\Entities\User;
use Auth;

class InventarisirController extends Controller
{
    
    /**
     * Display a listing of the resource.
     * This Controller to create asset from barang keluar to mutasi IN and become to asset
     * @return \Illuminate\Http\Response
     */
    
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $user = Auth::user();
        $project = Project::find($request->session()->get('project_id'));
        $barangkeluar_id = is_null($request->id) ? 0 : $request->id;
        $barangkeluar = null;
        /*$inventarisirCollections = null;
    	if(!is_null($barangkeluar_id))
    	{*/
            $barangkeluar = Barangkeluar::find($barangkeluar_id);
    		$inventarisirCollections = Inventarisir::where('barangkeluar_id','=',$barangkeluar_id)->get();
    	/*}
    	else
    	{
    		$inventarisirCollections = Inventarisir::all();
    	}*/
        return view('inventory::inventarisir.index',compact('inventarisirCollections','barangkeluar','project','user'));
    }

    public function add(Request $request)
    {
    	$barangkeluar = Barangkeluar::find($request->id);
        $projectname = Project::find($request->session()->get('project_id'))->name;

        return view('inventory::inventarisir.add_mutasi_in_form', compact('barangkeluar','projectname'));
    }

    public function edit(Request $request)
    {
        $inventarisir = Inventarisir::find($request->id);
        $projects     = Project::get();
        $pts          = Pt::get();

        return view('inventarisir.edit_form', compact('inventarisir', 'projects', 'pts'));
    }

    public function addPost(Request $request)
    {
        $stat = 0;
        $barangkeluar_id = $request->barangkeluar_id;
        $getDepartment_id = Barangkeluar::find($barangkeluar_id)->permintaanbarang->department_id;
        $objBarangKeluar = Barangkeluar::find($barangkeluar_id);
        $pic_giver = $request->id_pic_giver;
        $pic_recipient = $request->id_pic_recipient;
        $date = $request->date;
        $InsertInventarisir = Inventarisir::create(
            ['barangkeluar_id'=>$barangkeluar_id,
            'id_pic_giver'=>$pic_giver,
            'id_pic_recipient'=>$pic_recipient,
            'no'=> CreateDocument::createDocumentNumber('MIN',$getDepartment_id,$request->session()->get('project_id'),Auth::user()->id),
            'date'=>$date]
        );

        if($InsertInventarisir)
        {
            
            foreach ($objBarangKeluar->barangkeluardetails as $key => $value) {
                $actionInventarisirDetail = InventarisirDetail::create([
                    'inventarisir_id'=>$InsertInventarisir->id,
                    'barangkeluar_detail_id'=>$value->id,
                    'item_id'=>$value->item_id,
                    'item_satuan_id'=>$value->item_satuan_id,
                    'quantity'=>$value->quantity
                ]);
            }
            if(isset($actionInventarisirDetail) && $actionInventarisirDetail)
            {
                $stat = 1;
            }

        }

        return response()->json(['return'=>$stat]);
    }

    public function update(Request $request)
    {
        $updateInventarisir = Inventarisir::find($request->id)
        ->update([
            'project_id' =>$request->project_id,
            'pt_id' => $request->pt_id,
            'date' =>$request->date,
            'description' => $request->description
        ]);

        if($updateInventarisir)
        {
            return redirect($to = '/inventory/inventarisir/index', $status = 302, $headers = [], $secure = null);
        }
        else
        {
            return "Failed";
        }
    }

    public function delete(Request $request)
    {
        $id = $request->id;
        $deleteInventarisir = Inventarisir::find($id)->delete();
        if($deleteInventarisir)
        {
            return "1";

        }
        else
        {
            return "Delete Failed";
        }
    }
}
