<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Invoice')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Invoice')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="<?php echo e(route('invoice.create')); ?>" class="btn btn-sm btn-primary" data-bs-toggle="tooltip"
       title="<?php echo e(__('Create Invoice')); ?>">
        <i class="ti ti-plus"></i>
    </a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                            <tr>
                                <th><?php echo e(__('Invoice Number')); ?></th>
                                <th><?php echo e(__('Invoice Date')); ?></th>
                                <th><?php echo e(__('Bill To')); ?></th>
                                <th><?php echo e(__('Grand Total')); ?></th>
                                <th><?php echo e(__('Net Payable')); ?></th>
                                <th width="200"><?php echo e(__('Action')); ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $__currentLoopData = $invoices; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $invoice): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($invoice->invoice_number); ?></td>
                                    <td><?php echo e(\Auth::user()->dateFormat($invoice->invoice_date)); ?></td>
                                    <td><?php echo e($invoice->bill_to_name); ?></td>
                                    <td><?php echo e(number_format($invoice->grand_total, 2)); ?> BDT</td>
                                    <td><?php echo e(number_format($invoice->net_payable, 2)); ?> BDT</td>
                                    <td class="Action">
                                            <span>
                                                
                                                <div class="action-btn bg-warning ms-2">
                                                    <a href="<?php echo e(route('invoice.show', $invoice->id)); ?>"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="<?php echo e(__('View')); ?>">
                                                        <i class="ti ti-eye text-white"></i>
                                                    </a>
                                                </div>

                                                
                                                <div class="action-btn bg-info ms-2">
                                                    <a href="<?php echo e(route('invoice.pdf', [$invoice->id, 'customer'])); ?>"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="<?php echo e(__('Customer Copy PDF')); ?>">
                                                        <i class="ti ti-file text-white"></i>
                                                    </a>
                                                </div>

                                                
                                                <div class="action-btn bg-secondary ms-2">
                                                    <a href="<?php echo e(route('invoice.pdf', [$invoice->id, 'office'])); ?>"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="<?php echo e(__('Office Copy PDF')); ?>">
                                                        <i class="ti ti-file-text text-white"></i>
                                                    </a>
                                                </div>

                                                
                                                <div class="action-btn bg-primary ms-2">
                                                    <a href="<?php echo e(route('invoice.edit', $invoice->id)); ?>"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="<?php echo e(__('Edit')); ?>">
                                                        <i class="ti ti-pencil text-white"></i>
                                                    </a>
                                                </div>

                                                
                                                <div class="action-btn bg-danger ms-2">
                                                    <?php echo Form::open([
                                                        'method' => 'DELETE',
                                                        'route' => ['invoice.destroy', $invoice->id],
                                                        'id' => 'delete-form-' . $invoice->id,
                                                    ]); ?>

                                                    <a href="#"
                                                       class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                                       data-bs-toggle="tooltip" title="<?php echo e(__('Delete')); ?>"
                                                       data-confirm="<?php echo e(__('Are You Sure?')); ?>"
                                                       data-text="<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                       data-confirm-yes="delete-form-<?php echo e($invoice->id); ?>">
                                                        <i class="ti ti-trash text-white"></i>
                                                    </a>
                                                    <?php echo Form::close(); ?>

                                                </div>
                                            </span>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\hrm\resources\views/invoice/index.blade.php ENDPATH**/ ?>