<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;

    protected $table = 'blood_orders';
    protected $primaryKey = 'order_id';

    protected $fillable = [
        'requester_id',
        'blood_group_id',
        'date',
        'time',
        'cause',
        'place',
        'gender',
    ];

    protected $casts = [
        'date' => 'date',
    ];

    public function requester()
    {
        return $this->belongsTo(User::class, 'requester_id');
    }

    public function bloodGroup()
    {
        return $this->belongsTo(BloodGroup::class, 'blood_group_id');
    }
}
    