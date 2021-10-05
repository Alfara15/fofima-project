<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTabelBukuBesar extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buku_besar', function(Blueprint $table){
            $table->date('tanggal');
            $table->enum('tipe', ['debet','kredit'])->default('debet');
            $table->string('nmr_perkiraan', 100);
            $table->integer('nominal');
            $table->string('keterangan-transaksi');
            $table->string('nota');
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
        //
    }
}
