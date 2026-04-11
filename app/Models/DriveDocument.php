<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DriveDocument extends Model
{
    use HasFactory;

    protected $table = 'drive_documents';

    protected $fillable = [
        'folder_name',
        'sub_folder_name',
        'file_name',
        'file_path',
        'local_path',
        'description',
        'file_extension',
        'file_size',
        'drive_sync_status',
        'created_by',
    ];

    // ── Relationships ──────────────────────────────────────
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    // ── Helpers ────────────────────────────────────────────
    public function isSynced(): bool
    {
        return $this->drive_sync_status === 'synced';
    }

    /**
     * Returns the full folder path: "Folder / Sub Folder" or just "Folder"
     */
    public function fullFolderPath(): string
    {
        return $this->sub_folder_name
            ? $this->folder_name . ' / ' . $this->sub_folder_name
            : $this->folder_name;
    }

    public function syncStatusBadge(): string
    {
        return match($this->drive_sync_status) {
            'synced'  => '<span class="badge bg-success"><i class="ti ti-cloud-check"></i> Synced</span>',
            'failed'  => '<span class="badge bg-danger"><i class="ti ti-cloud-off"></i> Failed</span>',
            default   => '<span class="badge bg-warning text-dark"><i class="ti ti-clock"></i> Pending</span>',
        };
    }

    public function fileIcon(): string
    {
        return match(strtolower($this->file_extension)) {
            'pdf'            => 'ti-file-type-pdf text-danger',
            'doc', 'docx'    => 'ti-file-type-doc text-primary',
            'xls', 'xlsx'    => 'ti-file-type-xls text-success',
            'csv'            => 'ti-file-spreadsheet text-success',
            'jpg', 'jpeg',
            'png'            => 'ti-photo text-warning',
            default          => 'ti-file text-secondary',
        };
    }
}
