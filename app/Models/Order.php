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
        'hospital_name',
        'contact_number',
        'division_id',
        'district_id',
        'upazila_id',
        'is_managed',
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

    public function division()
    {
        return $this->belongsTo(Division::class, 'division_id');
    }

    public function district()
    {
        return $this->belongsTo(District::class, 'district_id');
    }

    public function upazila()
    {
        return $this->belongsTo(Upazila::class, 'upazila_id');
    }

    public function getStatusAttribute(): string
    {
        if ($this->is_managed) {
            return 'Managed';
        }

        $orderDateTime = \Carbon\Carbon::parse($this->date->format('Y-m-d') . ' ' . $this->time);

        if ($orderDateTime->isPast()) {
            return 'Expired';
        }

        return 'Pending';
    }

    public function scopeManaged($query)
    {
        return $query->where('is_managed', true);
    }

    public function scopeExpired($query)
    {
        return $query->where('is_managed', false)->where(function ($q) {
            $q->where('date', '<', now()->toDateString())
                ->orWhere(function ($q) {
                    $q->where('date', '=', now()->toDateString())
                        ->where('time', '<', now()->format('H:i:s'));
                });
        });
    }

    public function scopeActive($query)
    {
        return $query->where('is_managed', false)->where(function ($q) {
            $q->where('date', '>', now()->toDateString())
                ->orWhere(function ($q) {
                    $q->where('date', '=', now()->toDateString())
                        ->where('time', '>=', now()->format('H:i:s'));
                });
        });
    }
}
