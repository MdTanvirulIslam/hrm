<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('invoices', function (Blueprint $table) {
            $table->string('advance_paid_type')->default('fixed')->after('advance_paid');
            $table->decimal('advance_paid_fixed', 15, 2)->default(0)->after('advance_paid_type');
            $table->decimal('tax_total', 15, 2)->default(0)->after('grand_total');
        });

        // Add amount_with_tax column to invoice_items (if not already in your tax migration)
        Schema::table('invoice_items', function (Blueprint $table) {
            $table->decimal('amount_with_tax', 15, 2)->default(0)->after('total_price');
        });
    }

    public function down()
    {
        Schema::table('invoices', function (Blueprint $table) {
            $table->dropColumn(['advance_paid_type', 'advance_paid_fixed', 'tax_total']);
        });

        Schema::table('invoice_items', function (Blueprint $table) {
            $table->dropColumn('amount_with_tax');
        });
    }
};
