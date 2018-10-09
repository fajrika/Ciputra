<?php

namespace Modules\Inventory\Entities;

use App\CustomModel;

class ItemPrice extends CustomModel
{
    public function item()
    {
        return $this->belongsTo('App\Item', 'item_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function satuan()
    {
    	return $this->belongsTo('App\ItemSatuan','item_satuan_id');
    }
}
