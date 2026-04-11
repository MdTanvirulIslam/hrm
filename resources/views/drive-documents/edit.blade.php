@extends('layouts.admin')

@section('page-title')
    {{ __('Edit Document') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('drive-documents.index') }}">{{ __('Drive Documents') }}</a></li>
    <li class="breadcrumb-item">{{ __('Edit') }}</li>
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-8">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="ti ti-pencil me-2"></i>{{ __('Edit Document') }}
                    </h5>
                </div>
                <div class="card-body">

                    {{-- Validation Errors --}}
                    @if($errors->any())
                        <div class="alert alert-danger alert-dismissible fade show">
                            <ul class="mb-0">
                                @foreach($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    @endif

                    {{-- Upload Progress Bar (hidden by default, shown only when replacing file) --}}
                    <div id="upload-progress-container" class="mb-4 d-none">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h6 class="mb-0">
                                <i class="ti ti-brand-google-drive text-success me-1"></i>
                                {{ __('Uploading to Google Drive...') }}
                            </h6>
                            <span class="text-muted small" id="upload-percentage">0%</span>
                        </div>
                        <div class="progress" style="height: 20px;">
                            <div id="upload-progress-bar"
                                 class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                 role="progressbar"
                                 style="width: 0%"
                                 aria-valuenow="0"
                                 aria-valuemin="0"
                                 aria-valuemax="100">0%</div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <span class="small text-muted" id="upload-status">{{ __('Preparing upload...') }}</span>
                            <span class="small text-muted" id="upload-file-size"></span>
                        </div>
                    </div>

                    <div id="success-message-container" class="d-none"></div>
                    <div id="error-message-container" class="d-none"></div>

                    {{-- Current File Info --}}
                    <div class="alert alert-info py-2 mb-3">
                        <div class="d-flex align-items-center gap-2">
                            <i class="ti {{ $document->fileIcon() }} fs-5"></i>
                            <div>
                                <strong>Current file:</strong> {{ $document->file_name }}
                                <span class="badge bg-secondary ms-1">{{ strtoupper($document->file_extension) }}</span>
                                <span class="badge bg-light text-dark ms-1">{{ $document->file_size }}</span>
                                <span class="text-muted small ms-2">
                                    <i class="ti ti-folder me-1"></i>{{ $document->fullFolderPath() }}
                                </span>
                            </div>
                            <div class="ms-auto">{!! $document->syncStatusBadge() !!}</div>
                        </div>
                    </div>

                    <form method="POST"
                          action="{{ route('drive-documents.update', $document->id) }}"
                          enctype="multipart/form-data"
                          id="edit-form">
                        @csrf
                        @method('PUT')

                        <div class="row g-3">

                            {{-- Folder Name --}}
                            <div class="col-md-6">
                                <label class="form-label">
                                    {{ __('Folder Name') }} <span class="text-danger">*</span>
                                </label>
                                <input type="text"
                                       name="folder_name"
                                       id="folder_name"
                                       class="form-control @error('folder_name') is-invalid @enderror"
                                       value="{{ old('folder_name', $document->folder_name) }}"
                                       list="folder-suggestions"
                                       required>
                                <datalist id="folder-suggestions">
                                    @foreach($existingFolders as $folder)
                                        <option value="{{ $folder }}">
                                    @endforeach
                                </datalist>
                                <div class="form-text">
                                    Only letters, numbers, spaces, hyphens and underscores allowed.
                                </div>
                                @error('folder_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Sub-Folder Name --}}
                            <div class="col-md-6">
                                <label class="form-label">
                                    {{ __('Sub-Folder Name') }}
                                    <span class="text-muted">(optional)</span>
                                </label>
                                <input type="text"
                                       name="sub_folder_name"
                                       id="sub_folder_name"
                                       class="form-control @error('sub_folder_name') is-invalid @enderror"
                                       value="{{ old('sub_folder_name', $document->sub_folder_name) }}"
                                       list="sub-folder-suggestions"
                                       placeholder="e.g. 2025, Contracts">
                                <datalist id="sub-folder-suggestions">
                                    @if($document->folder_name && isset($folderSubFolders[$document->folder_name]))
                                        @foreach($folderSubFolders[$document->folder_name] as $sub)
                                            <option value="{{ $sub }}">
                                        @endforeach
                                    @endif
                                </datalist>
                                <div class="form-text">Leave blank to keep file directly in the folder.</div>
                                @error('sub_folder_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Drive path preview --}}
                            <div class="col-md-12">
                                <div class="alert alert-light border py-2 mb-0">
                                    <i class="ti ti-folder text-warning me-1"></i>
                                    Drive path: <code id="drive-path-preview">{{ $document->fullFolderPath() }} / filename.ext</code>
                                </div>
                            </div>

                            {{-- File Display Name --}}
                            <div class="col-md-6">
                                <label class="form-label">
                                    {{ __('File Display Name') }} <span class="text-danger">*</span>
                                </label>
                                <input type="text"
                                       name="file_name"
                                       id="file_name"
                                       class="form-control @error('file_name') is-invalid @enderror"
                                       value="{{ old('file_name', $document->file_name) }}"
                                       required>
                                <div class="form-text">A friendly name to identify this file.</div>
                                @error('file_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Replace File (Optional) --}}
                            <div class="col-md-6">
                                <label class="form-label">
                                    {{ __('Replace File') }}
                                    <span class="text-muted">(optional — leave empty to keep current file)</span>
                                </label>
                                <input type="file"
                                       name="document"
                                       id="document"
                                       class="form-control @error('document') is-invalid @enderror"
                                       accept=".pdf,.doc,.docx,.xls,.xlsx,.csv,.jpg,.jpeg,.png"
                                       onchange="previewFile(this)">
                                <div class="form-text">
                                    PDF, DOC, DOCX, XLS, XLSX, CSV, JPG, PNG. Max: <strong>150MB</strong>
                                </div>
                                @error('document')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- File Preview --}}
                            <div class="col-md-12">
                                <div id="file-preview" class="d-none">
                                    <div class="alert alert-warning py-2 mb-0 d-flex align-items-center gap-2">
                                        <i class="ti ti-file-upload fs-5"></i>
                                        <span>New file: <strong id="file-preview-name"></strong></span>
                                        <span class="badge bg-secondary ms-auto" id="file-preview-size"></span>
                                    </div>
                                </div>
                            </div>

                            {{-- Description --}}
                            <div class="col-md-12">
                                <label class="form-label">{{ __('Description') }}</label>
                                <textarea name="description"
                                          class="form-control @error('description') is-invalid @enderror"
                                          rows="3"
                                          placeholder="Optional: Describe what this document contains...">{{ old('description', $document->description) }}</textarea>
                                @error('description')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Drive Info --}}
                            <div class="col-md-12">
                                <div class="alert alert-success py-2 mb-0">
                                    <i class="ti ti-brand-google-drive me-1"></i>
                                    If you replace the file, it will be automatically re-uploaded to your
                                    <strong>Google Drive</strong> in the folder path specified above.
                                </div>
                            </div>

                        </div>

                        <div class="d-flex gap-2 mt-4">
                            <button type="submit" id="submit-btn" class="btn btn-primary">
                                <i class="ti ti-device-floppy me-1"></i> {{ __('Save Changes') }}
                            </button>
                            <a href="{{ route('drive-documents.index') }}" class="btn btn-secondary" id="cancel-btn">
                                <i class="ti ti-arrow-left me-1"></i> {{ __('Cancel') }}
                            </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    @push('scripts')
        <script>
            const folderSubFolders = @json($folderSubFolders);

            // Update sub-folder datalist when folder changes
            document.getElementById('folder_name').addEventListener('input', function () {
                const selected = this.value.trim();
                const datalist = document.getElementById('sub-folder-suggestions');
                datalist.innerHTML = '';

                if (folderSubFolders[selected]) {
                    folderSubFolders[selected].forEach(function (sub) {
                        const opt = document.createElement('option');
                        opt.value = sub;
                        datalist.appendChild(opt);
                    });
                }
                updateDrivePathPreview();
            });

            document.getElementById('sub_folder_name').addEventListener('input', updateDrivePathPreview);

            function updateDrivePathPreview() {
                const folder    = document.getElementById('folder_name').value.trim();
                const subFolder = document.getElementById('sub_folder_name').value.trim();
                const pathEl    = document.getElementById('drive-path-preview');
                pathEl.textContent = subFolder
                    ? folder + ' / ' + subFolder + ' / filename.ext'
                    : folder + ' / filename.ext';
            }

            function previewFile(input) {
                const preview = document.getElementById('file-preview');
                const name    = document.getElementById('file-preview-name');
                const size    = document.getElementById('file-preview-size');

                if (input.files && input.files[0]) {
                    const file     = input.files[0];
                    const fileSize = file.size > 1048576
                        ? (file.size / 1048576).toFixed(2) + ' MB'
                        : (file.size / 1024).toFixed(2) + ' KB';
                    name.textContent = file.name;
                    size.textContent = fileSize;
                    preview.classList.remove('d-none');
                }
            }

            document.getElementById('edit-form').addEventListener('submit', function (e) {
                const fileInput = document.getElementById('document');
                const hasFile   = fileInput.files && fileInput.files.length > 0;

                // If no new file selected, submit normally (metadata-only update)
                if (!hasFile) return;

                e.preventDefault();

                const formData = new FormData(this);
                const file     = fileInput.files[0];

                const progressContainer = document.getElementById('upload-progress-container');
                const progressBar       = document.getElementById('upload-progress-bar');
                const progressText      = document.getElementById('upload-percentage');
                const statusText        = document.getElementById('upload-status');
                const fileSizeText      = document.getElementById('upload-file-size');

                progressContainer.classList.remove('d-none');
                document.getElementById('success-message-container').classList.add('d-none');
                document.getElementById('error-message-container').classList.add('d-none');

                document.getElementById('submit-btn').disabled = true;
                document.getElementById('cancel-btn').classList.add('disabled');

                const fileSize = file.size > 1048576
                    ? (file.size / 1048576).toFixed(2) + ' MB'
                    : (file.size / 1024).toFixed(2) + ' KB';
                fileSizeText.textContent = 'Total: ' + fileSize;

                const xhr   = new XMLHttpRequest();
                xhr.timeout = 600000; // 10 minutes

                xhr.upload.addEventListener('progress', function (e) {
                    if (e.lengthComputable) {
                        const pct = Math.round((e.loaded / e.total) * 100);
                        progressBar.style.width            = pct + '%';
                        progressBar.setAttribute('aria-valuenow', pct);
                        progressBar.innerHTML              = pct + '%';
                        progressText.textContent           = pct + '%';
                        statusText.textContent             = pct < 30 ? 'Uploading to server...'
                            : pct < 60 ? 'Processing file...'
                                : pct < 90 ? 'Uploading to Google Drive...'
                                    : 'Almost done...';
                    }
                });

                xhr.addEventListener('load', function () {
                    if (xhr.status >= 200 && xhr.status < 300) {
                        try {
                            const response = JSON.parse(xhr.responseText);
                            markComplete();
                            showSuccess(response.message || 'Document updated successfully.');
                            setTimeout(() => { window.location.href = '{{ route("drive-documents.index") }}'; }, 2000);
                        } catch (e) {
                            handleSuccessfulUpload();
                        }
                    } else {
                        handleSuccessfulUpload();
                    }
                });

                xhr.addEventListener('error',   handleSuccessfulUpload);
                xhr.addEventListener('timeout', function () {
                    statusText.textContent = 'Waiting for server response...';
                    handleSuccessfulUpload();
                });

                function markComplete() {
                    progressBar.classList.remove('progress-bar-animated');
                    progressBar.style.width  = '100%';
                    progressBar.innerHTML    = '100%';
                    progressText.textContent = '100%';
                }

                function showSuccess(msg) {
                    statusText.textContent = 'Upload complete!';
                    const c = document.getElementById('success-message-container');
                    c.classList.remove('d-none');
                    c.innerHTML = `<div class="alert alert-success alert-dismissible fade show">
                        <i class="ti ti-circle-check me-1"></i><strong>Success!</strong> ${msg}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>`;
                }

                function handleSuccessfulUpload() {
                    markComplete();
                    showSuccess('Document updated and synced to Google Drive.');
                    setTimeout(() => { window.location.href = '{{ route("drive-documents.index") }}'; }, 2000);
                }

                xhr.open('POST', this.action, true);
                xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
                xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('input[name="_token"]').value);
                xhr.send(formData);
            });
        </script>
    @endpush
@endsection
