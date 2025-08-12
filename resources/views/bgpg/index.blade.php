
@extends('layouts.admin')

@section('page-title')
    {{ __('Manage BG/PG') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('bgpg.index') }}">{{ __('BG/PG') }}</a></li>
@endsection

@section('action-button')
    {{--<a href="{{ route('employee.export') }}" data-bs-toggle="tooltip" data-bs-placement="top"
       data-bs-original-title="{{ __('Export') }}" class="btn btn-sm btn-primary">
        <i class="ti ti-file-export"></i>
    </a>--}}

    <a href="#" data-url="{{ route('import.bg.ph') }}" data-ajax-popup="true"
       data-title="{{ __('Import  BG/PG CSV file') }}" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
       data-bs-original-title="{{ __('Import') }}">
        <i class="ti ti-file"></i>
    </a>
    @can('Create Employee')
        <a href="{{ route('bgpg.create') }}"
           data-title="{{ __('Create BG/PG') }}" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
           data-bs-original-title="{{ __('Create') }}">
            <i class="ti ti-plus"></i>
        </a>
    @endcan
@endsection

@section('content')
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">
                {{-- <h5></h5> --}}
                <div class="table-responsive">
                    {{--<table class="table" id="pc-dt-simple">
                        <thead>
                        <tr>
                            <th>SL</th>
                            <th>Client Name</th>
                            <th>Address</th>
                            <th>Tender Name</th>
                            <th>Tender Reference No</th>
                            <th>Tender ID</th>
                            <th>Tender Published Date</th>
                            <th>Type</th>
                            <th>Bank Name</th>
                            <th>BG/PO/PG No</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Expire Date</th>
                            <th>Status</th>
                            @if (Gate::check('Edit BG/PO/PG') || Gate::check('Delete BG/PO/PG'))
                                <th width="200px">{{ __('Action') }}</th>
                            @endif
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($all_bg_pg as $bg_pg)
                            <tr>
                                <td>{{ $bg_pg->id }}</td>
                                <td>{{ $bg_pg->client_name }}</td>
                                <td>{{ $bg_pg->address }}</td>
                                <td>{{ $bg_pg->tender_name }}</td>
                                <td>{{ $bg_pg->tender_reference_no }}</td>
                                <td>{{ $bg_pg->tender_id }}</td>
                                <td>{{ $bg_pg->tender_punlished_date ?? '' }}</td>
                                <td>{{ $bg_pg->bg_pg_type }}</td>
                                <td>{{ $bg_pg->bank_name }}</td>
                                <td>{{ $bg_pg->bg_pg_no }}</td>
                                <td>{{ $bg_pg->bg_pg_date }}</td>
                                <td>{{ $bg_pg->bg_pg_amount }}</td>
                                <td>{{ $bg_pg->bg_pg_expire_date }}</td>
                                <td>{{ $bg_pg->status == 1 ? 'Pending' : 'Release' }}</td>

                                @if (Gate::check('Edit BG/PO/PG') || Gate::check('Delete BG/PO/PG'))
                                    <td class="Action">
                                        @if ($bg_pg->status == 1)
                                            <span>
                                    @can('Edit BG/PO/PG')
                                                    <div class="action-btn bg-info ms-2">
                                            <a href="{{ route('edit.bg.pg', $bg_pg->id) }}"
                                               class="mx-3 btn btn-sm align-items-center"
                                               data-bs-toggle="tooltip" title=""
                                               data-bs-original-title="{{ __('Edit') }}">
                                                <i class="ti ti-pencil text-white"></i>
                                            </a>
                                        </div>
                                                @endcan

                                                @can('Delete BG/PO/PG')
                                                    <div class="action-btn bg-danger ms-2">
                                            {!! Form::open(['method' => 'DELETE', 'route' => ['delete.bg.pg', $bg_pg->id], 'id' => 'delete-form-' . $bg_pg->id]) !!}
                                            <a href="#" class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                               data-bs-toggle="tooltip" title=""
                                               data-bs-original-title="Delete" aria-label="Delete">
                                                <i class="ti ti-trash text-white"></i>
                                            </a>
                                            {!! Form::close() !!}
                                        </div>
                                                @endcan
                                </span>
                                        @else
                                            <i class="ti ti-lock"></i>
                                        @endif
                                    </td>
                                @endif
                            </tr>
                        @endforeach
                        </tbody>
                    </table>--}}

                    <table class="table" id="bgpg-table">
                        <thead>
                        <tr>
                            <th>SL</th>
                            <th>Client Name</th>
                            <th>Address</th>
                            <th>Tender Name</th>
                            <th>Tender Reference No</th>
                            <th>Tender ID</th>
                            <th>Tender Published Date</th>
                            <th>Type</th>
                            <th>Bank Name</th>
                            <th>BG/PO/PG No</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Expire Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection
@push('scripts')
    <script>
        $(document).ready(function () {
            $('#bgpg-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('bgpg.index') }}",
                columns: [
                    { data: 'id', name: 'id', searchable: false, orderable: false },
                    { data: 'client_name', name: 'client_name' },
                    { data: 'address', name: 'address' },
                    { data: 'tender_name', name: 'tender_name' },
                    { data: 'tender_reference_no', name: 'tender_reference_no' },
                    { data: 'tender_id', name: 'tender_id' },
                    { data: 'tender_published_date', name: 'tender_published_date' },
                    { data: 'bg_pg_type', name: 'bg_pg_type' },
                    { data: 'bank_name', name: 'bank_name' },
                    { data: 'bg_pg_no', name: 'bg_pg_no' },
                    { data: 'bg_pg_date', name: 'bg_pg_date' },
                    { data: 'bg_pg_amount', name: 'bg_pg_amount' },
                    { data: 'bg_pg_expire_date', name: 'bg_pg_expire_date' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action' }
                ],
                columnDefs: [
                    {
                        targets: 0,
                        render: function (data, type, row, meta) {
                            return meta.row + 1;
                        }
                    }
                ]
            });

            $(document).on('click', '.delete-btn', function (e) {
                e.preventDefault();
                var id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This action can not be undone. Do you want to continue?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#6fd943',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#delete-form-' + id).submit(); // Submit the form
                    }
                })
            });
        });
    </script>
@endpush

