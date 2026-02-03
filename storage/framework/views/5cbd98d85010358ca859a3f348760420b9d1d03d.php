<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Edit Invoice')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('invoice.index')); ?>"><?php echo e(__('Invoice')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Edit Invoice')); ?></li>
<?php $__env->stopSection(); ?>

<style>
    /* Ultra Compact CKEditor */
    .ck-editor-container {
        position: relative;
        width: 100%;
    }

    .ck-editor {
        width: 100% !important;
        border: 1px solid #ced4da !important;
        border-radius: 0.375rem !important;
        transition: all 0.3s ease;
    }

    /* Minimized state - takes very little space */
    .ck-editor.minimized {
        max-height: 50px !important;
    }

    .ck-editor.minimized .ck-toolbar {
        display: none !important;
    }

    .ck-editor.minimized .ck-editor__editable {
        min-height: 40px !important;
        max-height: 40px !important;
        overflow: hidden !important;
        cursor: pointer;
        border: 1px solid #dee2e6 !important;
        border-radius: 0.25rem !important;
        padding: 8px 12px !important;
        background: #f8f9fa;
        font-size: 14px;
    }

    .ck-editor.minimized .ck-editor__editable:focus {
        outline: none;
        border-color: #86b7fe !important;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    }

    /* Expanded state - full editor */
    .ck-editor.expanded {
        max-height: 250px !important;
    }

    .ck-editor.expanded .ck-editor__editable {
        min-height: 150px !important;
        max-height: 180px !important;
        overflow-y: auto !important;
        padding: 12px !important;
    }

    /* Minimize/Maximize button */
    .ck-editor-toggle {
        position: absolute;
        right: 8px;
        top: 8px;
        z-index: 1000;
        background: white;
        border: 1px solid #dee2e6;
        border-radius: 3px;
        padding: 2px 6px;
        font-size: 10px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 2px;
        color: #6c757d;
        transition: all 0.2s ease;
    }

    .ck-editor-toggle:hover {
        background: #f8f9fa;
        border-color: #adb5bd;
        color: #495057;
    }

    .ck-editor-toggle i {
        font-size: 10px;
    }

    /* Compact toolbar when expanded */
    .ck.ck-toolbar {
        padding: 4px 6px !important;
        min-height: 36px !important;
        flex-wrap: wrap !important;
        background: #f8f9fa !important;
        border-bottom: 1px solid #dee2e6 !important;
    }

    .ck.ck-button {
        min-width: 26px !important;
        min-height: 26px !important;
        padding: 3px !important;
    }

    .ck.ck-button__label {
        font-size: 12px !important;
    }

    .ck.ck-dropdown__button {
        min-width: 60px !important;
    }

    /* Make sure editor doesn't overflow table cell */
    td .ck-editor {
        max-width: 100% !important;
        margin-bottom: 0 !important;
    }

    /* Remove extra spacing in table cells */
    td {
        vertical-align: top !important;
        padding: 8px !important;
    }

    /* Ensure QTY column has proper spacing */
    #items-table td:nth-child(9) {
        padding: 8px 12px !important;
        min-width: 80px;
    }

    .quantity {
        min-width: 65px !important;
        padding: 6px 8px !important;
        text-align: center;
        box-sizing: border-box;
    }

    /* Make table responsive */
    @media (max-width: 768px) {
        #items-table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }

        .ck-editor-toggle {
            top: 4px;
            right: 4px;
        }
    }
</style>

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
                                <th width="3%"><?php echo e(__('SN')); ?></th>
                                <th width="12%"><?php echo e(__('PRODUCT NAME')); ?></th>
                                <th width="18%"><?php echo e(__('PRODUCT DESCRIPTION')); ?></th>
                                <th width="8%"><?php echo e(__('UNIT PRICE')); ?></th>
                                <th width="7%"><?php echo e(__('TAX %')); ?></th>
                                <th width="8%"><?php echo e(__('TAX AMOUNT')); ?></th>
                                <th width="7%"><?php echo e(__('VAT %')); ?></th>
                                <th width="8%"><?php echo e(__('VAT AMOUNT')); ?></th>
                                <th width="6%"><?php echo e(__('QTY')); ?></th>
                                <th width="11%"><?php echo e(__('TOTAL PRICE WITH VAT & TAX')); ?></th>
                                <th width="3%"><?php echo e(__('ACTION')); ?></th>
                                </thead>
                                <tbody id="items-body">
                                <?php $__currentLoopData = $invoice->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr class="item-row">
                                        <td class="text-center row-number"><?php echo e($index + 1); ?></td>
                                        <td>
                                            <input type="text" name="items[<?php echo e($index); ?>][product_name]"
                                                   class="form-control product-name" value="<?php echo e($item->product_name); ?>" required placeholder="Enter product name">
                                        </td>
                                        <td>
                                            <textarea name="items[<?php echo e($index); ?>][item_description]" class="form-control item-description"
                                                      rows="2" required placeholder="Click to edit description"><?php echo e($item->item_description); ?></textarea>
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
                                                    <option value="10" <?php echo e($invoice->advance_paid_type == '10' || $invoice->advance_paid_type == '10%' ? 'selected' : ''); ?>>10%</option>
                                                    <option value="20" <?php echo e($invoice->advance_paid_type == '20' || $invoice->advance_paid_type == '20%' ? 'selected' : ''); ?>>20%</option>
                                                    <option value="30" <?php echo e($invoice->advance_paid_type == '30' || $invoice->advance_paid_type == '30%' ? 'selected' : ''); ?>>30%</option>
                                                    <option value="50" <?php echo e($invoice->advance_paid_type == '50' || $invoice->advance_paid_type == '50%' ? 'selected' : ''); ?>>50%</option>
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
                                                   value="<?php echo e($term->term_description); ?>" placeholder="Enter term description">
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

        <div class="float-end mt-3">
            <button type="submit" class="btn btn-primary"><?php echo e(__('Update Invoice')); ?></button>
        </div>
        <?php echo e(Form::close()); ?>

    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

    <script>
        // helper function for cKEditor
        let editors = {};
        let editorStates = {}; // Track expanded/minimized state

        function initEditor(textarea) {
            if ($(textarea).data('editor-initialized')) return;

            // Create container
            const container = document.createElement('div');
            container.className = 'ck-editor-container';
            textarea.parentNode.insertBefore(container, textarea);
            container.appendChild(textarea);

            // Create toggle button
            const toggleBtn = document.createElement('button');
            toggleBtn.type = 'button';
            toggleBtn.className = 'ck-editor-toggle';
            toggleBtn.innerHTML = '<i class="ti ti-chevron-down"></i>';
            toggleBtn.title = 'Expand/Collapse Editor';
            container.appendChild(toggleBtn);

            // Initialize CKEditor with compact toolbar
            ClassicEditor.create(textarea, {
                toolbar: {
                    items: [
                        'heading', '|',
                        'bold', 'italic', 'underline', 'strikethrough', '|',
                        'alignment', '|',
                        'bulletedList', 'numberedList'
                    ]
                },
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3' }
                    ]
                },
                alignment: {
                    options: ['left', 'center', 'right', 'justify']
                },
                removePlugins: ['Markdown'],
                ui: {
                    viewportOffset: { top: 10 }
                }
            }).then(editor => {
                const textareaName = $(textarea).attr('name');
                editors[textareaName] = editor;
                editorStates[textareaName] = 'minimized'; // Start minimized
                $(textarea).data('editor-initialized', true);

                // Set initial minimized state
                editor.ui.view.element.classList.add('minimized');

                // Update the textarea when editor content changes
                editor.model.document.on('change:data', () => {
                    editor.updateSourceElement();
                });

                // Toggle button click handler
                toggleBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    const currentState = editorStates[textareaName];

                    if (currentState === 'minimized') {
                        // Expand
                        editor.ui.view.element.classList.remove('minimized');
                        editor.ui.view.element.classList.add('expanded');
                        editorStates[textareaName] = 'expanded';
                        toggleBtn.innerHTML = '<i class="ti ti-chevron-up"></i>';
                        toggleBtn.title = 'Collapse Editor';

                        // Focus editor
                        setTimeout(() => {
                            editor.editing.view.focus();
                            editor.ui.view.element.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                        }, 100);
                    } else {
                        // Minimize
                        editor.ui.view.element.classList.remove('expanded');
                        editor.ui.view.element.classList.add('minimized');
                        editorStates[textareaName] = 'minimized';
                        toggleBtn.innerHTML = '<i class="ti ti-chevron-down"></i>';
                        toggleBtn.title = 'Expand Editor';
                    }
                });

                // Click on minimized editor to expand
                editor.ui.view.element.addEventListener('click', (e) => {
                    if (editorStates[textareaName] === 'minimized' &&
                        e.target.closest('.ck-editor__editable')) {
                        // Expand
                        editor.ui.view.element.classList.remove('minimized');
                        editor.ui.view.element.classList.add('expanded');
                        editorStates[textareaName] = 'expanded';
                        toggleBtn.innerHTML = '<i class="ti ti-chevron-up"></i>';
                        toggleBtn.title = 'Collapse Editor';
                        editor.editing.view.focus();
                    }
                });

                // Handle editor destruction when row is removed
                $(textarea).data('editor-instance', editor);

            }).catch(error => {
                console.error('CKEditor initialization error:', error);
                // Fallback to regular textarea if CKEditor fails
                $(textarea).addClass('form-control').css('height', '40px');
            });
        }

        function destroyEditor(name) {
            if (editors[name]) {
                editors[name].destroy();
                delete editors[name];
                delete editorStates[name];
            }
        }

        $(document).ready(function() {
            let itemIndex = <?php echo e(count($invoice->items)); ?>;
            let termIndex = <?php echo e(count($invoice->terms)); ?>;

            // Initialize CKEditor for all existing items
            $('.item-description').each(function() {
                initEditor(this);
            });

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
                } else if (taxPercentage == 15) {
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
                                class="form-control product-name" required placeholder="Enter product name">
                        </td>
                        <td>
                            <textarea name="items[${itemIndex}][item_description]"
                                class="form-control item-description" rows="2" required placeholder="Click to edit description"></textarea>
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

                // Initialize CKEditor for the new textarea
                let textarea = $('#items-body tr:last').find('.item-description')[0];
                setTimeout(() => {
                    initEditor(textarea);
                }, 100);

                itemIndex++;
                updateRowNumbers();
            });

            // Remove item row
            $(document).on('click', '.remove-item-row', function() {
                if ($('.item-row').length > 1) {
                    // Destroy CKEditor instance before removing row
                    let textarea = $(this).closest('tr').find('.item-description')[0];
                    if (textarea) {
                        let editorName = $(textarea).attr('name');
                        destroyEditor(editorName);
                    }

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
                                class="form-control term-description" placeholder="Enter term description">
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

                    // Update textarea name
                    let textarea = $(this).find('.item-description');
                    let oldName = textarea.attr('name');
                    textarea.attr('name', `items[${index}][item_description]`);

                    // Update editor reference if exists
                    if (editors[oldName]) {
                        editors[`items[${index}][item_description]`] = editors[oldName];
                        delete editors[oldName];
                    }
                    if (editorStates[oldName]) {
                        editorStates[`items[${index}][item_description]`] = editorStates[oldName];
                        delete editorStates[oldName];
                    }

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
                    $('#advance_paid_fixed').css('opacity', '1');
                } else {
                    $('#advance_paid_fixed').prop('disabled', true);
                    $('#advance_paid_fixed').css('opacity', '0.6');
                    $('#advance_paid_fixed').val('');
                }
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

            // Close expanded editors when clicking outside
            $(document).on('click', function(e) {
                if (!$(e.target).closest('.ck-editor').length && !$(e.target).closest('.ck-editor-toggle').length) {
                    for (let name in editorStates) {
                        if (editorStates[name] === 'expanded' && editors[name]) {
                            editors[name].ui.view.element.classList.remove('expanded');
                            editors[name].ui.view.element.classList.add('minimized');
                            editorStates[name] = 'minimized';

                            // Update toggle button
                            const toggleBtn = editors[name].ui.view.element.nextElementSibling;
                            if (toggleBtn && toggleBtn.classList.contains('ck-editor-toggle')) {
                                toggleBtn.innerHTML = '<i class="ti ti-chevron-down"></i>';
                                toggleBtn.title = 'Expand Editor';
                            }
                        }
                    }
                }
            });

            // Form validation
            $('#invoice-form').on('submit', function(e) {
                // Ensure all CKEditor content is updated to textareas
                for (let name in editors) {
                    if (editors[name] && editors[name].updateSourceElement) {
                        editors[name].updateSourceElement();
                    }
                }

                // Basic validation
                let isValid = true;
                $('.product-name').each(function() {
                    if (!$(this).val().trim()) {
                        alert('Please fill in all product names');
                        isValid = false;
                        return false;
                    }
                });

                if (!isValid) {
                    e.preventDefault();
                }
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\hrm\resources\views/invoice/edit.blade.php ENDPATH**/ ?>