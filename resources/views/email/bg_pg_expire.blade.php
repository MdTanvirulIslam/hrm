<!DOCTYPE html>
<html>
<head>
    <title>BG/PG Expiry Notification</title>
</head>
<body>
<h3>BG/PG Expiry Notification</h3>
<p>Dear User,</p>
<p>The following BG/PG is expiring soon:</p>
<ul>
    <li><strong>BG/PG NO:</strong> {{ $bgpg->bg_pg_no }}</li>
    <li><strong>Expiry Date:</strong> {{ $bgpg->bg_pg_expire_date }}</li>
</ul>
<p>Please take necessary action.</p>
<footer>{{ config('app.name') }}</footer>
</body>
</html>
