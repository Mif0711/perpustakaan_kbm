<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Shelve extends Model
{
    // Eksplisit menentukan nama tabel karena nama model "Shelve" 
    // dan tabel "shelves" bisa jadi tidak terbaca otomatis oleh Laravel
    protected $table = 'shelves'; 

    protected $fillable = [
        'kode_rak', 'nama_rak', 'lokasi', 'tipe', 'kapasitas', 'deskripsi'
    ];

    public function books()
    {
        return $this->hasMany(Book::class);
    }
}