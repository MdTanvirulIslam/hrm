<?php
// app/Models/InvoiceTerm.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InvoiceTerm extends Model
{
    protected $fillable = [
        'invoice_id',
        'row_order',
        'term_description'
    ];

    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}
