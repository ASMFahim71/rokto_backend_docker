<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BloodGroup extends Model
{
    use HasFactory;

    protected $table = 'blood_groups';
    // protected $primaryKey = 'blood_group_id'; // Default is 'id', which matches migration

    protected $fillable = [
        'blood_group_name',
    ];

    public function orders()
    {
        return $this->hasMany(Order::class, 'blood_group_id', 'blood_group_id');
    }
}
