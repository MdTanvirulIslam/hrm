<?php
// database/migrations/xxxx_add_product_name_to_invoice_items_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('invoice_items', function (Blueprint $table) {
            $table->string('product_name')->after('row_order');
        });
    }

    public function down()
    {
        Schema::table('invoice_items', function (Blueprint $table) {
            $table->dropColumn('product_name');
        });
    }
};
