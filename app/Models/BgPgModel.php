<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BgPgModel extends Model
{
    use HasFactory;
    protected $table = 'bg_pg_models';
    protected $fillable = [
        'client_name',
        'address',
        'tender_name',
        'tender_reference_no',
        'tender_id',
        'tender_published_date',
        'bg_pg_type',
        'bank_name',
        'bg_pg_no',
        'bg_pg_date',
        'bg_pg_amount',
        'bg_pg_expire_date',
        'status',
    ];
}
