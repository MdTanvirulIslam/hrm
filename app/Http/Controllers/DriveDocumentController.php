<?php

namespace App\Http\Controllers;

use App\Models\DriveDocument;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class DriveDocumentController extends Controller
{
    // ── Allowed file types ─────────────────────────────────
    protected array $allowedExtensions = [
        'pdf', 'doc', 'docx', 'xls', 'xlsx', 'csv',
        'jpg', 'jpeg', 'png',
    ];

    protected array $allowedMimeTypes = [
        'application/pdf',
        'application/msword',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.ms-excel',
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'text/csv',
        'image/jpeg',
        'image/png',
    ];

    // Max file size: 10MB
    protected int $maxFileSize = 10240;

    // ══════════════════════════════════════════════════════
    // INDEX — List all documents grouped by folder
    // ══════════════════════════════════════════════════════
    public function index(Request $request)
    {
        $query = DriveDocument::where('created_by', Auth::id())
            ->orderBy('folder_name')
            ->orderBy('created_at', 'desc');

        // Filter by folder
        if ($request->filled('folder')) {
            $query->where('folder_name', $request->folder);
        }

        // Filter by sync status
        if ($request->filled('status')) {
            $query->where('drive_sync_status', $request->status);
        }

        // Search by file name
        if ($request->filled('search')) {
            $query->where('file_name', 'like', '%' . $request->search . '%');
        }

        $documents = $query->get();

        // Get all unique folder names for filter dropdown
        $folders = DriveDocument::where('created_by', Auth::id())
            ->distinct()
            ->pluck('folder_name');

        // Group documents by folder for display
        $groupedDocuments = $documents->groupBy('folder_name');

        return view('drive-documents.index', compact(
            'documents',
            'groupedDocuments',
            'folders'
        ));
    }

    // ══════════════════════════════════════════════════════
    // CREATE — Show upload form
    // ══════════════════════════════════════════════════════
    public function create()
    {
        // Get existing folders for dropdown suggestion
        $existingFolders = DriveDocument::where('created_by', Auth::id())
            ->distinct()
            ->pluck('folder_name');

        return view('drive-documents.create', compact('existingFolders'));
    }

    // ══════════════════════════════════════════════════════
    // STORE — Upload file locally + sync to Google Drive
    // ══════════════════════════════════════════════════════
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'folder_name' => [
                'required',
                'string',
                'max:100',
                'regex:/^[a-zA-Z0-9_\- ]+$/', // only safe folder name chars
            ],
            'file_name'   => 'required|string|max:255',
            'description' => 'nullable|string|max:1000',
            'document'    => [
                'required',
                'file',
                'max:' . $this->maxFileSize,
            ],
        ], [
            'folder_name.regex'   => 'Folder name can only contain letters, numbers, spaces, hyphens and underscores.',
            'folder_name.required'=> 'Please provide a folder name.',
            'file_name.required'  => 'Please provide a display name for the file.',
            'document.required'   => 'Please select a file to upload.',
            'document.max'        => 'File size must not exceed 10MB.',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $file = $request->file('document');

        // Validate file extension and MIME type
        $extension = strtolower($file->getClientOriginalExtension());
        $mimeType  = $file->getMimeType();

        if (!in_array($extension, $this->allowedExtensions) || !in_array($mimeType, $this->allowedMimeTypes)) {
            return redirect()->back()
                ->with('error', 'Invalid file type. Allowed: PDF, DOC, DOCX, XLS, XLSX, CSV, JPG, JPEG, PNG.')
                ->withInput();
        }

        // Build unique stored filename
        $originalName    = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $safeOriginal    = Str::slug($originalName);
        $fileNameToStore = $safeOriginal . '_' . time() . '.' . $extension;

        // Clean folder name for Drive path
        $folderName  = trim($request->folder_name);
        $safeFolderName = Str::slug($folderName, '_');

        // Local storage path
        $localDir      = 'storage/uploads/drive-documents/' . $safeFolderName . '/';
        $localFullPath = public_path($localDir . $fileNameToStore);

        // 1️⃣ Save locally
        File::ensureDirectoryExists(public_path($localDir));
        $file->move(public_path($localDir), $fileNameToStore);

        // 2️⃣ Upload to Google Drive (folder/filename)
        $drivePath   = $safeFolderName . '/' . $fileNameToStore;
        $driveStatus = 'failed';

        try {
            $content = File::get($localFullPath);
            Storage::disk('google')->put($drivePath, $content);
            $driveStatus = 'synced';
        } catch (\Throwable $e) {
            \Log::error('[DriveDocument] Upload failed: ' . $e->getMessage());
        }

        // 3️⃣ Save to DB
        DriveDocument::create([
            'folder_name'       => $folderName,
            'file_name'         => $request->file_name,
            'file_path'         => $drivePath,
            'local_path'        => $localDir . $fileNameToStore,
            'description'       => $request->description,
            'file_extension'    => $extension,
            'file_size'         => $this->formatFileSize($file->getSize()),
            'drive_sync_status' => $driveStatus,
            'created_by'        => Auth::id(),
        ]);

        $message = $driveStatus === 'synced'
            ? 'Document uploaded and synced to Google Drive successfully.'
            : 'Document saved locally. Google Drive sync failed — check logs.';

        return redirect()->route('drive-documents.index')
            ->with('success', $message);
    }

    // ══════════════════════════════════════════════════════
    // SHOW — Preview document details
    // ══════════════════════════════════════════════════════
    public function show($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())
            ->findOrFail($id);

        return view('drive-documents.show', compact('document'));
    }

    // ══════════════════════════════════════════════════════
    // EDIT — Show edit form
    // ══════════════════════════════════════════════════════
    public function edit($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())
            ->findOrFail($id);

        $existingFolders = DriveDocument::where('created_by', Auth::id())
            ->distinct()
            ->pluck('folder_name');

        return view('drive-documents.edit', compact('document', 'existingFolders'));
    }

    // ══════════════════════════════════════════════════════
    // UPDATE — Update metadata or replace file
    // ══════════════════════════════════════════════════════
    public function update(Request $request, $id)
    {
        $document = DriveDocument::where('created_by', Auth::id())
            ->findOrFail($id);

        $rules = [
            'folder_name' => [
                'required', 'string', 'max:100',
                'regex:/^[a-zA-Z0-9_\- ]+$/',
            ],
            'file_name'   => 'required|string|max:255',
            'description' => 'nullable|string|max:1000',
        ];

        // Only validate file if a new one is uploaded
        if ($request->hasFile('document')) {
            $rules['document'] = 'file|max:' . $this->maxFileSize;
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Handle new file upload
        if ($request->hasFile('document')) {
            $file      = $request->file('document');
            $extension = strtolower($file->getClientOriginalExtension());
            $mimeType  = $file->getMimeType();

            if (!in_array($extension, $this->allowedExtensions) || !in_array($mimeType, $this->allowedMimeTypes)) {
                return redirect()->back()
                    ->with('error', 'Invalid file type.')
                    ->withInput();
            }

            // Delete old files
            $this->deleteLocalFile($document->local_path);
            $this->deleteDriveFile($document->file_path);

            // Build new paths
            $originalName    = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
            $safeOriginal    = Str::slug($originalName);
            $fileNameToStore = $safeOriginal . '_' . time() . '.' . $extension;
            $safeFolderName  = Str::slug(trim($request->folder_name), '_');
            $localDir        = 'storage/uploads/drive-documents/' . $safeFolderName . '/';
            $localFullPath   = public_path($localDir . $fileNameToStore);

            // Save new file locally
            File::ensureDirectoryExists(public_path($localDir));
            $file->move(public_path($localDir), $fileNameToStore);

            // Upload new file to Drive
            $drivePath   = $safeFolderName . '/' . $fileNameToStore;
            $driveStatus = 'failed';

            try {
                Storage::disk('google')->put($drivePath, File::get($localFullPath));
                $driveStatus = 'synced';
            } catch (\Throwable $e) {
                \Log::error('[DriveDocument] Update upload failed: ' . $e->getMessage());
            }

            $document->file_path        = $drivePath;
            $document->local_path       = $localDir . $fileNameToStore;
            $document->file_extension   = $extension;
            $document->file_size        = $this->formatFileSize($file->getSize());
            $document->drive_sync_status = $driveStatus;
        }

        $document->folder_name  = trim($request->folder_name);
        $document->file_name    = $request->file_name;
        $document->description  = $request->description;
        $document->save();

        return redirect()->route('drive-documents.index')
            ->with('success', 'Document updated successfully.');
    }

    // ══════════════════════════════════════════════════════
    // DESTROY — Delete from local + Google Drive + DB
    // ══════════════════════════════════════════════════════
    public function destroy($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())
            ->findOrFail($id);

        // 1️⃣ Delete local file
        $this->deleteLocalFile($document->local_path);

        // 2️⃣ Delete from Google Drive
        $this->deleteDriveFile($document->file_path);

        // 3️⃣ Delete DB record
        $document->delete();

        return redirect()->route('drive-documents.index')
            ->with('success', 'Document deleted successfully.');
    }

    // ══════════════════════════════════════════════════════
    // DOWNLOAD — Download file from Google Drive
    // ══════════════════════════════════════════════════════
    public function download($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())
            ->findOrFail($id);

        // Try Google Drive first
        if ($document->isSynced()) {
            try {
                return Storage::disk('google')->download(
                    $document->file_path,
                    $document->file_name . '.' . $document->file_extension
                );
            } catch (\Throwable $e) {
                \Log::error('[DriveDocument] Download from Drive failed: ' . $e->getMessage());
            }
        }

        // Fallback to local
        $localPath = public_path($document->local_path);
        if (File::exists($localPath)) {
            return response()->download(
                $localPath,
                $document->file_name . '.' . $document->file_extension
            );
        }

        return redirect()->back()->with('error', 'File not found on Drive or locally.');
    }

    // ══════════════════════════════════════════════════════
    // SYNC ALL — Retry failed/pending documents
    // ══════════════════════════════════════════════════════
    public function syncAll()
    {
        $documents = DriveDocument::where('created_by', Auth::id())
            ->whereIn('drive_sync_status', ['failed', 'pending'])
            ->get();

        $synced = 0;
        $failed = 0;

        foreach ($documents as $doc) {
            $localPath = public_path($doc->local_path);

            if (!File::exists($localPath)) {
                $failed++;
                continue;
            }

            try {
                Storage::disk('google')->put($doc->file_path, File::get($localPath));
                $doc->update(['drive_sync_status' => 'synced']);
                $synced++;
            } catch (\Throwable $e) {
                $doc->update(['drive_sync_status' => 'failed']);
                $failed++;
            }
        }

        return redirect()->route('drive-documents.index')
            ->with('success', "{$synced} document(s) synced. {$failed} failed.");
    }

    // ══════════════════════════════════════════════════════
    // PRIVATE HELPERS
    // ══════════════════════════════════════════════════════
    private function deleteLocalFile(?string $localPath): void
    {
        if ($localPath && File::exists(public_path($localPath))) {
            File::delete(public_path($localPath));
        }
    }

    private function deleteDriveFile(?string $drivePath): void
    {
        if (!$drivePath) return;
        try {
            if (Storage::disk('google')->exists($drivePath)) {
                Storage::disk('google')->delete($drivePath);
            }
        } catch (\Throwable $e) {
            \Log::error('[DriveDocument] Drive delete failed: ' . $e->getMessage());
        }
    }

    private function formatFileSize(int $bytes): string
    {
        if ($bytes >= 1048576) return round($bytes / 1048576, 2) . ' MB';
        if ($bytes >= 1024)    return round($bytes / 1024, 2) . ' KB';
        return $bytes . ' B';
    }
}
