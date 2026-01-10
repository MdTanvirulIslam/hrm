<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Edit Invoice')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('invoice.index')); ?>"><?php echo e(__('Invoice')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Edit Invoice')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="">
        <?php if($errors->any()): ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <h4 class="alert-heading">Validation Errors:</h4>
                <ul>
                    <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li><?php echo e($error); ?></li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <?php if(session('error')): ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <?php echo e(session('error')); ?>

                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <?php if(session('success')): ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <?php echo e(session('success')); ?>

                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>
        <?php echo e(Form::model($invoice, ['route' => ['invoice.update', $invoice->id], 'method' => 'PUT', 'id' => 'invoice-form'])); ?>

        <div class="row">
            
            <div class="col-md-6">
                <div class="card em-card">
                    <div class="card-header">
                        <h5><?php echo e(__('Invoice Details')); ?></h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <?php echo Form::label('invoice_number', __('Invoice Number'), ['class' => 'form-label']); ?>

                                <span class="text-danger">*</span>
                                <?php echo Form::text('invoice_number', null, [
                                    'class' => 'form-control',
                                    'readonly' => 'readonly',
                                ]); ?>

                            </div>
                            <div class="form-group col-md-6">
                                <?php echo Form::label('invoice_date', __('Date'), ['class' => 'form-label']); ?>

                                <span class="text-danger">*</span>
                                <input type="date"
                                       name="invoice_date"
                                       class="form-control"
                                       value="<?php echo e($invoice->invoice_date ? $invoice->invoice_date->format('Y-m-d') : ''); ?>"
                                       required>
                            </div>
                            <div class="form-group col-md-12">
                                <?php echo Form::label('reference_work_order', __('Reference Work Order No'), ['class' => 'form-label']); ?>

                                <?php echo Form::text('reference_work_order', null, [
                                    'class' => 'form-control',
                                    'placeholder' => 'WO/M-25-4264',
                                ]); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            
            <div class="col-md-6">
                <div class="card em-card">
                    <div class="card-header">
                        <h5><?php echo e(__('Bill To')); ?></h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <?php echo Form::label('bill_to_name', __('Company/Client Name'), ['class' => 'form-label']); ?>

                                <span class="text-danger">*</span>
                                <?php echo Form::text('bill_to_name', null, [
                                    'class' => 'form-control',
                                    'required' => 'required',
                                ]); ?>

                            </div>
                            <div class="form-group col-md-12">
                                <?php echo Form::label('bill_to_address', __('Address'), ['class' => 'form-label']); ?>

                                <span class="text-danger">*</span>
                                <?php echo Form::textarea('bill_to_address', null, [
                                    'class' => 'form-control',
                                    'required' => 'required',
                                    'rows' => 4,
                                ]); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="row">
            <div class="col-md-12">
                <div class="card em-card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-10">
                                <h5><?php echo e(__('Items/Service Details')); ?></h5>
                            </div>
                            <div class="col-2 text-end">
                                <button type="button" class="btn btn-sm btn-primary" id="add-item-row">
                                    <i class="ti ti-plus"></i> <?php echo e(__('Add Row')); ?>

                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="items-table">
                                <thead>
                                <tr>
                                    <th width="3%"><?php echo e(__('SN')); ?></th>
                                    <th width="12%"><?php echo e(__('PRODUCT NAME')); ?></th>
                                    <th width="20%"><?php echo e(__('PRODUCT DESCRIPTION')); ?></th>
                                    <th width="8%"><?php echo e(__('UNIT PRICE')); ?></th>
                                    <th width="8%"><?php echo e(__('TAX %')); ?></th>
                                    <th width="8%"><?php echo e(__('TAX AMOUNT')); ?></th>
                                    <th width="8%"><?php echo e(__('VAT %')); ?></th>
                                    <th width="8%"><?php echo e(__('VAT AMOUNT')); ?></th>
                                    <th width="10%"><?php echo e(__('QTY')); ?></th>
                                    <th width="9%"><?php echo e(__('TOTAL PRICE WITH VAT & TAX')); ?></th>
                                    <th width="2%"><?php echo e(__('ACTION')); ?></th>
                                </tr>
                                </thead>
                                <tbody id="items-body">
                                <?php $__currentLoopData = $invoice->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr class="item-row">
                                        <td class="text-center row-number"><?php echo e($index + 1); ?></td>
                                        <td>
                                            <input type="text" name="items[<?php echo e($index); ?>][product_name]"
                                                   class="form-control product-name" value="<?php echo e($item->product_name); ?>" required>
                                        </td>
                                        <td>
                                                <textarea name="items[<?php echo e($index); ?>][item_description]" class="form-control item-description"
                                                          rows="2" required><?php echo e($item->item_description); ?></textarea>
                                        </td>
                                        <td>
                                            <input type="number" name="items[<?php echo e($index); ?>][unit_price]"
                                                   class="form-control unit-price" value="<?php echo e($item->unit_price); ?>"
                                                   min="0" step="0.01" required>
                                        </td>
                                        <td>
                                            <select name="items[<?php echo e($index); ?>][tax_percentage]" class="form-control tax-percentage">
                                                <option value="0" <?php echo e($item->tax_percentage == 0 ? 'selected' : ''); ?>>ITES - 0%</option>
                                                <option value="5" <?php echo e($item->tax_percentage == 5 ? 'selected' : ''); ?>>Hardware - 5%</option>
                                                <option value="15" <?php echo e($item->tax_percentage == 15 ? 'selected' : ''); ?>>AMC- 15%</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="number" class="form-control tax-amount"
                                                   value="<?php echo e($item->tax_amount); ?>" readonly>
                                        </td>
                                        <td>
                                            <select name="items[<?php echo e($index); ?>][vat_percentage]" class="form-control vat-percentage">
                                                <option value="0" <?php echo e($item->vat_percentage == 0 ? 'selected' : ''); ?>>0%</option>
                                                <option value="10" <?php echo e($item->vat_percentage == 10 ? 'selected' : ''); ?>>10%</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="number" class="form-control vat-amount"
                                                   value="<?php echo e($item->vat_amount); ?>" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="items[<?php echo e($index); ?>][quantity]"
                                                   class="form-control quantity" value="<?php echo e($item->quantity); ?>" min="0"
                                                   step="1" required>
                                        </td>
                                        <td>
                                            <input type="number" class="form-control total-price"
                                                   value="<?php echo e($item->total_price); ?>" readonly>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-sm btn-danger remove-item-row">
                                                <i class="ti ti-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="9" class="text-end"><strong><?php echo e(__('Grand Total')); ?></strong></td>
                                    <td>
                                        <input type="number" id="grand_total" class="form-control"
                                               value="<?php echo e($invoice->grand_total); ?>" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong><?php echo e(__('Advance Paid')); ?></strong></td>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <select name="advance_paid_type" id="advance_paid_type" class="form-control">
                                                    <option value="fixed" <?php echo e($invoice->advance_paid_type == 'fixed' ? 'selected' : ''); ?>>Fixed Amount</option>
                                                    <option value="10%" <?php echo e($invoice->advance_paid_type == '10%' ? 'selected' : ''); ?>>10%</option>
                                                    <option value="20%" <?php echo e($invoice->advance_paid_type == '20%' ? 'selected' : ''); ?>>20%</option>
                                                    <option value="30%" <?php echo e($invoice->advance_paid_type == '30%' ? 'selected' : ''); ?>>30%</option>
                                                    <option value="50%" <?php echo e($invoice->advance_paid_type == '50%' ? 'selected' : ''); ?>>50%</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="number" name="advance_paid_fixed" id="advance_paid_fixed"
                                                       class="form-control" value="<?php echo e($invoice->advance_paid_fixed); ?>" min="0" step="0.01">
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong><?php echo e(__('Advance Amount')); ?></strong></td>
                                    <td>
                                        <input type="number" id="advance_amount" class="form-control"
                                               value="<?php echo e($invoice->advance_paid); ?>" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong><?php echo e(__('Rest Payable Amount')); ?></strong></td>
                                    <td>
                                        <input type="number" id="rest_payable" class="form-control"
                                               value="<?php echo e($invoice->rest_payable); ?>" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong><?php echo e(__('Net Payable Amount')); ?></strong></td>
                                    <td>
                                        <input type="number" id="net_payable" class="form-control"
                                               value="<?php echo e($invoice->net_payable); ?>" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="row">
            <div class="col-md-12">
                <div class="card em-card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-10">
                                <h5><?php echo e(__('Payment Terms & Conditions')); ?></h5>
                            </div>
                            <div class="col-2 text-end">
                                <button type="button" class="btn btn-sm btn-primary" id="add-term-row">
                                    <i class="ti ti-plus"></i> <?php echo e(__('Add Row')); ?>

                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="terms-table">
                                <thead>
                                <tr>
                                    <th width="5%"><?php echo e(__('SN')); ?></th>
                                    <th width="90%"><?php echo e(__('Terms & Conditions')); ?></th>
                                    <th width="5%"><?php echo e(__('Action')); ?></th>
                                </tr>
                                </thead>
                                <tbody id="terms-body">
                                <?php $__currentLoopData = $invoice->terms; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $term): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr class="term-row">
                                        <td class="text-center term-number"><?php echo e($index + 1); ?></td>
                                        <td>
                                            <input type="text" name="terms[<?php echo e($index); ?>][term_description]"
                                                   class="form-control term-description"
                                                   value="<?php echo e($term->term_description); ?>">
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-sm btn-danger remove-term-row">
                                                <i class="ti ti-trash"></i>
                                            </button>
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

        <div class="float-end">
            <button type="submit" class="btn btn-primary"><?php echo e(__('Update Invoice')); ?></button>
        </div>
        <?php echo e(Form::close()); ?>

    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
    <script>
        $(document).ready(function() {
            let itemIndex = <?php echo e(count($invoice->items)); ?>;
            let termIndex = <?php echo e(count($invoice->terms)); ?>;

            // Calculate row total with VAT and Tax according to your formula
            function calculateRowTotal(row) {
                let unitPrice = parseFloat(row.find('.unit-price').val()) || 0;
                let taxPercentage = parseFloat(row.find('.tax-percentage').val()) || 0;
                let vatPercentage = parseFloat(row.find('.vat-percentage').val()) || 0;
                let quantity = parseFloat(row.find('.quantity').val()) || 0;
                let taxAmount = 0;

                // Calculate tax amount based on percentage
                if (taxPercentage == 5) {
                    taxAmount = (unitPrice * taxPercentage) / 95;
                }
                if (taxPercentage == 15) {
                    taxAmount = (unitPrice * taxPercentage) / 85;
                }
                // For 0% tax, taxAmount remains 0

                // Calculate amount after tax
                let amountAfterTax = unitPrice + taxAmount;

                // Calculate VAT amount
                let vatAmount = (amountAfterTax * vatPercentage) / 100;

                // Calculate amount after VAT
                let amountAfterVat = amountAfterTax + vatAmount;

                // Calculate total price
                let totalPrice = amountAfterVat * quantity;

                // Update fields
                row.find('.tax-amount').val(taxAmount.toFixed(2));
                row.find('.vat-amount').val(vatAmount.toFixed(2));
                row.find('.total-price').val(totalPrice.toFixed(2));
            }

            // Calculate all totals
            function calculateTotals() {
                let grandTotal = 0;

                $('.item-row').each(function() {
                    calculateRowTotal($(this));
                    let rowTotal = parseFloat($(this).find('.total-price').val()) || 0;
                    grandTotal += rowTotal;
                });

                $('#grand_total').val(grandTotal.toFixed(2));

                // Calculate advance payment
                let advanceType = $('#advance_paid_type').val();
                let advanceAmount = 0;

                if (advanceType === 'fixed') {
                    advanceAmount = parseFloat($('#advance_paid_fixed').val()) || 0;
                } else {
                    let advancePercentage = parseFloat(advanceType) || 0;
                    advanceAmount = (grandTotal * advancePercentage) / 100;
                    $('#advance_paid_fixed').val(advanceAmount.toFixed(2));
                }

                $('#advance_amount').val(advanceAmount.toFixed(2));

                let restPayable = grandTotal - advanceAmount;
                let netPayable = restPayable;

                $('#rest_payable').val(restPayable.toFixed(2));
                $('#net_payable').val(netPayable.toFixed(2));
            }

            // Add item row
            $('#add-item-row').click(function() {
                let newRow = `
                    <tr class="item-row">
                        <td class="text-center row-number">${itemIndex + 1}</td>
                        <td>
                            <input type="text" name="items[${itemIndex}][product_name]"
                                class="form-control product-name" required>
                        </td>
                        <td>
                            <textarea name="items[${itemIndex}][item_description]"
                                class="form-control item-description" rows="2" required></textarea>
                        </td>
                        <td>
                            <input type="number" name="items[${itemIndex}][unit_price]"
                                class="form-control unit-price" value="0" min="0" step="0.01" required>
                        </td>
                        <td>
                            <select name="items[${itemIndex}][tax_percentage]" class="form-control tax-percentage">
                                <option value="0">ITES - 0%</option>
                                <option value="5">Hardware - 5%</option>
                                <option value="15">AMC- 15%</option>
                            </select>
                        </td>
                        <td>
                            <input type="number" class="form-control tax-amount" value="0" readonly>
                        </td>
                        <td>
                            <select name="items[${itemIndex}][vat_percentage]" class="form-control vat-percentage">
                                <option value="0">0%</option>
                                <option value="10">10%</option>
                            </select>
                        </td>
                        <td>
                            <input type="number" class="form-control vat-amount" value="0" readonly>
                        </td>
                        <td>
                            <input type="number" name="items[${itemIndex}][quantity]"
                                class="form-control quantity" value="1" min="0" step="1" required>
                        </td>
                        <td>
                            <input type="number" class="form-control total-price" value="0" readonly>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-danger remove-item-row">
                                <i class="ti ti-trash"></i>
                            </button>
                        </td>
                    </tr>
                `;
                $('#items-body').append(newRow);
                itemIndex++;
                updateRowNumbers();
            });

            // Remove item row
            $(document).on('click', '.remove-item-row', function() {
                if ($('.item-row').length > 1) {
                    $(this).closest('tr').remove();
                    updateRowNumbers();
                    calculateTotals();
                } else {
                    alert('At least one item is required!');
                }
            });

            // Add term row
            $('#add-term-row').click(function() {
                let newRow = `
                    <tr class="term-row">
                        <td class="text-center term-number">${termIndex + 1}</td>
                        <td>
                            <input type="text" name="terms[${termIndex}][term_description]"
                                class="form-control term-description">
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-danger remove-term-row">
                                <i class="ti ti-trash"></i>
                            </button>
                        </td>
                    </tr>
                `;
                $('#terms-body').append(newRow);
                termIndex++;
                updateTermNumbers();
            });

            // Remove term row
            $(document).on('click', '.remove-term-row', function() {
                $(this).closest('tr').remove();
                updateTermNumbers();
            });

            // Update row numbers
            function updateRowNumbers() {
                $('#items-body .item-row').each(function(index) {
                    $(this).find('.row-number').text(index + 1);
                    $(this).find('.product-name').attr('name', `items[${index}][product_name]`);
                    $(this).find('.item-description').attr('name', `items[${index}][item_description]`);
                    $(this).find('.unit-price').attr('name', `items[${index}][unit_price]`);
                    $(this).find('.tax-percentage').attr('name', `items[${index}][tax_percentage]`);
                    $(this).find('.vat-percentage').attr('name', `items[${index}][vat_percentage]`);
                    $(this).find('.quantity').attr('name', `items[${index}][quantity]`);
                });
                itemIndex = $('#items-body .item-row').length;
            }

            // Update term numbers
            function updateTermNumbers() {
                $('#terms-body .term-row').each(function(index) {
                    $(this).find('.term-number').text(index + 1);
                    $(this).find('.term-description').attr('name', `terms[${index}][term_description]`);
                });
                termIndex = $('#terms-body .term-row').length;
            }

            // Toggle fixed amount field
            function toggleFixedAmountField() {
                if ($('#advance_paid_type').val() === 'fixed') {
                    $('#advance_paid_fixed').prop('disabled', false);
                } else {
                    $('#advance_paid_fixed').prop('disabled', true);
                }
            }

            // Function to generate invoice number (for consistency with create page)
            function generateInvoiceNumber() {
                let companyName = $('#bill_to_name').val().trim();
                let invoiceDate = $('input[name="invoice_date"]').val();

                if (!companyName || !invoiceDate) {
                    return;
                }

                // Get first word from company name
                let companyPrefix = companyName.split(' ')[0].toUpperCase();

                // Format date to DDMMYY
                let dateObj = new Date(invoiceDate);
                let day = String(dateObj.getDate()).padStart(2, '0');
                let month = String(dateObj.getMonth() + 1).padStart(2, '0');
                let year = String(dateObj.getFullYear()).slice(-2);
                let datePart = day + month + year;

                // Get the current invoice number
                let currentInvoiceNumber = $('#invoice_number').val();
                let sequence = '001';

                // If we already have an invoice number with the same prefix and date part, keep the sequence
                if (currentInvoiceNumber) {
                    let parts = currentInvoiceNumber.split('-');
                    if (parts.length === 4) {
                        sequence = parts[3];
                    }
                }

                // Generate new invoice number
                let invoiceNumber = companyPrefix + '-SDSL-' + datePart + '-' + sequence;
                $('#invoice_number').val(invoiceNumber);
            }

            // Generate invoice number when company name or date changes
            $(document).on('input', '#bill_to_name', function() {
                generateInvoiceNumber();
            });

            $(document).on('change', 'input[name="invoice_date"]', function() {
                generateInvoiceNumber();
            });

            // Calculate on input change
            $(document).on('input change', '.unit-price, .tax-percentage, .vat-percentage, .quantity, #advance_paid_type, #advance_paid_fixed', function() {
                if ($(this).attr('id') === 'advance_paid_type') {
                    toggleFixedAmountField();
                }
                calculateTotals();
            });

            // Initial setup
            toggleFixedAmountField();
            calculateTotals();

            // Generate invoice number on page load (for consistency)
            setTimeout(() => {
                generateInvoiceNumber();
            }, 100);


        });

        $('#invoice-form').on('submit', function(e) {
            console.log('Form is being submitted');
            console.log('Form data:', $(this).serialize());

            // Check if there are any validation errors
            let hasErrors = false;
            $('.item-row').each(function() {
                let productName = $(this).find('.product-name').val();
                let itemDesc = $(this).find('.item-description').val();
                let unitPrice = $(this).find('.unit-price').val();
                let quantity = $(this).find('.quantity').val();

                if (!productName || !itemDesc || !unitPrice || !quantity) {
                    hasErrors = true;
                    console.error('Row has missing required fields', {
                        productName, itemDesc, unitPrice, quantity
                    });
                }
            });

            if (hasErrors) {
                e.preventDefault();
                alert('Please fill in all required fields');
                return false;
            }
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\hrm\resources\views/invoice/edit.blade.php ENDPATH**/ ?>