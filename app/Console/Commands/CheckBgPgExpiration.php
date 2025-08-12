<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use App\Models\BgPgModel;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\BgPgExpireNotification;

class CheckBgPgExpiration extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check:bgpg-expiry';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check BG/PG expiration and send notifications';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        $today = Carbon::today();
        $datesToCheck = [
            $today->copy()->addDays(7)->format('Y-m-d'),
            $today->copy()->addDays(30)->format('Y-m-d')
        ];

        // Debugging output
        $this->info("Checking for expiry dates: " . implode(', ', $datesToCheck));

        // Fetch records where expiry_date matches any of the specified dates
        $expiringBgPg = BgPgModel::whereIn('bg_pg_expire_date', $datesToCheck)->where('status',1)->get();

        if ($expiringBgPg->isEmpty()) {
            $this->info('No BG/PG is expiring in 7 or 30 days.');
            return;
        }

        foreach ($expiringBgPg as $bgpg) {
            Mail::to('tanvir@infosonik.com')->send(new BgPgExpireNotification($bgpg));
            $this->info("✅ Email sent for BG/PG ID: {$bgpg->bg_pg_no}, Expiry: {$bgpg->bg_pg_expire_date}");
        }

        $this->info('🎉 BG/PG expiry check completed successfully.');
    }
}
