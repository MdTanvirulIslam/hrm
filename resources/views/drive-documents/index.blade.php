@extends('layouts.admin')

@section('page-title')
    {{ __('Google Drive Documents') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Drive Documents') }}</li>
@endsection

@section('action-button')
    {{-- Sync All Button --}}
    <a href="{{ route('drive-documents.sync-all') }}"
       class="btn btn-sm btn-success me-1"
       onclick="return confirm('Sync all pending/failed documents to Google Drive?')"
       data-bs-toggle="tooltip" title="Sync pending documents to Drive">
        <i class="ti ti-refresh"></i> {{ __('Sync to Drive') }}
    </a>

    {{-- Upload New Button --}}
    <a href="{{ route('drive-documents.create') }}"
       class="btn btn-sm btn-primary"
       data-bs-toggle="tooltip" title="{{ __('Upload New Document') }}">
        <i class="ti ti-upload"></i> {{ __('Upload Document') }}
    </a>
@endsection

@section('content')
    <div class="col-12">

        {{-- Toast Notification --}}
        <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
            <div id="appToast" class="toast align-items-center border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body" id="appToastMessage"></div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>

        {{-- Session Flash Data --}}
        @if(session('success'))
            <div data-toast="success" data-message="{{ session('success') }}"></div>
        @endif
        @if(session('error'))
            <div data-toast="error" data-message="{{ session('error') }}"></div>
        @endif

        {{-- Filter Bar --}}
        <div class="card mb-3">
            <div class="card-body py-2">
                <form method="GET" action="{{ route('drive-documents.index') }}" class="row g-2 align-items-center">
                    <div class="col-md-3">
                        <input type="text" name="search" class="form-control form-control-sm"
                               placeholder="Search file name..." value="{{ request('search') }}">
                    </div>
                    <div class="col-md-3">
                        <select name="folder" id="filter-folder" class="form-select form-select-sm">
                            <option value="">All Folders</option>
                            @foreach($folders as $folder)
                                <option value="{{ $folder }}" {{ request('folder') == $folder ? 'selected' : '' }}>
                                    {{ $folder }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select name="sub_folder" class="form-select form-select-sm">
                            <option value="">All Sub-Folders</option>
                            @foreach($subFolders as $sub)
                                <option value="{{ $sub }}" {{ request('sub_folder') == $sub ? 'selected' : '' }}>
                                    {{ $sub }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select name="status" class="form-select form-select-sm">
                            <option value="">All Status</option>
                            <option value="synced"  {{ request('status') == 'synced'  ? 'selected' : '' }}>Synced</option>
                            <option value="failed"  {{ request('status') == 'failed'  ? 'selected' : '' }}>Failed</option>
                            <option value="pending" {{ request('status') == 'pending' ? 'selected' : '' }}>Pending</option>
                        </select>
                    </div>
                    <div class="col-md-2 d-flex gap-1">
                        <button type="submit" class="btn btn-sm btn-primary w-100">
                            <i class="ti ti-search"></i> Filter
                        </button>
                        <a href="{{ route('drive-documents.index') }}" class="btn btn-sm btn-secondary">
                            <i class="ti ti-x"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>

        {{-- Documents Card --}}
        <div class="card">
            <div class="card-body table-border-style">
                <div class="table-responsive">
                    <table class="table" id="pc-dt-simple">
                        <thead>
                        <tr>
                            <th>{{ __('File Name') }}</th>
                            <th>{{ __('Folder / Sub-Folder') }}</th>
                            <th>{{ __('Description') }}</th>
                            <th>{{ __('Type') }}</th>
                            <th>{{ __('Size') }}</th>
                            <th>{{ __('Drive Status') }}</th>
                            <th>{{ __('Uploaded') }}</th>
                            <th width="200px">{{ __('Action') }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($groupedDocuments as $folderName => $subGroups)
                            @foreach($subGroups as $subFolderKey => $docs)
                                @foreach($docs as $document)
                                    <tr>
                                        <td>
                                            <i class="ti {{ $document->fileIcon() }} me-1"></i>
                                            {{ $document->file_name }}
                                        </td>
                                        <td>
                                            <small>
                                                <i class="ti ti-folder text-warning"></i> {{ $folderName }}
                                            </small>
                                            @if($document->sub_folder_name)
                                                <small class="d-block text-muted ms-1">
                                                    <i class="ti ti-folder-open text-secondary"></i> {{ $document->sub_folder_name }}
                                                </small>
                                            @endif
                                        </td>
                                        <td>
                                            <span style="max-width:180px; display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"
                                                  title="{{ $document->description }}">
                                                {{ $document->description ?? '—' }}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge bg-light text-dark border">
                                                {{ strtoupper($document->file_extension) }}
                                            </span>
                                        </td>
                                        <td>{{ $document->file_size ?? '—' }}</td>
                                        <td>{!! $document->syncStatusBadge() !!}</td>
                                        <td>{{ $document->created_at->format('d M Y') }}</td>
                                        <td class="Action">
                                            <span>
                                                {{-- Download --}}
                                                <div class="action-btn bg-success ms-2">
                                                    <a href="{{ route('drive-documents.download', $document->id) }}"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="Download">
                                                        <i class="ti ti-download text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Copy Google Drive Link --}}
                                                <div class="action-btn bg-warning ms-2">
                                                    <a href="#"
                                                       class="mx-3 btn btn-sm align-items-center copy-link-btn"
                                                       data-fetch-url="{{ route('drive-documents.link', $document->id) }}"
                                                       data-synced="{{ $document->isSynced() ? '1' : '0' }}"
                                                       data-bs-toggle="tooltip"
                                                       title="Copy Drive Link">
                                                        <i class="ti ti-link text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Edit --}}
                                                <div class="action-btn bg-info ms-2">
                                                    <a href="{{ route('drive-documents.edit', $document->id) }}"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="tooltip" title="Edit">
                                                        <i class="ti ti-pencil text-white"></i>
                                                    </a>
                                                </div>

                                                {{-- Delete Trigger --}}
                                                <div class="action-btn bg-danger ms-2">
                                                    <a href="#"
                                                       class="mx-3 btn btn-sm align-items-center"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#deleteModal-{{ $document->id }}"
                                                       title="Delete">
                                                        <i class="ti ti-trash text-white"></i>
                                                    </a>
                                                </div>
                                            </span>
                                        </td>
                                    </tr>
                                @endforeach
                            @endforeach
                        @empty
                            <tr>
                                <td colspan="8" class="text-center py-5">
                                    <i class="ti ti-cloud-off fs-1 text-muted"></i>
                                    <p class="text-muted mt-2 mb-3">No documents uploaded yet.</p>
                                    <a href="{{ route('drive-documents.create') }}" class="btn btn-primary btn-sm">
                                        <i class="ti ti-upload"></i> Upload First Document
                                    </a>
                                </td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>{{-- end col-12 --}}

    {{-- ── Delete Confirmation Modals (outside table) ── --}}
    @foreach($documents as $document)
        <div class="modal fade" id="deleteModal-{{ $document->id }}" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="ti ti-trash text-danger me-1"></i> Delete Document
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p class="mb-1">Are you sure you want to delete:</p>
                        <p class="fw-semibold mb-0">
                            <i class="ti {{ $document->fileIcon() }} me-1"></i>{{ $document->file_name }}
                        </p>
                        <small class="text-muted">This will remove the file from local storage and Google Drive.</small>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            <i class="ti ti-x me-1"></i> Cancel
                        </button>
                        <form method="POST" action="{{ route('drive-documents.destroy', $document->id) }}">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">
                                <i class="ti ti-trash me-1"></i> Yes, Delete
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endforeach

    @push('scripts')
        <script>
            // ── Toast Notifications ──────────────────────────────
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

            // ── Auto-submit folder filter ────────────────────────
            document.getElementById('filter-folder').addEventListener('change', function () {
                this.closest('form').submit();
            });

            // ── Copy Google Drive Link ───────────────────────────
            document.querySelectorAll('.copy-link-btn').forEach(function (btn) {
                btn.addEventListener('click', function (e) {
                    e.preventDefault();

                    if (this.dataset.synced !== '1') {
                        alert('This file is not synced to Google Drive yet.');
                        return;
                    }

                    const icon     = this.querySelector('i');
                    const fetchUrl = this.dataset.fetchUrl;
                    const self     = this;

                    icon.classList.replace('ti-link', 'ti-loader');

                    fetch(fetchUrl, {
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                        }
                    })
                        .then(res => res.json())
                        .then(data => {
                            if (data.error) {
                                alert(data.error);
                                icon.classList.replace('ti-loader', 'ti-link');
                                return;
                            }

                            navigator.clipboard.writeText(data.url).then(() => {
                                icon.classList.replace('ti-loader', 'ti-check');

                                const tooltip = bootstrap.Tooltip.getInstance(self);
                                if (tooltip) tooltip.setContent({ '.tooltip-inner': 'Copied!' });

                                setTimeout(() => {
                                    icon.classList.replace('ti-check', 'ti-link');
                                    if (tooltip) tooltip.setContent({ '.tooltip-inner': 'Copy Drive Link' });
                                }, 2000);
                            }).catch(() => {
                                // Clipboard API fallback
                                const temp = document.createElement('input');
                                temp.value = data.url;
                                document.body.appendChild(temp);
                                temp.select();
                                document.execCommand('copy');
                                document.body.removeChild(temp);
                                icon.classList.replace('ti-loader', 'ti-check');
                                setTimeout(() => icon.classList.replace('ti-check', 'ti-link'), 2000);
                            }); 
                        })
                        .catch(() => {
                            alert('Failed to retrieve Google Drive link.');
                            icon.classList.replace('ti-loader', 'ti-link');
                        });
                });
            });
        </script>
    @endpush
@endsection
