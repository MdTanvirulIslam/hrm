<?php
// app/Models/Invoice.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class Invoice extends Model
{
    protected $fillable = [
        'invoice_number',
        'invoice_date',
        'reference_work_order',
        'bill_to_name',
        'bill_to_address',
        'grand_total',
        'advance_paid',
        'rest_payable',
        'net_payable',
        'amount_in_words',
        'advance_paid_fixed',
        'advance_paid_type',
        'created_by',
    ];

    protected $casts = [
        'invoice_date' => 'date',
    ];

    public function items()
    {
        return $this->hasMany(InvoiceItem::class)->orderBy('row_order');
    }

    public function terms()
    {
        return $this->hasMany(InvoiceTerm::class)->orderBy('row_order');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public static function generateInvoiceNumber($companyName = null, $date = null)
    {
        // If no company name is provided, return a generic number
        if (!$companyName) {
            return "SDSL-" . now()->format('dmy') . "-001";
        }

        // Extract first word from company name and convert to uppercase
        $companyPrefix = strtoupper(trim(explode(' ', $companyName)[0]));

        // Parse the date or use current date
        $date = $date ? Carbon::parse($date) : now();
        $datePart = $date->format('dmy'); // Format: 301225 for Dec 30, 2025

        // Get year and month for monthly sequence
        $year = $date->year;
        $month = $date->month;

        // Get the last invoice for this company in this month
        $lastInvoice = self::where('bill_to_name', 'LIKE', $companyPrefix . '%')
            ->whereYear('invoice_date', $year)
            ->whereMonth('invoice_date', $month)
            ->orderBy('invoice_number', 'desc')
            ->first();

        // Determine the next sequence number
        if ($lastInvoice) {
            // Extract the sequence number from the last invoice
            $invoiceParts = explode('-', $lastInvoice->invoice_number);
            if (count($invoiceParts) === 4) {
                $lastSequence = (int) $invoiceParts[3];
                $newSequence = str_pad($lastSequence + 1, 3, '0', STR_PAD_LEFT);
            } else {
                $newSequence = '001';
            }
        } else {
            $newSequence = '001';
        }

        // Format: COMPANY-SDSL-DDMMYY-SEQ
        return "{$companyPrefix}-SDSL-{$datePart}-{$newSequence}";
    }

    public static function numberToWords($number)
    {
        $number = (int) $number;

        $words = array(
            '0' => '', '1' => 'One', '2' => 'Two', '3' => 'Three', '4' => 'Four',
            '5' => 'Five', '6' => 'Six', '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
            '10' => 'Ten', '11' => 'Eleven', '12' => 'Twelve', '13' => 'Thirteen',
            '14' => 'Fourteen', '15' => 'Fifteen', '16' => 'Sixteen', '17' => 'Seventeen',
            '18' => 'Eighteen', '19' => 'Nineteen', '20' => 'Twenty', '30' => 'Thirty',
            '40' => 'Forty', '50' => 'Fifty', '60' => 'Sixty', '70' => 'Seventy',
            '80' => 'Eighty', '90' => 'Ninety'
        );

        if ($number < 21) {
            return $words[$number];
        } elseif ($number < 100) {
            $tens = $words[10 * floor($number / 10)];
            $units = $number % 10;
            return $tens . ($units ? ' ' . $words[$units] : '');
        } elseif ($number < 1000) {
            $hundreds = $words[floor($number / 100)] . ' Hundred';
            $remainder = $number % 100;
            return $hundreds . ($remainder ? ' ' . self::numberToWords($remainder) : '');
        } elseif ($number < 100000) {
            $thousands = self::numberToWords(floor($number / 1000)) . ' Thousand';
            $remainder = $number % 1000;
            return $thousands . ($remainder ? ' ' . self::numberToWords($remainder) : '');
        } elseif ($number < 10000000) {
            $lakhs = self::numberToWords(floor($number / 100000)) . ' Lac';
            $remainder = $number % 100000;
            return $lakhs . ($remainder ? ' ' . self::numberToWords($remainder) : '');
        } else {
            $crores = self::numberToWords(floor($number / 10000000)) . ' Crore';
            $remainder = $number % 10000000;
            return $crores . ($remainder ? ' ' . self::numberToWords($remainder) : '');
        }
    }
}
