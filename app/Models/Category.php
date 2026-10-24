<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['kode_kategori', 'nama_kategori', 'deskripsi'];
    public function books() { return $this->hasMany(Book::class); }
}