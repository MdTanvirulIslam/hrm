<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('drive_documents', function (Blueprint $table) {
            // Add after folder_name
            $table->string('sub_folder_name')->nullable()->after('folder_name');
        });
    }

    public function down(): void
    {
        Schema::table('drive_documents', function (Blueprint $table) {
            $table->dropColumn('sub_folder_name');
        });
    }
};
