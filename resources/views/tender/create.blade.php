@extends('layouts.admin')

@section('page-title')
    {{ __('Add Tender') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('tender.index') }}">{{ __('Tenders') }}</a></li>
    <li class="breadcrumb-item">{{ __('Add Tender') }}</li>
@endsection

@section('content')
<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="ti ti-file-description me-2"></i>{{ __('Add New Tender') }}</h5>
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

                <form method="POST" action="{{ route('tender.store') }}">
                    @csrf

                    <div class="row">
                        {{-- Tender Name --}}
                        <div class="col-md-8 mb-3">
                            <label class="form-label">{{ __('Tender Name') }} <span class="text-danger">*</span></label>
                            <input type="text" name="tender_name"
                                   class="form-control @error('tender_name') is-invalid @enderror"
                                   value="{{ old('tender_name') }}"
                                   placeholder="{{ __('Enter tender name') }}" required>
                            @error('tender_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Reference Number --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Reference No.') }}</label>
                            <input type="text" name="reference_number"
                                   class="form-control @error('reference_number') is-invalid @enderror"
                                   value="{{ old('reference_number') }}"
                                   placeholder="{{ __('e.g. TND-2026-001') }}">
                            @error('reference_number')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Submission Date --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Submission Date') }} <span class="text-danger">*</span></label>
                            <input type="date" name="submission_date"
                                   class="form-control @error('submission_date') is-invalid @enderror"
                                   value="{{ old('submission_date') }}"
                                   min="{{ date('Y-m-d') }}" required>
                            @error('submission_date')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            <small class="text-muted">{{ __('A reminder email will be sent 3 days before this date.') }}</small>
                        </div>

                        {{-- Opening Date --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Opening Date') }}</label>
                            <input type="date" name="opening_date"
                                   class="form-control @error('opening_date') is-invalid @enderror"
                                   value="{{ old('opening_date') }}">
                            @error('opening_date')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Estimated Value --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Estimated Value') }}</label>
                            <input type="number" name="estimated_value" step="0.01" min="0"
                                   class="form-control @error('estimated_value') is-invalid @enderror"
                                   value="{{ old('estimated_value') }}"
                                   placeholder="0.00">
                            @error('estimated_value')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Status --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">{{ __('Status') }} <span class="text-danger">*</span></label>
                            <select name="status" class="form-select @error('status') is-invalid @enderror" required>
                                @foreach(['draft','submitted','awarded','rejected','cancelled'] as $s)
                                    <option value="{{ $s }}" {{ old('status', 'draft') == $s ? 'selected' : '' }}>
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
                                      class="form-control @error('description') is-invalid @enderror"
                                      placeholder="{{ __('Enter tender description, scope, or notes...') }}">{{ old('description') }}</textarea>
                            @error('description')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="ti ti-device-floppy me-1"></i>{{ __('Save Tender') }}
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
