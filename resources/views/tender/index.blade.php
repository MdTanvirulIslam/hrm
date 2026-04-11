@extends('layouts.admin')

@section('page-title')
    {{ __('Tenders') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Tenders') }}</li>
@endsection

@section('action-button')
    <a href="{{ route('tender.create') }}"
       class="btn btn-sm btn-primary"
       data-bs-toggle="tooltip" title="{{ __('Add New Tender') }}">
        <i class="ti ti-plus"></i> {{ __('Add Tender') }}
    </a>
@endsection

@section('content')
    <div class="col-12">

        {{-- Toast Container --}}
        <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
            <div id="appToast" class="toast align-items-center border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body fw-semibold" id="appToastMessage"></div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>

        {{-- Session Flash --}}
        @if(session('success'))
            <div data-toast="success" data-message="{{ session('success') }}"></div>
        @endif
        @if(session('error'))
            <div data-toast="error" data-message="{{ session('error') }}"></div>
        @endif

        {{-- Summary Cards --}}
        @php
            $total     = $tenders->count();
            $draft     = $tenders->where('status', 'draft')->count();
            $awarded   = $tenders->where('status', 'awarded')->count();
            $urgent    = $tenders->filter(function($t) {
                $d = now()->startOfDay()->diffInDays($t->submission_date, false);
                return $d >= 0 && $d <= 3 && in_array($t->status, ['draft','submitted']);
            })->count();
        @endphp

        <div class="row g-3 mb-3">
            <div class="col-6 col-md-3">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="theme-avtar bg-primary">
                                <i class="ti ti-file-description"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="mb-0">{{ $total }}</h5>
                                <p class="mb-0 text-muted">{{ __('Total Tenders') }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="theme-avtar bg-warning">
                                <i class="ti ti-pencil"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="mb-0">{{ $draft }}</h5>
                                <p class="mb-0 text-muted">{{ __('Draft') }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="theme-avtar bg-success">
                                <i class="ti ti-trophy"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="mb-0">{{ $awarded }}</h5>
                                <p class="mb-0 text-muted">{{ __('Awarded') }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="theme-avtar bg-danger">
                                <i class="ti ti-alarm"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="mb-0">{{ $urgent }}</h5>
                                <p class="mb-0 text-muted">{{ __('Urgent (≤3 days)') }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Filter Bar --}}
        <div class="card mb-3">
            <div class="card-body py-2">
                <form method="GET" action="{{ route('tender.index') }}" class="row g-2 align-items-center">
                    <div class="col-md-5">
                        <input type="text" name="search"
                               class="form-control form-control-sm"
                               placeholder="{{ __('Search tender name or reference...') }}"
                               value="{{ request('search') }}">
                    </div>
                    <div class="col-md-3">
                        <select name="status" class="form-select form-select-sm">
                            <option value="">{{ __('All Statuses') }}</option>
                            @foreach(['draft','submitted','awarded','rejected','cancelled'] as $s)
                                <option value="{{ $s }}" {{ request('status') == $s ? 'selected' : '' }}>
                                    {{ ucfirst($s) }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-auto d-flex gap-1">
                        <button type="submit" class="btn btn-sm btn-primary">
                            <i class="ti ti-search"></i> {{ __('Filter') }}
                        </button>
                        <a href="{{ route('tender.index') }}" class="btn btn-sm btn-secondary">
                            <i class="ti ti-x"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>

        {{-- Tenders Table --}}
        <div class="card">
            <div class="card-body table-border-style">
                @if($tenders->isEmpty())
                    <div class="text-center py-5">
                        <i class="ti ti-file-off fs-1 text-muted"></i>
                        <p class="text-muted mt-2 mb-3">{{ __('No tenders found.') }}</p>
                        <a href="{{ route('tender.create') }}" class="btn btn-primary btn-sm">
                            <i class="ti ti-plus"></i> {{ __('Add First Tender') }}
                        </a>
                    </div>
                @else
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>{{ __('Tender Name') }}</th>
                                <th>{{ __('Reference No.') }}</th>
                                <th>{{ __('Submission Date') }}</th>
                                <th>{{ __('Opening Date') }}</th>
                                <th>{{ __('Est. Value') }}</th>
                                <th>{{ __('Status') }}</th>
                                <th>{{ __('Reminder') }}</th>
                                <th width="100px">{{ __('Actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($tenders as $tender)
                                @php
                                    $daysLeft = now()->startOfDay()->diffInDays($tender->submission_date, false);
                                    $isUrgent = $daysLeft >= 0 && $daysLeft <= 3 && in_array($tender->status, ['draft','submitted']);
                                    $isPast   = $daysLeft < 0 && in_array($tender->status, ['draft','submitted']);
                                @endphp
                                <tr class="{{ $isUrgent ? 'table-warning' : '' }}">
                                    <td>{{ $loop->iteration }}</td>
                                    <td>
                                        <strong>{{ $tender->tender_name }}</strong>
                                        @if($isUrgent)
                                            <span class="badge bg-danger ms-1">
                                            <i class="ti ti-alarm"></i> {{ $daysLeft }}d left
                                        </span>
                                        @elseif($isPast)
                                            <span class="badge bg-secondary ms-1">
                                            {{ __('Past due') }}
                                        </span>
                                        @endif
                                        @if(!$isUrgent && !$isPast && $daysLeft >= 0)
                                            <br><small class="text-muted">{{ $daysLeft }}d remaining</small>
                                        @endif
                                    </td>
                                    <td>
                                        @if($tender->reference_number)
                                            <span class="badge bg-light text-dark border">
                                            {{ $tender->reference_number }}
                                        </span>
                                        @else
                                            <span class="text-muted">—</span>
                                        @endif
                                    </td>
                                    <td>{{ \Carbon\Carbon::parse($tender->submission_date)->format('d M Y') }}</td>
                                    <td>
                                        {{ $tender->opening_date
                                            ? \Carbon\Carbon::parse($tender->opening_date)->format('d M Y')
                                            : '—' }}
                                    </td>
                                    <td>
                                        {{ $tender->estimated_value
                                            ? number_format($tender->estimated_value, 2)
                                            : '—' }}
                                    </td>
                                    <td>{!! $tender->statusBadge() !!}</td>
                                    <td>
                                        @if($tender->reminder_sent)
                                            <span class="badge bg-success">
                                            <i class="ti ti-check"></i> {{ __('Sent') }}
                                        </span>
                                        @else
                                            <span class="badge bg-light text-dark border">
                                            <i class="ti ti-clock"></i> {{ __('Pending') }}
                                        </span>
                                        @endif
                                    </td>
                                    <td class="Action">
                                    <span>
                                        {{-- Edit --}}
                                        <div class="action-btn bg-info ms-2">
                                            <a href="{{ route('tender.edit', $tender->id) }}"
                                               class="mx-3 btn btn-sm align-items-center"
                                               data-bs-toggle="tooltip" title="{{ __('Edit') }}">
                                                <i class="ti ti-pencil text-white"></i>
                                            </a>
                                        </div>

                                        {{-- Delete --}}
                                        <div class="action-btn bg-danger ms-2">
                                            <a href="#"
                                               class="mx-3 btn btn-sm align-items-center"
                                               data-bs-toggle="modal"
                                               data-bs-target="#deleteModal-{{ $tender->id }}"
                                               title="{{ __('Delete') }}">
                                                <i class="ti ti-trash text-white"></i>
                                            </a>
                                        </div>
                                    </span>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>
        </div>

    </div>{{-- end col-12 --}}

    {{-- Delete Confirmation Modals --}}
    @foreach($tenders as $tender)
        <div class="modal fade" id="deleteModal-{{ $tender->id }}" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="ti ti-trash text-danger me-1"></i> {{ __('Delete Tender') }}
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p class="mb-1">{{ __('Are you sure you want to delete:') }}</p>
                        <p class="fw-semibold mb-1">{{ $tender->tender_name }}</p>
                        @if($tender->reference_number)
                            <small class="text-muted">Ref: {{ $tender->reference_number }}</small>
                        @endif
                        <div class="alert alert-warning d-flex align-items-center gap-2 mt-3 mb-0 py-2">
                            <i class="ti ti-alert-triangle flex-shrink-0"></i>
                            <small>{{ __('This action cannot be undone.') }}</small>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">
                            <i class="ti ti-x me-1"></i>{{ __('Cancel') }}
                        </button>
                        <form action="{{ route('tender.destroy', $tender->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger btn-sm">
                                <i class="ti ti-trash me-1"></i>{{ __('Yes, Delete') }}
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endforeach

    @push('scripts')
        <script>
            (function () {
                const el = document.querySelector('[data-toast]');
                if (!el) return;
                const type    = el.dataset.toast;
                const message = el.dataset.message;
                const toast   = document.getElementById('appToast');
                const body    = document.getElementById('appToastMessage');
                toast.classList.remove('bg-success', 'bg-danger', 'text-white');
                toast.classList.add(type === 'success' ? 'bg-success' : 'bg-danger', 'text-white');
                body.textContent = message;
                new bootstrap.Toast(toast, { delay: 4000 }).show();
            })();
        </script>
    @endpush

@endsection
