<?php
// database/migrations/2024_01_01_000000_create_invoices_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoicesTable extends Migration
{
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_number')->unique();
            $table->date('invoice_date');
            $table->string('reference_work_order')->nullable();
            $table->string('bill_to_name');
            $table->text('bill_to_address');
            $table->decimal('grand_total', 15, 2)->default(0);
            $table->decimal('advance_paid', 15, 2)->default(0);
            $table->decimal('rest_payable', 15, 2)->default(0);
            $table->decimal('net_payable', 15, 2)->default(0);
            $table->text('amount_in_words')->nullable();

            // Make created_by nullable for flexibility
            $table->unsignedBigInteger('created_by')->nullable();
            $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');

            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('invoice_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('invoice_id');
            $table->integer('row_order')->default(0);
            $table->text('item_description');
            $table->integer('quantity')->default(1);
            $table->decimal('unit_price', 15, 2)->default(0);
            $table->decimal('vat_amount', 15, 2)->default(0);
            $table->decimal('total_price', 15, 2)->default(0);
            $table->timestamps();

            $table->foreign('invoice_id')->references('id')->on('invoices')->onDelete('cascade');
        });

        Schema::create('invoice_terms', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('invoice_id');
            $table->integer('row_order')->default(0);
            $table->text('term_description');
            $table->timestamps();

            $table->foreign('invoice_id')->references('id')->on('invoices')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('invoice_terms');
        Schema::dropIfExists('invoice_items');
        Schema::dropIfExists('invoices');
    }
}
