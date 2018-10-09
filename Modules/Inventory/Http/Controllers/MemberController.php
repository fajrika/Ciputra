<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Inventory\Entities\Member;
use Modules\User\Entities\User;
use datatables;

class MemberController extends Controller
{
    //

    public function index()
    {
    	return view('inventory::member.index');

    }

    public function store(Request $request)
    {
        $execute = '';
        $stat = false;
        $check = Member::find($request->id);
        if($check == null)
        {
            $execute = Member::updateOrCreate([
                'member_name'=>$request->name,
                'description'=>$request->description
            ]);
        }
        else
        {
            $execute = $check->update(['member_name'=>$request->name,'description'=>$request->description]);
        }

        if($execute)
        {
            $stat = true;
        }

        return response()->json($stat);
    }

    public function delete(Request $request)
    {

        $model = Member::find($request->id);
        $status = $model->delete();
        $stat = false;
        if ($status) 
        {
            $stat = true;
        }

        return response()->json($stat);
    }

    public function getData()
    {
        $results = [];
        $members = Member::all();
        foreach ($members as $key => $value) {
            # code...
            $arr = array(
                'no'=>$key+1,
                'id'=>$value->id,
                'name'=>$value->member_name,
                'remarks'=>$value->description,
                'created_at'=>date('Y-m-d H:m:s',strtotime($value->created_at)),
                'updated_at'=>date('Y-m-d H:m:s',strtotime($value->updated_at))
            );

            array_push($results, $arr);
        }
        return datatables()->of($results)->toJson();

    }

}
