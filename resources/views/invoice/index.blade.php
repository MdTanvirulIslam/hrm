@extends('layouts.admin')

@section('page-title')
    {{ __('Manage Invoice') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Invoice') }}</li>
@endsection

@section('action-button')
    <a href="{{ route('invoice.create') }}" class="btn btn-sm btn-primary" data-bs-toggle="tooltip"
       title="{{ __('Create Invoice') }}">
        <i class="ti ti-plus"></i>
    </a>
@endsection

@section('content')
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                            <tr>
                                <th>{{ __('Invoice Number') }}</th>
                                <th>{{ __('Invoice Date') }}</th>
                                <th>{{ __('Bill To') }}</th>
                                <th>{{ __('Grand Total') }}</th>
                                <th>{{ __('Net Payable') }}</th>
                                <th width="200">{{ __('Action') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($invoices as $invoice)
                                <tr>
                                    <td>{{ $invoice->invoice_number }}</td>
                                    <td>{{ \Auth::user()->dateFormat($invoice->invoice_date) }}</td>
                                    <td>{{ $invoice->bill_to_name }}</td>
                                    <td>{{ number_format($invoice->grand_total, 2) }} BDT</td>
                                    <td>{{ number_format($invoice->net_payable, 2) }} BDT</td>
                                    <td class="Action">
                                            <span>
                                                {{-- View --}}
                                                <div class="action-btn bg-warning ms-2">
                                                    <a href="{{ route('invoice.show', $invoice->id) }}"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="{{ __('View') }}">
                                                        <i class="ti ti-eye text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Customer Copy PDF --}}
                                                <div class="action-btn bg-info ms-2">
                                                    <a href="{{ route('invoice.pdf', [$invoice->id, 'customer']) }}"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="{{ __('Customer Copy PDF') }}">
                                                        <i class="ti ti-file text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Office Copy PDF --}}
                                                <div class="action-btn bg-secondary ms-2">
                                                    <a href="{{ route('invoice.pdf', [$invoice->id, 'office']) }}"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="{{ __('Office Copy PDF') }}">
                                                        <i class="ti ti-file-text text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Edit --}}
                                                <div class="action-btn bg-primary ms-2">
                                                    <a href="{{ route('invoice.edit', $invoice->id) }}"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="{{ __('Edit') }}">
                                                        <i class="ti ti-pencil text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Delete --}}
                                                <div class="action-btn bg-danger ms-2">
                                                    {!! Form::open([
                                                        'method' => 'DELETE',
                                                        'route' => ['invoice.destroy', $invoice->id],
                                                        'id' => 'delete-form-' . $invoice->id,
                                                    ]) !!}
                                                    <a href="#"
                                                       class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                                       data-bs-toggle="tooltip" title="{{ __('Delete') }}"
                                                       data-confirm="{{ __('Are You Sure?') }}"
                                                       data-text="{{ __('This action can not be undone. Do you want to continue?') }}"
                                                       data-confirm-yes="delete-form-{{ $invoice->id }}">
                                                        <i class="ti ti-trash text-white"></i>
                                                    </a>
                                                    {!! Form::close() !!}
                                                </div>
                                            </span>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
