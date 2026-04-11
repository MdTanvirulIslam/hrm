<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tenders', function (Blueprint $table) {
            $table->id();
            $table->string('tender_name');
            $table->string('reference_number')->nullable();
            $table->text('description')->nullable();
            $table->date('submission_date');
            $table->date('opening_date')->nullable();
            $table->decimal('estimated_value', 15, 2)->nullable();
            $table->enum('status', ['draft', 'submitted', 'awarded', 'rejected', 'cancelled'])->default('draft');
            $table->boolean('reminder_sent')->default(false);
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();

            $table->foreign('created_by')->references('id')->on('users')->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tenders');
    }
};
