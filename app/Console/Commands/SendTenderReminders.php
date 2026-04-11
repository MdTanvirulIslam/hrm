<?php

namespace App\Console\Commands;

use App\Mail\TenderReminderMail;
use App\Models\Tender;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class SendTenderReminders extends Command
{
    protected $signature = 'tender:send-reminders';

    protected $description = 'Send reminder emails for tenders whose submission date is 3 days away';

    public function handle(): void
    {
        $targetDate = Carbon::today()->addDays(3)->format('Y-m-d');

        $tenders = Tender::where('submission_date', $targetDate)
            ->where('reminder_sent', false)
            ->whereIn('status', ['draft', 'submitted'])
            ->get();

        if ($tenders->isEmpty()) {
            $this->info('No tender reminders to send today.');
            return;
        }

        foreach ($tenders as $tender) {
            $email = $tender->creator?->email;

            if (!$email) {
                $this->warn("Skipping Tender ID {$tender->id} — creator has no email.");
                continue;
            }

            Mail::to($email)->send(new TenderReminderMail($tender));
            $tender->update(['reminder_sent' => true]);

            $this->info("Reminder sent for Tender: {$tender->tender_name} (ID: {$tender->id}) → {$email}");
        }

        $this->info('Tender reminder check completed.');
    }
}
