@extends('layouts.admin')

@section('page-title')
    {{ __('Invoice Details') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('invoice.index') }}">{{ __('Invoice') }}</a></li>
    <li class="breadcrumb-item">{{ $invoice->invoice_number }}</li>
@endsection

@section('action-button')
    <a href="{{ route('invoice.pdf', [$invoice->id, 'customer']) }}" class="btn btn-sm btn-warning" data-bs-toggle="tooltip"
       title="{{ __('Download Customer Copy') }}">
        <i class="ti ti-file"></i> {{ __('Customer Copy') }}
    </a>
    <a href="{{ route('invoice.pdf', [$invoice->id, 'office']) }}" class="btn btn-sm btn-secondary" data-bs-toggle="tooltip"
       title="{{ __('Download Office Copy') }}">
        <i class="ti ti-file"></i> {{ __('Office Copy') }}
    </a>
    <a href="{{ route('invoice.edit', $invoice->id) }}" class="btn btn-sm btn-primary" data-bs-toggle="tooltip"
       title="{{ __('Edit') }}">
        <i class="ti ti-pencil"></i>
    </a>
@endsection

@section('content')
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
                                            <strong>{{ __('INVOICE') }} #:</strong> {{ $invoice->invoice_number }}<br>
                                            <strong>{{ __('DATE') }}:</strong>
                                            {{ \Auth::user()->dateFormat($invoice->invoice_date) }}<br>
                                            @if ($invoice->reference_work_order)
                                                <strong>{{ __('Reference Work Order No') }}:</strong>
                                                {{ $invoice->reference_work_order }}
                                            @endif
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row mt-4">
                                        <div class="col-md-6">
                                            <strong>{{ __('BILL TO') }}:</strong><br>
                                            <strong>{{ $invoice->bill_to_name }}</strong><br>
                                            {!! nl2br(e($invoice->bill_to_address)) !!}
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <h5><strong>{{ __('Items/Service Details') }}:</strong></h5>
                                            <div class="table-responsive mt-3">
                                                <table class="table table-bordered">
                                                    <thead style="background-color: #f8f9fa;">
                                                    <tr>
                                                        <th width="5%" class="text-center">{{ __('SN') }}</th>
                                                        <th width="20%">{{ __('Product Name') }}</th>
                                                        <th width="30%">{{ __('Product Description') }}</th>
                                                        <th width="8%" class="text-center">{{ __('Qty') }}</th>
                                                        <th width="12%" class="text-right">{{ __('Unit Price') }}</th>
                                                        <th width="10%" class="text-right">{{ __('VAT %') }}</th>
                                                        <th width="15%" class="text-right">{{ __('Total Price') }}</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach ($invoice->items as $index => $item)
                                                        <tr>
                                                            <td class="text-center">{{ $index + 1 }}</td>
                                                            <td>{{ $item->product_name }}</td>
                                                            <td>{!! nl2br(e($item->item_description)) !!}</td>
                                                            <td class="text-center">{{ $item->quantity }}</td>
                                                            <td class="text-right">
                                                                {{ number_format($item->unit_price, 2) }}</td>
                                                            <td class="text-right">
                                                                {{ $item->vat_percentage }}%
                                                                @if($item->vat_amount > 0)
                                                                    <br><small>({{ number_format($item->vat_amount, 2) }} BDT)</small>
                                                                @endif
                                                            </td>
                                                            <td class="text-right">
                                                                {{ number_format($item->total_price, 2) }}</td>
                                                        </tr>
                                                    @endforeach
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td colspan="6" class="text-right">
                                                            <strong>{{ __('Grand Total') }}</strong>
                                                        </td>
                                                        <td class="text-right">
                                                            <strong>{{ number_format($invoice->grand_total, 2) }} BDT</strong>
                                                        </td>
                                                    </tr>
                                                    @if ($invoice->advance_paid > 0)
                                                        <tr>
                                                            <td colspan="6" class="text-right">
                                                                <strong>{{ __('Advance Paid') }}</strong>
                                                            </td>
                                                            <td class="text-right">
                                                                <strong>{{ number_format($invoice->advance_paid, 2) }} BDT</strong>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="text-right">
                                                                <strong>{{ __('Rest Payable Amount') }}</strong>
                                                            </td>
                                                            <td class="text-right">
                                                                <strong>{{ number_format($invoice->rest_payable, 2) }} BDT</strong>
                                                            </td>
                                                        </tr>
                                                    @endif
                                                    <tr style="background-color: #f8f9fa;">
                                                        <td colspan="6" class="text-right">
                                                            <strong>{{ __('Net Payable Amount') }}</strong>
                                                        </td>
                                                        <td class="text-right">
                                                            <strong>{{ number_format($invoice->net_payable, 2) }} BDT</strong>
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <p><strong>{{ __('Amount in word (BDT)') }}:</strong>
                                                {{ $invoice->amount_in_words }}</p>
                                        </div>
                                    </div>

                                    @if ($invoice->terms->count() > 0)
                                        <div class="row mt-4">
                                            <div class="col-md-12">
                                                <h5><strong>{{ __('Payment Terms & Conditions') }}:</strong></h5>
                                                <ul class="mt-2" style="list-style-type: none; padding-left: 0;">
                                                    @foreach ($invoice->terms as $index => $term)
                                                        <li style="margin-bottom: 8px;">
                                                            <strong>-</strong> {{ $term->term_description }}
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        </div>
                                    @endif

                                    <div class="row mt-5">
                                        <div class="col-md-12 text-end">
                                            <p><strong>{{ __('Authorized Signature') }}</strong></p>
                                            <br><br>
                                            <p>_____________________</p>
                                            <p><strong>{{ __('Shodeshi Digital Solutions Ltd.') }}</strong></p>
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
@endsection
