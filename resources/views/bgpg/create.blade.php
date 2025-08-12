@extends('layouts.admin')

@section('page-title')
   {{ __('Create BG/PG') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ url('employee') }}">{{ __('BG/PG') }}</a></li>
    <li class="breadcrumb-item">{{ __('Create BG/PG') }}</li>
@endsection


@section('content')
    <div class="">
        <div class="">
            <div class="row">

            </div>
            {{ Form::open(['route' => ['bgpg.store'], 'method' => 'post', 'enctype' => 'multipart/form-data']) }}
            <div class="row">
                <div class="col-md-12">
                    <div class="card em-card">
                        <div class="card-header">
                            <h5>{{ __('BG/PG Detail') }}</h5>
                        </div>
                        <div class="card-body employee-detail-create-body">
                            <div class="row">
                                @csrf
                                <div class="form-group col-md-6">
                                    <label for="client_name" class="form-label">Client Name *</label>
                                    <input type="text" class="form-control" name="client_name" id="client_name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address" class="form-label">Address *</label>
                                    <input type="text" class="form-control" name="address" id="address">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_name" class="form-label">Tender Name *</label>
                                    <input type="text" class="form-control" name="tender_name" id="tender_name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_reference_no" class="form-label">Tender Reference No </label>
                                    <input type="text" class="form-control" name="tender_reference_no" id="tender_reference_no">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_id" class="form-label">Tender ID</label>
                                    <input type="text" class="form-control" name="tender_id" id="tender_id">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tender_published_date" class="form-label">Tender Published Date *</label>
                                    <input type="date" class="form-control" name="tender_published_date" id="tender_published_date">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_type" class="form-label">BG/PG Type *</label>
                                    <div class="form-icon-user">
                                        <select class="form-control" name="bg_pg_type" id="bg_pg_type">
                                            <option value="0">Select One</option>
                                            <option value="BG">BG</option>
                                            <option value="PO">PO</option>
                                            <option value="PG">PG</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="bank_name" class="form-label">Bank Name</label>
                                    <input type="text" class="form-control" name="bank_name" id="bank_name">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="bg_pg_no" class="form-label">BG/PG No</label>
                                    <input type="text" class="form-control" name="bg_pg_no" id="bg_pg_no">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_date" class="form-label">BG/PG Date</label>
                                    <input type="date" class="form-control" name="bg_pg_date" id="bg_pg_date">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_amount" class="form-label">BG/PG Amount</label>
                                    <input type="text" class="form-control" name="bg_pg_amount" id="bg_pg_amount">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bg_pg_expire_date" class="form-label">BG/PG Expire Date</label>
                                    <input type="date" class="form-control" name="bg_pg_expire_date" id="bg_pg_expire_date">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="status" class="form-label">Select Status *</label>
                                    <div class="form-icon-user">
                                        <select class="form-control" name="status" id="status">
                                            <option value="0">Select One</option>
                                            <option value="1">Pending</option>
                                            <option value="2">Release</option>
                                        </select>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="float-end">
            <button type="submit"  class="btn  btn-primary">{{ 'Create' }}</button>
        </div>
        </form>
    </div>
@endsection

@push('script-page')
<script>
      $('input[type="file"]').change(function(e) {
        var file = e.target.files[0].name;
        var file_name=$(this).attr('data-filename');
        $('.'+file_name).append(file);
    });
</script>


@endpush
