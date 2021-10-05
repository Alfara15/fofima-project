<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTabelNomorPerkiraan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nomor_perkiraan', function(Blueprint $table){
            $table->string('nmr-perkiraan', 10);
            $table->string('keterangan_nomor');
            $table->string('kategori');
            $table->string('kode-kategori', 10);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
