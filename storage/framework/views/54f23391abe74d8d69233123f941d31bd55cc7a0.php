<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice - <?php echo e($invoice->invoice_number); ?></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 10px;
            line-height: 1.4;
            color: #333;
            padding: 20px;
        }

        .invoice-header {
            margin-bottom: 20px;
        }

        .invoice-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .copy-type {
            text-align: right;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #666;
        }

        .invoice-info {
            margin-bottom: 20px;
        }

        .invoice-info strong {
            font-weight: bold;
        }

        .bill-to {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .bill-to strong {
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        table th,
        table td {
            border: 1px solid #ddd;
            padding: 6px;
            text-align: left;
            font-size: 9px;
        }

        table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        .text-end {
            text-align: right;
        }

        .total-row {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .amount-words {
            margin-top: 15px;
            margin-bottom: 15px;
            font-size: 10px;
        }

        .terms-section {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .terms-section h5 {
            font-size: 11px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .terms-list {
            list-style-type: none;
            padding-left: 0;
        }

        .terms-list li {
            margin-bottom: 5px;
            padding-left: 15px;
            text-indent: -15px;
            font-size: 9px;
        }

        .signature-section {
            margin-top: 60px;
            text-align: right;
        }

        .signature-line {
            display: inline-block;
            width: 200px;
            border-top: 1px solid #333;
            margin-top: 50px;
        }

        hr {
            border: 0;
            border-top: 1px solid #ddd;
            margin: 10px 0;
        }

        .company-name {
            font-weight: bold;
        }
    </style>
</head>

<body>
<div class="copy-type"><?php echo e($copyType); ?></div>

<div class="invoice-header">
    <div class="invoice-title">INVOICE</div>
</div>

<div class="invoice-info">
    <strong>INVOICE #:</strong> <?php echo e($invoice->invoice_number); ?><br>
    <strong>DATE:</strong> <?php echo e(date('d F Y', strtotime($invoice->invoice_date))); ?><br>
    <?php if($invoice->reference_work_order): ?>
        <strong>Reference Work Order No:</strong> <?php echo e($invoice->reference_work_order); ?>

    <?php endif; ?>
</div>

<hr>

<div class="bill-to">
    <strong>BILL TO:</strong><br>
    <strong><?php echo e($invoice->bill_to_name); ?></strong><br>
    <?php echo nl2br(e($invoice->bill_to_address)); ?>

</div>

<h5 style="font-size: 11px; font-weight: bold; margin-top: 20px;">Items/Service Details:</h5>

<table>
    <thead>
    <tr>
        <th width="4%" class="text-center">SN</th>
        <th width="18%">Product Name</th>
        <th width="28%">Product Description</th>
        <th width="8%" class="text-center">Qty</th>
        <th width="12%" class="text-right">Unit Price</th>
        <th width="10%" class="text-right">VAT %</th>
        <th width="20%" class="text-right">Total Price</th>
    </tr>
    </thead>
    <tbody>
    <?php $__currentLoopData = $invoice->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <tr>
            <td class="text-center"><?php echo e($index + 1); ?></td>
            <td><?php echo e($item->product_name ?? 'N/A'); ?></td>
            <td><?php echo nl2br(e($item->item_description)); ?></td>
            <td class="text-center"><?php echo e(number_format($item->quantity, 2)); ?></td>
            <td class="text-right"><?php echo e(number_format($item->unit_price, 2)); ?></td>
            <td class="text-right">
                <?php echo e(number_format($item->vat_percentage ?? 0, 2)); ?>%
                <?php if(($item->vat_amount ?? 0) > 0): ?>
                    <br>(<?php echo e(number_format($item->vat_amount, 2)); ?>)
                <?php endif; ?>
            </td>
            <td class="text-right"><?php echo e(number_format($item->total_price, 2)); ?></td>
        </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="6" class="text-right"><strong>Grand Total</strong></td>
        <td class="text-right"><strong><?php echo e(number_format($invoice->grand_total, 2)); ?> BDT</strong></td>
    </tr>
    <?php if($invoice->advance_paid > 0): ?>
        <tr>
            <td colspan="6" class="text-right"><strong>Advance Paid</strong></td>
            <td class="text-right"><strong><?php echo e(number_format($invoice->advance_paid, 2)); ?> BDT</strong></td>
        </tr>
        <tr>
            <td colspan="6" class="text-right"><strong>Rest Payable Amount</strong></td>
            <td class="text-right"><strong><?php echo e(number_format($invoice->rest_payable, 2)); ?> BDT</strong></td>
        </tr>
    <?php endif; ?>
    <tr class="total-row">
        <td colspan="6" class="text-right"><strong>Net Payable Amount</strong></td>
        <td class="text-right"><strong><?php echo e(number_format($invoice->net_payable, 2)); ?> BDT</strong></td>
    </tr>
    </tfoot>
</table>

<div class="amount-words">
    <strong>Amount in word (BDT):</strong> <?php echo e($invoice->amount_in_words); ?>

</div>

<?php if($invoice->terms->count() > 0): ?>
    <div class="terms-section">
        <h5>Payment Terms & Conditions:</h5>
        <ul class="terms-list">
            <?php $__currentLoopData = $invoice->terms; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $term): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li><strong>-</strong> <?php echo e($term->term_description); ?></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    </div>
<?php endif; ?>

<div class="signature-section">
    <p><strong>Authorized Signature</strong></p>
    <div class="signature-line"></div>
    <p class="company-name">Shodeshi Digital Solutions Ltd.</p>
</div>
</body>

</html>
<?php /**PATH D:\xampp\htdocs\hrm\resources\views/invoice/pdf.blade.php ENDPATH**/ ?>