<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tender extends Model
{
    protected $fillable = [
        'tender_name',
        'reference_number',
        'description',
        'submission_date',
        'opening_date',
        'estimated_value',
        'status',
        'reminder_sent',
        'created_by',
    ];

    protected $dates = ['submission_date', 'opening_date'];

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function statusBadge(): string
    {
        return match ($this->status) {
            'draft'     => '<span class="badge bg-secondary">Draft</span>',
            'submitted' => '<span class="badge bg-primary">Submitted</span>',
            'awarded'   => '<span class="badge bg-success">Awarded</span>',
            'rejected'  => '<span class="badge bg-danger">Rejected</span>',
            'cancelled' => '<span class="badge bg-warning text-dark">Cancelled</span>',
            default     => '<span class="badge bg-secondary">Unknown</span>',
        };
    }

    public function daysUntilSubmission(): int
    {
        return now()->startOfDay()->diffInDays($this->submission_date, false);
    }
}
