@extends('layouts.admin')

@section('page-title')
    {{ __('Create Invoice') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('invoice.index') }}">{{ __('Invoice') }}</a></li>
    <li class="breadcrumb-item">{{ __('Create Invoice') }}</li>
@endsection

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

@section('content')
    <div class="">
        {{ Form::open(['route' => 'invoice.store', 'method' => 'post', 'id' => 'invoice-form']) }}
        <div class="row">
            {{-- Invoice Header --}}
            <div class="col-md-6">
                <div class="card em-card">
                    <div class="card-header">
                        <h5>{{ __('Invoice Details') }}</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                {!! Form::label('invoice_number', __('Invoice Number'), ['class' => 'form-label']) !!}
                                <span class="text-danger">*</span>
                                {!! Form::text('invoice_number', $invoiceNumber, [
                                    'class' => 'form-control',
                                    'readonly' => 'readonly',
                                    'id' => 'invoice_number',
                                    'placeholder' => 'COMPANY-SDSL-301225-001',
                                ]) !!}
                            </div>
                            <div class="form-group col-md-6">
                                {!! Form::label('invoice_date', __('Date'), ['class' => 'form-label']) !!}
                                <span class="text-danger">*</span>
                                {!! Form::date('invoice_date', date('Y-m-d'), [
                                    'class' => 'form-control',
                                    'required' => 'required',
                                    'id' => 'invoice_date',
                                ]) !!}
                            </div>
                            <div class="form-group col-md-12">
                                {!! Form::label('reference_work_order', __('Reference Work Order No'), ['class' => 'form-label']) !!}
                                {!! Form::text('reference_work_order', old('reference_work_order'), [
                                    'class' => 'form-control',
                                    'placeholder' => 'WO/M-25-4264',
                                ]) !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Bill To --}}
            <div class="col-md-6">
                <div class="card em-card">
                    <div class="card-header">
                        <h5>{{ __('Bill To') }}</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-12">
                                {!! Form::label('bill_to_name', __('Company/Client Name'), ['class' => 'form-label']) !!}
                                <span class="text-danger">*</span>
                                {!! Form::text('bill_to_name', old('bill_to_name'), [
                                    'class' => 'form-control',
                                    'required' => 'required',
                                    'id' => 'bill_to_name',
                                    'placeholder' => 'BITOPI Group',
                                ]) !!}
                            </div>
                            <div class="form-group col-md-12">
                                {!! Form::label('bill_to_address', __('Address'), ['class' => 'form-label']) !!}
                                <span class="text-danger">*</span>
                                {!! Form::textarea('bill_to_address', old('bill_to_address'), [
                                    'class' => 'form-control',
                                    'required' => 'required',
                                    'rows' => 4,
                                    'placeholder' => '822/3, Begum Rokeya Sharani, Shewrapara, Mirpur, Dhaka 1216, Bangladesh',
                                ]) !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Items/Service Details --}}
        <div class="row">
            <div class="col-md-12">
                <div class="card em-card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-10">
                                <h5>{{ __('Items/Service Details') }}</h5>
                            </div>
                            <div class="col-2 text-end">
                                <button type="button" class="btn btn-sm btn-primary" id="add-item-row">
                                    <i class="ti ti-plus"></i> {{ __('Add Row') }}
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="items-table">
                                <thead>
                                <tr>
                                    <th width="2%">{{ __('SN') }}</th>
                                    <th width="10%">{{ __('PRODUCT NAME') }}</th>
                                    <th width="18%">{{ __('PRODUCT DESCRIPTION') }}</th>
                                    <th width="8%">{{ __('UNIT PRICE') }}</th>
                                    <th width="7%">{{ __('TAX %') }}</th>
                                    <th width="8%">{{ __('TAX AMOUNT') }}</th>
                                    <th width="7%">{{ __('VAT %') }}</th>
                                    <th width="9%">{{ __('VAT AMOUNT') }}</th>
                                    <th width="5%">{{ __('QTY') }}</th>
                                    <th width="13%">{{ __('TOTAL PRICE WITH VAT & TAX') }}</th>
                                    <th width="3%">{{ __('ACTION') }}</th>
                                </tr>
                                </thead>
                                <tbody id="items-body">
                                <tr class="item-row">
                                    <td class="text-center row-number">1</td>
                                    <td>
                                        <input type="text" name="items[0][product_name]"
                                               class="form-control product-name" required
                                               placeholder="Veeam Data Platform">
                                    </td>
                                    <td>
                                        <textarea name="items[0][item_description]" class="form-control item-description"
                                                  rows="2" required placeholder="Click to edit description"></textarea>
                                    </td>
                                    <td>
                                        <input type="number" name="items[0][unit_price]" class="form-control unit-price"
                                               value="0" min="0" step="0.01" required>
                                    </td>
                                    <td>
                                        <select name="items[0][tax_percentage]" class="form-control tax-percentage">
                                            <option value="0">ITES - 0%</option>
                                            <option value="5">Hardware - 5%</option>
                                            <option value="15">AMC- 15%</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control tax-amount" value="0" readonly>
                                    </td>
                                    <td>
                                        <select name="items[0][vat_percentage]" class="form-control vat-percentage">
                                            <option value="0">0%</option>
                                            <option value="10">10%</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control vat-amount" value="0" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="items[0][quantity]" class="form-control quantity"
                                               value="1" min="0" step="1" required>
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
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="9" class="text-end"><strong>{{ __('Grand Total') }}</strong></td>
                                    <td>
                                        <input type="number" id="grand_total" class="form-control" value="0" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong>{{ __('Advance Paid') }}</strong></td>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <select name="advance_paid_type" id="advance_paid_type" class="form-control">
                                                    <option value="fixed">Fixed Amount</option>
                                                    <option value="10">10%</option>
                                                    <option value="20">20%</option>
                                                    <option value="30">30%</option>
                                                    <option value="50">50%</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="number" name="advance_paid_fixed" id="advance_paid_fixed"
                                                       class="form-control" value="0" min="0" step="0.01">
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong>{{ __('Advance Amount') }}</strong></td>
                                    <td>
                                        <input type="number" id="advance_amount" class="form-control" value="0" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong>{{ __('Rest Payable Amount') }}</strong></td>
                                    <td>
                                        <input type="number" id="rest_payable" class="form-control" value="0" readonly>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="9" class="text-end"><strong>{{ __('Net Payable Amount') }}</strong></td>
                                    <td>
                                        <input type="number" id="net_payable" class="form-control" value="0" readonly>
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

        {{-- Payment Terms & Conditions --}}
        <div class="row">
            <div class="col-md-12">
                <div class="card em-card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-10">
                                <h5>{{ __('Payment Terms & Conditions') }}</h5>
                            </div>
                            <div class="col-2 text-end">
                                <button type="button" class="btn btn-sm btn-primary" id="add-term-row">
                                    <i class="ti ti-plus"></i> {{ __('Add Row') }}
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="terms-table">
                                <thead>
                                <tr>
                                    <th width="5%">{{ __('SN') }}</th>
                                    <th width="90%">{{ __('Terms & Conditions') }}</th>
                                    <th width="5%">{{ __('Action') }}</th>
                                </tr>
                                </thead>
                                <tbody id="terms-body">
                                <tr class="term-row">
                                    <td class="text-center term-number">1</td>
                                    <td>
                                        <input type="text" name="terms[0][term_description]"
                                               class="form-control term-description"
                                               placeholder="After completion the works.">
                                    </td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-sm btn-danger remove-term-row">
                                            <i class="ti ti-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="term-row">
                                    <td class="text-center term-number">2</td>
                                    <td>
                                        <input type="text" name="terms[1][term_description]"
                                               class="form-control term-description"
                                               placeholder="Since it is considered as IT assistance, Tax is considered 0">
                                    </td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-sm btn-danger remove-term-row">
                                            <i class="ti ti-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="float-end mt-3">
            <button type="submit" class="btn btn-primary">{{ __('Create Invoice') }}</button>
        </div>
        {{ Form::close() }}
    </div>
@endsection

@push('script-page')
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
            let itemIndex = 1;
            let termIndex = 2;

            // Initialize editor for first row
            let firstTextarea = document.querySelector('.item-description');
            if (firstTextarea) {
                initEditor(firstTextarea);
            }

            // Function to generate invoice number via AJAX
            function generateInvoiceNumber() {
                let companyName = $('#bill_to_name').val().trim();
                let invoiceDate = $('#invoice_date').val();

                if (!companyName || !invoiceDate) {
                    $('#invoice_number').val('');
                    return;
                }

                // Make AJAX call to get the next invoice number
                $.ajax({
                    url: '{{ route("invoice.getInvoiceNumber") }}',
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        bill_to_name: companyName,
                        invoice_date: invoiceDate
                    },
                    success: function(response) {
                        if (response.success) {
                            $('#invoice_number').val(response.invoice_number);
                        } else {
                            console.error('Error generating invoice number:', response.message);
                        }
                    },
                    error: function(xhr) {
                        console.error('AJAX error generating invoice number:', xhr.responseText);
                    }
                });
            }

            // Calculate row total with VAT and Tax according to your formula
            function calculateRowTotal(row) {
                let unitPrice = parseFloat(row.find('.unit-price').val()) || 0;
                let taxPercentage = parseFloat(row.find('.tax-percentage').val()) || 0;
                let vatPercentage = parseFloat(row.find('.vat-percentage').val()) || 0;
                let quantity = parseFloat(row.find('.quantity').val()) || 0;
                let taxAmount = 0;

                // Calculate tax amount
                if(taxPercentage == 5){
                    taxAmount = (unitPrice * taxPercentage) / 95;
                } else if(taxPercentage == 15){
                    taxAmount = (unitPrice * taxPercentage) / 85;
                }

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

            $(document).on('change', '#invoice_date', function() {
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

            // Generate initial invoice number
            setTimeout(() => {
                if ($('#bill_to_name').val() && $('#invoice_date').val()) {
                    generateInvoiceNumber();
                }
            }, 500);

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
        });
    </script>
@endpush
