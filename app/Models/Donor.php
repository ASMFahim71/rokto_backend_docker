<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Donor extends Model
{
    use HasFactory;

    protected $primaryKey = 'donor_id';

    protected $fillable = [
        'user_id',
        'blood_group_id',
        'last_donation_date',
        'donation_count',
        'rating',
        'is_available',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function bloodGroup()
    {
        return $this->belongsTo(BloodGroup::class);
    }
}
