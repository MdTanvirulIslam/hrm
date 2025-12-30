<?php
// app/Models/InvoiceItem.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    protected $fillable = [
        'invoice_id',
        'product_name',
        'vat_percentage',
        'row_order',
        'item_description',
        'quantity',
        'unit_price',
        'vat_amount',
        'total_price',
        'tax_percentage',
        'tax_amount',
    ];

    protected $casts = [
        'quantity' => 'decimal:2',
        'unit_price' => 'decimal:2',
        'vat_percentage' => 'decimal:2',
        'vat_amount' => 'decimal:2',
        'total_price' => 'decimal:2',
    ];

    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}
