<?php

namespace Modules\Inventory\Entities;

use App\CustomModel;

class Room extends CustomModel
{
    //
    protected $fillable = ['project_id','pt_id','name'];

    public function project()
    {
    	return $this->belongsTo('Modules\Inventory\Entities\Project','project_id');
    }

    public function pt()
    {

    	return $this->belongsTo('Modules\Inventory\Entities\Pt','pt_id');
    }
}
