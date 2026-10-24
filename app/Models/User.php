<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    protected $fillable = [
        'name', 'username', 'email', 'telepon', 'password', 'role', 'foto',
        'status', 'approved_by', 'approved_at', 'member_id',
        'rejected_at', 'rejected_reason',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'approved_at' => 'datetime',
            'rejected_at' => 'datetime',
        ];
    }

    // ==================== Relasi Akun ====================

    public function approver()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    public function approvedUsers()
    {
        return $this->hasMany(User::class, 'approved_by');
    }

    public function validationLogs()
    {
        return $this->hasMany(AccountValidationLog::class);
    }

    // ==================== Relasi Member (Untuk Anggota) ====================

    public function member()
    {
        return $this->belongsTo(Member::class);
    }

    // ==================== Relasi Loans ====================

    public function loans()
    {
        return $this->hasMany(Loan::class);
    }

    public function processedLoans()
    {
        return $this->hasMany(Loan::class)->where('source', 'petugas');
    }

    public function submittedLoans()
    {
        return $this->hasMany(Loan::class)->where('source', 'anggota');
    }

    public function borrowedLoans()
    {
        return $this->hasManyThrough(
            Loan::class,
            Member::class,
            'id',
            'member_id',
            'member_id',
            'id'
        );
    }

    // ==================== Relasi Returns ====================

    public function processedReturns()
    {
        return $this->hasMany(BookReturn::class);
    }

    // ==================== Relasi Cart ====================

    public function cart()
    {
        return $this->hasOne(Cart::class);
    }

    // Ambil atau buat cart untuk user ini
    public function getCart(): Cart
    {
        return $this->cart()->firstOrCreate([]);
    }

    // ==================== Relasi Denda ====================

    public function myFines()
    {
        return $this->hasManyThrough(
            Fine::class,
            Member::class,
            'id',
            'member_id',
            'member_id',
            'id'
        );
    }

    // ==================== Helper: Status ====================

    public function isApproved(): bool
    {
        return $this->status === 'approved';
    }

    public function isPending(): bool
    {
        return $this->status === 'pending';
    }

    public function isRejected(): bool
    {
        return $this->status === 'rejected';
    }

    // ==================== Helper: Role ====================

    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }

    public function isPetugas(): bool
    {
        return $this->role === 'petugas';
    }

    public function isAnggota(): bool
    {
        return $this->role === 'anggota';
    }
}