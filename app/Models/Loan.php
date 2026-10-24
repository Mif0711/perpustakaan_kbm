<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{
    protected $fillable = [
        'kode_pinjam', 'member_id', 'user_id', 'tanggal_pinjam', 'tanggal_kembali', 
        'tanggal_dikembalikan', 'status', 'catatan',
        'source', 'approved_by', 'approved_at', 'rejected_reason', 'rejected_at'
    ];

    protected function casts(): array
    {
        return [
            'approved_at' => 'datetime',
            'rejected_at' => 'datetime',
            'tanggal_pinjam' => 'date',
            'tanggal_kembali' => 'date',
            'tanggal_dikembalikan' => 'date',
        ];
    }

    public function member()
    {
        return $this->belongsTo(Member::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Relasi approver
    public function approver()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    public function details()
    {
        return $this->hasMany(LoanDetail::class);
    }

    public function fines()
    {
        return $this->hasMany(Fine::class);
    }

    public function bookReturn()
    {
        return $this->hasOne(BookReturn::class);
    }

    // Helper methods
    public function isPending(): bool
    {
        return $this->status === 'pending';
    }

    public function isRejected(): bool
    {
        return $this->status === 'rejected';
    }

    public function isFromAnggota(): bool
    {
        return $this->source === 'anggota';
    }
}