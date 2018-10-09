<?php

namespace Modules\User\Entities;

use App\CustomModel;

class UserWarehouse extends CustomModel
{
    //
    protected $table = 'user_warehouse';
    protected $fillable = ['user_id','warehouse_id'];
}
