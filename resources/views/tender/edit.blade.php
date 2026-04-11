@extends('layouts.admin')

@section('page-title')
    {{ __('Edit Tender') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('tender.index') }}">{{ __('Tenders') }}</a></li>
    <li class="breadcrumb-item">{{ __('Edit Tender') }}</li>
@endsection

@section('content')
<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="ti ti-edit me-2"></i>{{ __('Edit Tender') }}</h5>
            </div>
            <div class="card-body">

                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form method="POST" action="{{ route('tender.update', $tender->id) }}">
                    @csrf
                    @method('PUT')

                    <div class="row">
                        {{-- Tender Name --}}
                        <div class="col-md-8 mb-3">
                            <label class="form-label">{{ __('Tender Name') }} <span class="text-danger">*</span></label>
                            <input type="text" name="tender_name"
                                   class="form-control @error('tender_name') is-invalid @enderror"
                                   value="{{ old('tender_name', $tender->tender_name) }}" required>
                            @error('tender_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Reference Number --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Reference No.') }}</label>
                            <input type="text" name="reference_number"
                                   class="form-control @error('reference_number') is-invalid @enderror"
                                   value="{{ old('reference_number', $tender->reference_number) }}">
                            @error('reference_number')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Submission Date --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Submission Date') }} <span class="text-danger">*</span></label>
                            <input type="date" name="submission_date"
                                   class="form-control @error('submission_date') is-invalid @enderror"
                                   value="{{ old('submission_date', \Carbon\Carbon::parse($tender->submission_date)->format('Y-m-d')) }}" required>
                            @error('submission_date')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            @if($tender->reminder_sent)
                                <small class="text-warning">
                                    <i class="ti ti-alert-triangle"></i>
                                    {{ __('Reminder already sent. Changing the submission date will re-enable it.') }}
                                </small>
                            @else
                                <small class="text-muted">{{ __('A reminder email will be sent 3 days before this date.') }}</small>
                            @endif
                        </div>

                        {{-- Opening Date --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Opening Date') }}</label>
                            <input type="date" name="opening_date"
                                   class="form-control @error('opening_date') is-invalid @enderror"
                                   value="{{ old('opening_date', $tender->opening_date ? \Carbon\Carbon::parse($tender->opening_date)->format('Y-m-d') : '') }}">
                            @error('opening_date')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Estimated Value --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Estimated Value') }}</label>
                            <input type="number" name="estimated_value" step="0.01" min="0"
                                   class="form-control @error('estimated_value') is-invalid @enderror"
                                   value="{{ old('estimated_value', $tender->estimated_value) }}">
                            @error('estimated_value')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Status --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Status') }} <span class="text-danger">*</span></label>
                            <select name="status" class="form-select @error('status') is-invalid @enderror" required>
                                @foreach(['draft','submitted','awarded','rejected','cancelled'] as $s)
                                    <option value="{{ $s }}" {{ old('status', $tender->status) == $s ? 'selected' : '' }}>
                                        {{ ucfirst($s) }}
                                    </option>
                                @endforeach
                            </select>
                            @error('status')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Description --}}
                        <div class="col-12 mb-3">
                            <label class="form-label">{{ __('Description') }}</label>
                            <textarea name="description" rows="4"
                                      class="form-control @error('description') is-invalid @enderror">{{ old('description', $tender->description) }}</textarea>
                            @error('description')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="ti ti-device-floppy me-1"></i>{{ __('Update Tender') }}
                        </button>
                        <a href="{{ route('tender.index') }}" class="btn btn-outline-secondary">
                            {{ __('Cancel') }}
                        </a>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
@endsection
