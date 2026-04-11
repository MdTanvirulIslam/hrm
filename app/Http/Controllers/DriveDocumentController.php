<?php

namespace App\Http\Controllers;

use App\Models\DriveDocument;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Google\Client;
use Google\Service\Drive;
use Google\Service\Drive\Permission;

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

    // Max file size: 150MB
    protected int $maxFileSize = 153600;

    // ══════════════════════════════════════════════════════
    // INDEX — List all documents grouped by folder
    // ══════════════════════════════════════════════════════
    public function index(Request $request)
    {
        $query = DriveDocument::where('created_by', Auth::id())
            ->orderBy('folder_name')
            ->orderBy('sub_folder_name')
            ->orderBy('created_at', 'desc');

        if ($request->filled('folder')) {
            $query->where('folder_name', $request->folder);
        }

        if ($request->filled('sub_folder')) {
            $query->where('sub_folder_name', $request->sub_folder);
        }

        if ($request->filled('status')) {
            $query->where('drive_sync_status', $request->status);
        }

        if ($request->filled('search')) {
            $query->where('file_name', 'like', '%' . $request->search . '%');
        }

        $documents = $query->get();

        $folders = DriveDocument::where('created_by', Auth::id())
            ->distinct()
            ->pluck('folder_name');

        // Sub-folders scoped to selected folder (for filter dropdown)
        $subFolders = collect();
        if ($request->filled('folder')) {
            $subFolders = DriveDocument::where('created_by', Auth::id())
                ->where('folder_name', $request->folder)
                ->whereNotNull('sub_folder_name')
                ->distinct()
                ->pluck('sub_folder_name');
        }

        // Group by folder → sub-folder for display
        $groupedDocuments = $documents->groupBy('folder_name')->map(function ($folderDocs) {
            return $folderDocs->groupBy(fn($doc) => $doc->sub_folder_name ?? '__root__');
        });

        return view('drive-documents.index', compact(
            'documents',
            'groupedDocuments',
            'folders',
            'subFolders'
        ));
    }

    // ══════════════════════════════════════════════════════
    // CREATE — Show upload form
    // ══════════════════════════════════════════════════════
    public function create()
    {
        $existingFolders = DriveDocument::where('created_by', Auth::id())
            ->distinct()
            ->pluck('folder_name');

        // For sub-folder datalist — grouped by folder as JSON for JS
        $folderSubFolders = DriveDocument::where('created_by', Auth::id())
            ->whereNotNull('sub_folder_name')
            ->select('folder_name', 'sub_folder_name')
            ->distinct()
            ->get()
            ->groupBy('folder_name')
            ->map(fn($items) => $items->pluck('sub_folder_name')->unique()->values());

        return view('drive-documents.create', compact('existingFolders', 'folderSubFolders'));
    }

    // ══════════════════════════════════════════════════════
    // STORE — Upload file locally + sync to Google Drive
    // ══════════════════════════════════════════════════════
    public function store(Request $request)
    {
        set_time_limit(0);
        ini_set('memory_limit', '512M');

        $validator = Validator::make($request->all(), [
            'folder_name'     => ['required', 'string', 'max:100', 'regex:/^[a-zA-Z0-9_\- ]+$/'],
            'sub_folder_name' => ['nullable', 'string', 'max:100', 'regex:/^[a-zA-Z0-9_\- ]+$/'],
            'file_name'       => 'required|string|max:255',
            'description'     => 'nullable|string|max:1000',
            'document'        => ['required', 'file', 'max:' . $this->maxFileSize],
        ], [
            'folder_name.regex'     => 'Folder name can only contain letters, numbers, spaces, hyphens and underscores.',
            'sub_folder_name.regex' => 'Sub-folder name can only contain letters, numbers, spaces, hyphens and underscores.',
            'folder_name.required'  => 'Please provide a folder name.',
            'file_name.required'    => 'Please provide a display name for the file.',
            'document.required'     => 'Please select a file to upload.',
            'document.max'          => 'File size must not exceed 150MB.',
        ]);

        if ($validator->fails()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['error' => $validator->errors()->first()], 422);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $file = $request->file('document');

        // ✅ Capture all metadata BEFORE move
        $extension    = strtolower($file->getClientOriginalExtension());
        $mimeType     = $file->getMimeType();
        $originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $fileSize     = $file->getSize();

        if (!in_array($extension, $this->allowedExtensions) || !in_array($mimeType, $this->allowedMimeTypes)) {
            $errorMsg = 'Invalid file type. Allowed: PDF, DOC, DOCX, XLS, XLSX, CSV, JPG, JPEG, PNG.';
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['error' => $errorMsg], 422);
            }
            return redirect()->back()->with('error', $errorMsg)->withInput();
        }

        // Build unique stored filename
        $safeOriginal    = Str::slug($originalName);
        $fileNameToStore = $safeOriginal . '_' . time() . '.' . $extension;

        // Folder & sub-folder
        $folderName        = trim($request->folder_name);
        $subFolderName     = $request->filled('sub_folder_name') ? trim($request->sub_folder_name) : null;
        $safeFolderName    = Str::slug($folderName, '_');
        $safeSubFolderName = $subFolderName ? Str::slug($subFolderName, '_') : null;

        // Build paths — folder/sub-folder/file  OR  folder/file
        $relativePath = $safeSubFolderName
            ? $safeFolderName . '/' . $safeSubFolderName
            : $safeFolderName;

        $localDir      = 'storage/uploads/drive-documents/' . $relativePath . '/';
        $localFullPath = public_path($localDir . $fileNameToStore);
        $drivePath     = $relativePath . '/' . $fileNameToStore;

        try {
            // 1️⃣ Save locally
            File::ensureDirectoryExists(public_path($localDir));
            $file->move(public_path($localDir), $fileNameToStore);

            // 2️⃣ Upload to Google Drive (streaming for large files)
            $driveStatus = 'synced';
            try {
                if ($fileSize > 50 * 1024 * 1024) {
                    $stream = fopen($localFullPath, 'r');
                    Storage::disk('google')->put($drivePath, $stream);
                    if (is_resource($stream)) fclose($stream);
                } else {
                    Storage::disk('google')->put($drivePath, File::get($localFullPath));
                }
            } catch (\Throwable $e) {
                \Log::error('[DriveDocument] Upload failed: ' . $e->getMessage());
                $driveStatus = 'failed';
            }

            // 3️⃣ Save to DB
            DriveDocument::create([
                'folder_name'        => $folderName,
                'sub_folder_name'    => $subFolderName,
                'file_name'          => $request->file_name,
                'file_path'          => $drivePath,
                'local_path'         => $localDir . $fileNameToStore,
                'description'        => $request->description,
                'file_extension'     => $extension,
                'file_size'          => $this->formatFileSize($fileSize),
                'drive_sync_status'  => $driveStatus,
                'created_by'         => Auth::id(),
            ]);

            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success'      => true,
                    'message'      => $driveStatus === 'synced'
                        ? 'Document uploaded successfully.'
                        : 'Document saved locally but Google Drive sync failed.',
                    'drive_status' => $driveStatus,
                ]);
            }

            $message = $driveStatus === 'synced'
                ? 'Document uploaded and synced to Google Drive successfully.'
                : 'Document saved locally. Google Drive sync failed — check logs.';

            return redirect()->route('drive-documents.index')->with('success', $message);

        } catch (\Throwable $e) {
            \Log::error('[DriveDocument] Store method error: ' . $e->getMessage());

            if (File::exists($localFullPath)) File::delete($localFullPath);

            if ($request->ajax() || $request->wantsJson()) {
                return response()->json(['error' => 'Upload failed: ' . $e->getMessage()], 500);
            }

            return redirect()->back()->with('error', 'Upload failed. Please try again.')->withInput();
        }
    }

    // ══════════════════════════════════════════════════════
    // SHOW — Preview document details
    // ══════════════════════════════════════════════════════
    public function show($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())->findOrFail($id);
        return view('drive-documents.show', compact('document'));
    }

    // ══════════════════════════════════════════════════════
    // EDIT — Show edit form
    // ══════════════════════════════════════════════════════
    public function edit($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())->findOrFail($id);

        $existingFolders = DriveDocument::where('created_by', Auth::id())
            ->distinct()->pluck('folder_name');

        $folderSubFolders = DriveDocument::where('created_by', Auth::id())
            ->whereNotNull('sub_folder_name')
            ->select('folder_name', 'sub_folder_name')
            ->distinct()
            ->get()
            ->groupBy('folder_name')
            ->map(fn($items) => $items->pluck('sub_folder_name')->unique()->values());

        return view('drive-documents.edit', compact('document', 'existingFolders', 'folderSubFolders'));
    }

    // ══════════════════════════════════════════════════════
    // UPDATE — Update metadata or replace file
    // ══════════════════════════════════════════════════════
    public function update(Request $request, $id)
    {
        $document = DriveDocument::where('created_by', Auth::id())->findOrFail($id);

        $rules = [
            'folder_name'     => ['required', 'string', 'max:100', 'regex:/^[a-zA-Z0-9_\- ]+$/'],
            'sub_folder_name' => ['nullable', 'string', 'max:100', 'regex:/^[a-zA-Z0-9_\- ]+$/'],
            'file_name'       => 'required|string|max:255',
            'description'     => 'nullable|string|max:1000',
        ];

        if ($request->hasFile('document')) {
            $rules['document'] = 'file|max:' . $this->maxFileSize;
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        if ($request->hasFile('document')) {
            $file = $request->file('document');

            // ✅ Capture all metadata BEFORE move
            $extension    = strtolower($file->getClientOriginalExtension());
            $mimeType     = $file->getMimeType();
            $originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
            $fileSize     = $file->getSize();

            if (!in_array($extension, $this->allowedExtensions) || !in_array($mimeType, $this->allowedMimeTypes)) {
                return redirect()->back()->with('error', 'Invalid file type.')->withInput();
            }

            // Delete old files
            $this->deleteLocalFile($document->local_path);
            $this->deleteDriveFile($document->file_path);

            // Build new paths
            $safeOriginal      = Str::slug($originalName);
            $fileNameToStore   = $safeOriginal . '_' . time() . '.' . $extension;
            $safeFolderName    = Str::slug(trim($request->folder_name), '_');
            $subFolderName     = $request->filled('sub_folder_name') ? trim($request->sub_folder_name) : null;
            $safeSubFolderName = $subFolderName ? Str::slug($subFolderName, '_') : null;

            $relativePath  = $safeSubFolderName
                ? $safeFolderName . '/' . $safeSubFolderName
                : $safeFolderName;

            $localDir      = 'storage/uploads/drive-documents/' . $relativePath . '/';
            $localFullPath = public_path($localDir . $fileNameToStore);
            $drivePath     = $relativePath . '/' . $fileNameToStore;

            File::ensureDirectoryExists(public_path($localDir));
            $file->move(public_path($localDir), $fileNameToStore);

            $driveStatus = 'failed';
            try {
                Storage::disk('google')->put($drivePath, File::get($localFullPath));
                $driveStatus = 'synced';
            } catch (\Throwable $e) {
                \Log::error('[DriveDocument] Update upload failed: ' . $e->getMessage());
            }

            $document->file_path         = $drivePath;
            $document->local_path        = $localDir . $fileNameToStore;
            $document->file_extension    = $extension;
            $document->file_size         = $this->formatFileSize($fileSize);
            $document->drive_sync_status = $driveStatus;
            $document->sub_folder_name   = $subFolderName;
        } else {
            // Even without a new file, update sub_folder_name field
            $document->sub_folder_name = $request->filled('sub_folder_name')
                ? trim($request->sub_folder_name)
                : null;
        }

        $document->folder_name = trim($request->folder_name);
        $document->file_name   = $request->file_name;
        $document->description = $request->description;
        $document->save();

        return redirect()->route('drive-documents.index')
            ->with('success', 'Document updated successfully.');
    }

    // ══════════════════════════════════════════════════════
    // DESTROY — Delete from local + Google Drive + DB
    // ══════════════════════════════════════════════════════
    public function destroy($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())->findOrFail($id);

        $this->deleteLocalFile($document->local_path);
        $this->deleteDriveFile($document->file_path);
        $document->delete();

        return redirect()->route('drive-documents.index')
            ->with('success', 'Document deleted successfully.');
    }

    // ══════════════════════════════════════════════════════
    // DOWNLOAD — Download file from Google Drive
    // ══════════════════════════════════════════════════════
    public function download($id)
    {
        $document = DriveDocument::where('created_by', Auth::id())->findOrFail($id);

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

    public function getLink($id)
    {
        try {
            $document = DriveDocument::where('created_by', Auth::id())->findOrFail($id);

            if (!$document->isSynced()) {
                return response()->json(['error' => 'File is not synced to Google Drive.'], 404);
            }

            // ✅ Correct token exchange
            $client = new \Google\Client();
            $client->setClientId(config('filesystems.disks.google.clientId'));
            $client->setClientSecret(config('filesystems.disks.google.clientSecret'));
            $client->setAccessType('offline');

            $token = $client->fetchAccessTokenWithRefreshToken(
                config('filesystems.disks.google.refreshToken')
            );

            if (!isset($token['access_token'])) {
                \Log::error('[DriveDocument] getLink token failed', $token);
                return response()->json(['error' => 'Google authentication failed.'], 500);
            }

            $client->setAccessToken($token);
            $service      = new \Google\Service\Drive($client);
            $rootFolderId = config('filesystems.disks.google.folder') ?: 'root';

            // ✅ Search by filename directly — avoids all path traversal issues
            $fileName = basename($document->file_path);

            $fileResult = $service->files->listFiles([
                'q'      => "name = '{$fileName}' and trashed = false",
                'fields' => 'files(id, name, parents)',
            ]);

            $files = $fileResult->getFiles();

            if (empty($files)) {
                \Log::error('[DriveDocument] File not found on Drive', [
                    'filename'  => $fileName,
                    'file_path' => $document->file_path,
                ]);
                return response()->json(['error' => 'File not found on Google Drive.'], 404);
            }

            $fileId = $files[0]->getId();

            // ✅ Make file publicly readable
            try {
                $permission = new \Google\Service\Drive\Permission();
                $permission->setType('anyone');
                $permission->setRole('reader');
                $service->permissions->create($fileId, $permission);
            } catch (\Throwable $e) {
                \Log::warning('[DriveDocument] Permission set failed: ' . $e->getMessage());
            }

            return response()->json([
                'url' => 'https://drive.google.com/file/d/' . $fileId . '/view?usp=sharing'
            ]);

        } catch (\Throwable $e) {
            \Log::error('[DriveDocument] getLink failed: ' . $e->getMessage());
            return response()->json([
                'error' => 'Could not retrieve Drive link: ' . $e->getMessage()
            ], 500);
        }
    }
}


