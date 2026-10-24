<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $fillable = ['user_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function items()
    {
        return $this->hasMany(CartItem::class);
    }

    public function books()
    {
        return $this->belongsToMany(Book::class, 'cart_items')->withPivot('jumlah')->withTimestamps();
    }

    // Helper: Hitung total item di cart
    public function totalItems(): int
    {
        return $this->items()->sum('jumlah');
    }

    // Helper: Hitung jumlah judul buku berbeda di cart
    public function totalDistinctBooks(): int
    {
        return $this->items()->count();
    }
}