<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccountValidationLog extends Model
{
    protected $fillable = [
        'user_id', 'acted_by', 'action', 'old_role', 'new_role', 'reason',
    ];
}
