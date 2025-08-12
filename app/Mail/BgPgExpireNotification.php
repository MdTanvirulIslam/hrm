<?php

namespace App\Mail;

use App\Models\BgPgModel;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class BgPgExpireNotification extends Mailable
{
    use Queueable, SerializesModels;

    public $bgpg;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(BgPgModel $bgpg)
    {
        $this->bgpg = $bgpg;
    }

    public function build()
    {

        return $this->subject('BG/PG Expiry Notification')
            ->view('email.bg_pg_expire') // Use the correct view path here
            ->with(['bgpg' => $this->bgpg]);
    }

    /**
     * Get the message envelope.
     *
     * @return \Illuminate\Mail\Mailables\Envelope
     */
    public function envelope()
    {
        return new Envelope(
            subject: 'Bg/Pg Expire Notification',
        );
    }

    /**
     * Get the message content definition.
     *
     * @return \Illuminate\Mail\Mailables\Content
     */
    public function content()
    {
        return new Content(
            view: 'email.bg_pg_expire',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array
     */
    public function attachments()
    {
        return [];
    }
}
