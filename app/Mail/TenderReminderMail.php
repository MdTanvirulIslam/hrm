<?php

namespace App\Mail;

use App\Models\Tender;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TenderReminderMail extends Mailable
{
    use Queueable, SerializesModels;

    public $tender;

    public function __construct(Tender $tender)
    {
        $this->tender = $tender;
    }

    public function build()
    {
        return $this
            ->from(
                config('mail.from.address', 'noreply@hrm.com'),
                config('mail.from.name', 'HRM System')
            )
            ->subject('Tender Submission Reminder: ' . $this->tender->tender_name)
            ->view('email.tender_reminder')
            ->with('tender', $this->tender);
    }
}
