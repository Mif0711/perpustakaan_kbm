<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FineHistory extends Model
{
    protected $fillable = [
        'fine_id',
        'user_id',
        'jumlah_sebelum',
        'jumlah_sesudah',
        'status_sebelum',
        'status_sesudah',
        'catatan',
    ];

    public function fine()
    {
        return $this->belongsTo(Fine::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}