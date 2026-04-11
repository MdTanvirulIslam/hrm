<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tender Submission Reminder</title>
    <style>
        body { font-family: Arial, sans-serif; color: #333; line-height: 1.6; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background: #2563eb; color: #fff; padding: 20px; border-radius: 6px 6px 0 0; }
        .header h2 { margin: 0; font-size: 20px; }
        .body { background: #f9fafb; padding: 24px; border: 1px solid #e5e7eb; border-top: none; border-radius: 0 0 6px 6px; }
        .detail-table { width: 100%; border-collapse: collapse; margin-top: 12px; }
        .detail-table th, .detail-table td { padding: 10px 14px; border: 1px solid #e5e7eb; font-size: 14px; text-align: left; }
        .detail-table th { background: #eff6ff; color: #1e40af; width: 38%; }
        .badge { display: inline-block; padding: 3px 10px; border-radius: 4px; font-size: 12px; font-weight: bold; }
        .badge-draft { background: #e5e7eb; color: #374151; }
        .badge-submitted { background: #dbeafe; color: #1d4ed8; }
        .footer { margin-top: 24px; font-size: 12px; color: #9ca3af; text-align: center; }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>&#9888; Tender Submission Reminder</h2>
        <p style="margin:4px 0 0;">Submission is due in <strong>3 days</strong></p>
    </div>
    <div class="body">
        <p>Dear Team,</p>
        <p>This is an automated reminder that the following tender has a submission deadline in <strong>3 days</strong>. Please ensure all required documents are prepared and submitted on time.</p>

        <table class="detail-table">
            <tr>
                <th>Tender Name</th>
                <td><strong>{{ $tender->tender_name }}</strong></td>
            </tr>
            @if($tender->reference_number)
            <tr>
                <th>Reference No.</th>
                <td>{{ $tender->reference_number }}</td>
            </tr>
            @endif
            <tr>
                <th>Submission Date</th>
                <td><strong style="color:#dc2626;">{{ \Carbon\Carbon::parse($tender->submission_date)->format('d M Y') }}</strong></td>
            </tr>
            @if($tender->opening_date)
            <tr>
                <th>Opening Date</th>
                <td>{{ \Carbon\Carbon::parse($tender->opening_date)->format('d M Y') }}</td>
            </tr>
            @endif
            @if($tender->estimated_value)
            <tr>
                <th>Estimated Value</th>
                <td>{{ number_format($tender->estimated_value, 2) }}</td>
            </tr>
            @endif
            <tr>
                <th>Status</th>
                <td>{{ ucfirst($tender->status) }}</td>
            </tr>
            @if($tender->description)
            <tr>
                <th>Description</th>
                <td>{{ $tender->description }}</td>
            </tr>
            @endif
        </table>

        <p style="margin-top:20px;">Please take the necessary action before the deadline.</p>
        <p>Regards,<br><strong>{{ config('app.name') }}</strong></p>
    </div>
    <div class="footer">
        This is an automated reminder from {{ config('app.name') }}. Please do not reply to this email.
    </div>
</div>
</body>
</html>
