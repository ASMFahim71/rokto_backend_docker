<?php

namespace App\Models;

use App\Models\Division;
use App\Models\Upazila;
use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    public function division()
    {
        return $this->belongsTo(Division::class);
    }

    public function upazilas()
    {
        return $this->hasMany(Upazila::class);
    }
}
