<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('drive_documents', function (Blueprint $table) {
            $table->id();
            $table->string('folder_name');                          // Folder name in Google Drive
            $table->string('file_name');                            // Original display name
            $table->string('file_path');                            // Google Drive file path
            $table->string('local_path')->nullable();               // Local storage path
            $table->text('description')->nullable();                // File description
            $table->string('file_extension', 10)->nullable();       // pdf, docx, jpg etc.
            $table->string('file_size')->nullable();                // Human readable size
            $table->enum('drive_sync_status', ['synced', 'failed', 'pending'])->default('pending');
            $table->unsignedBigInteger('created_by')->nullable();   // Auth user id
            $table->timestamps();

            $table->foreign('created_by')->references('id')->on('users')->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('drive_documents');
    }
};
