<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bg_pg_models', function (Blueprint $table) {
            $table->id();
            $table->string('client_name',255)->nullable(false);
            $table->string('address',255)->nullable(false);
            $table->string('tender_name',255)->nullable(false);
            $table->string('tender_reference_no',255)->nullable();
            $table->string('tender_id',100)->nullable();
            $table->date('tender_published_date')->nullable(false);
            $table->string('bg_pg_type',55)->nullable(false);
            $table->string('bank_name',255)->nullable(false);
            $table->string('bg_pg_no',100)->nullable(false);
            $table->date('bg_pg_date');
            $table->unsignedDouble('bg_pg_amount',12,2)->nullable(false);
            $table->date('bg_pg_expire_date')->nullable(false);
            $table->integer('status')->nullable(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bg_pg_models');
    }
};
