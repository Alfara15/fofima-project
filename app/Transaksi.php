<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'buku_besar';
    protected $primaryKey = 'tanggal';
    public $incrementing = false;
    public $keyType = 'date';
}
