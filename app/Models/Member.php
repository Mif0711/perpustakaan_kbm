<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Member extends Authenticatable
{
    protected $fillable = [
        'kode_member', 'nama', 'nis_nip', 'jenis_kelamin', 'alamat', 'telepon', 'email', 'tanggal_daftar', 'status', 'password'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }

    public function loans()
    {
        return $this->hasMany(Loan::class);
    }

    public function fines()
    {
        return $this->hasMany(Fine::class);
    }

    public function cartItems()
    {
        return $this->hasMany(CartItem::class);
    }

    /**
     * Buku yang sedang menunggu persetujuan petugas.
     */
    public function pendingLoans()
    {
        return $this->loans()->where('status', 'diajukan');
    }
}
