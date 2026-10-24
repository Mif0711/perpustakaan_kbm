<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = [
        'kode_buku', 'judul', 'isbn', 'category_id', 'publisher_id', 'author_id', 'shelf_id', 'tahun_terbit', 'jumlah', 'tersedia', 'cover', 'deskripsi'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }

    public function author()
    {
        return $this->belongsTo(Author::class);
    }

    // Nama function harus tetap 'shelf' agar cocok dengan pemanggilan di Controller
    public function shelf()
    {
        return $this->belongsTo(Shelve::class);
    }
}