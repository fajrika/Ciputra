<?php

namespace Modules\Approval\Entities;


use App\CustomModel;
use App\Traits\Approval;

class HistoryApprovalPermintaanbarang extends CustomModel
{
	use Approval;

    protected $dates = ['date'];
    //
    protected $fillable = ['permintaanbarang_id','item_id','item_satuan_id','stock_on_hand','quantity_butuh','stock_avaible','tanggal_butuh'];

    public function item()
    {
    	return $this->belongsTo('Modules\Inventory\Entities\Item');
    }

    public function satuan()
    {
    	return $this->belongsTo('Modules\Inventory\Entities\ItemSatuan','item_satuan_id');
    }

    public function permintaan()
    {
    	return $this->belongsTo('Modules\Inventory\Entities\Permintaanbarang','permintaanbarang_id');
    }
}
