<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Invoice Details')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('invoice.index')); ?>"><?php echo e(__('Invoice')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e($invoice->invoice_number); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="<?php echo e(route('invoice.pdf', [$invoice->id, 'customer'])); ?>" class="btn btn-sm btn-warning" data-bs-toggle="tooltip"
       title="<?php echo e(__('Download Customer Copy')); ?>">
        <i class="ti ti-file"></i> <?php echo e(__('Customer Copy')); ?>

    </a>
    <a href="<?php echo e(route('invoice.pdf', [$invoice->id, 'office'])); ?>" class="btn btn-sm btn-secondary" data-bs-toggle="tooltip"
       title="<?php echo e(__('Download Office Copy')); ?>">
        <i class="ti ti-file"></i> <?php echo e(__('Office Copy')); ?>

    </a>
    <a href="<?php echo e(route('invoice.edit', $invoice->id)); ?>" class="btn btn-sm btn-primary" data-bs-toggle="tooltip"
       title="<?php echo e(__('Edit')); ?>">
        <i class="ti ti-pencil"></i>
    </a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="invoice">
                        <div class="invoice-print" id="printableArea">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="invoice-title">
                                        <h2 style="font-weight: bold;">INVOICE</h2>
                                        <div class="invoice-number">
                                            <strong><?php echo e(__('INVOICE')); ?> #:</strong> <?php echo e($invoice->invoice_number); ?><br>
                                            <strong><?php echo e(__('DATE')); ?>:</strong>
                                            <?php echo e(\Auth::user()->dateFormat($invoice->invoice_date)); ?><br>
                                            <?php if($invoice->reference_work_order): ?>
                                                <strong><?php echo e(__('Reference Work Order No')); ?>:</strong>
                                                <?php echo e($invoice->reference_work_order); ?>

                                            <?php endif; ?>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row mt-4">
                                        <div class="col-md-6">
                                            <strong><?php echo e(__('BILL TO')); ?>:</strong><br>
                                            <strong><?php echo e($invoice->bill_to_name); ?></strong><br>
                                            <?php echo nl2br(e($invoice->bill_to_address)); ?>

                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <h5><strong><?php echo e(__('Items/Service Details')); ?>:</strong></h5>
                                            <div class="table-responsive mt-3">
                                                <table class="table table-bordered">
                                                    <thead style="background-color: #f8f9fa;">
                                                    <tr>
                                                        <th width="5%" class="text-center"><?php echo e(__('SN')); ?></th>
                                                        <th width="20%"><?php echo e(__('Product Name')); ?></th>
                                                        <th width="30%"><?php echo e(__('Product Description')); ?></th>
                                                        <th width="8%" class="text-center"><?php echo e(__('Qty')); ?></th>
                                                        <th width="12%" class="text-right"><?php echo e(__('Unit Price')); ?></th>
                                                        <th width="10%" class="text-right"><?php echo e(__('VAT 10%')); ?></th>
                                                        <th width="15%" class="text-right"><?php echo e(__('Total Price')); ?></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php $__currentLoopData = $invoice->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <tr>
                                                            <td class="text-center"><?php echo e($index + 1); ?></td>
                                                            <td><?php echo e($item->product_name); ?></td>
                                                            <td><?php echo nl2br(e($item->item_description)); ?></td>
                                                            <td class="text-center"><?php echo e($item->quantity); ?></td>
                                                            <td class="text-right">
                                                                <?php echo e(number_format($item->unit_price + $item->tax_amount, 2)); ?></td>
                                                            <td class="text-right">
                                                                <?php echo e(number_format($item->vat_amount, 2)); ?>

                                                            </td>
                                                            <td class="text-right">
                                                                <?php echo e(number_format($item->total_price, 2)); ?></td>
                                                        </tr>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td colspan="6" class="text-right">
                                                            <strong><?php echo e(__('Grand Total')); ?></strong>
                                                        </td>
                                                        <td class="text-right">
                                                            <strong><?php echo e(number_format($invoice->grand_total, 2)); ?> BDT</strong>
                                                        </td>
                                                    </tr>
                                                    <?php if($invoice->advance_paid > 0): ?>
                                                        <tr>
                                                            <td colspan="6" class="text-right">
                                                                <strong><?php echo e(__('Advance Paid')); ?></strong>
                                                            </td>
                                                            <td class="text-right">
                                                                <strong><?php echo e(number_format($invoice->advance_paid, 2)); ?> BDT</strong>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="text-right">
                                                                <strong><?php echo e(__('Rest Payable Amount')); ?></strong>
                                                            </td>
                                                            <td class="text-right">
                                                                <strong><?php echo e(number_format($invoice->rest_payable, 2)); ?> BDT</strong>
                                                            </td>
                                                        </tr>
                                                    <?php endif; ?>
                                                    <tr style="background-color: #f8f9fa;">
                                                        <td colspan="6" class="text-right">
                                                            <strong><?php echo e(__('Net Payable Amount')); ?></strong>
                                                        </td>
                                                        <td class="text-right">
                                                            <strong><?php echo e(number_format($invoice->net_payable, 2)); ?> BDT</strong>
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <p><strong><?php echo e(__('Amount in word (BDT)')); ?>:</strong>
                                                <?php echo e($invoice->amount_in_words); ?></p>
                                        </div>
                                    </div>

                                    <?php if($invoice->terms->count() > 0): ?>
                                        <div class="row mt-4">
                                            <div class="col-md-12">
                                                <h5><strong><?php echo e(__('Payment Terms & Conditions')); ?>:</strong></h5>
                                                <ul class="mt-2" style="list-style-type: none; padding-left: 0;">
                                                    <?php $__currentLoopData = $invoice->terms; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $term): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li style="margin-bottom: 8px;">
                                                            <strong>-</strong> <?php echo e($term->term_description); ?>

                                                        </li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                            </div>
                                        </div>
                                    <?php endif; ?>

                                    <div class="row mt-5">
                                        <div class="col-md-12 text-end">
                                            <p><strong><?php echo e(__('Authorized Signature')); ?></strong></p>
                                            <br><br>
                                            <p>_____________________</p>
                                            <p><strong><?php echo e(__('Shodeshi Digital Solutions Ltd.')); ?></strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\hrm\resources\views/invoice/show.blade.php ENDPATH**/ ?>