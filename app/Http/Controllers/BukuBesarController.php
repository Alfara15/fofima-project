<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Transaksi;
use App\Perkiraan;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class BukuBesarController extends Controller
{
    public function index(){
        $kredit = Perkiraan::where('nmr_perkiraan','1001')->orWhere('nmr_perkiraan','1002')->orWhere('nmr_perkiraan','1003')->get();
        $bulanini = Carbon::now()->isoFormat('MMMM');
        $bulanini2 = Carbon::now()->month;
        $perkiraan = Perkiraan::get();
        $bulan = array('1','2','3','4','5','6','7','8','9','10','11','12');
        $bulanString = array('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember');


        $transaksi = Transaksi::whereMonth('tanggal', $bulanini2)->get();


        return view('admin.transaksi', compact('perkiraan','transaksi','bulanString','bulan','bulanini','kredit'));
    }

    public function tampilkan(Request $req){
        $stat = 'default';
        $perkiraan = Perkiraan::get();
        $kodeper = $req->input('kodeper');
        $bulanselect = $req->input('bulan');
        
        $bulan = array('1','2','3','4','5','6','7','8','9','10','11','12');
        $bulanString = array('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','Novermber','Desember');


        if($bulanselect == 'semua' && $kodeper == 'semua'){
            $trans = array();
            for($i = 0;$i < count($bulan);$i++){
                $bulanews = (int) $bulan[$i];
                $transaksi = Transaksi::whereMonth('tanggal', $bulanews)->get();
                array_push($trans, $transaksi);
            }
            $stat = 'allMonthAllItems';
            return view('admin.bukuBesar', compact('perkiraan','kodeper','trans','bulanString','bulan', "bulanselect","stat"));
        }else if($bulanselect == 'semua'){
            $trans = array();
            for($i = 0;$i < count($bulan);$i++){
                $bulanews = (int) $bulan[$i];
                $transaksi = Transaksi::where('nmr_perkiraan', $kodeper)->whereMonth('tanggal', $bulanews)->get();
                array_push($trans, $transaksi);
            }
            $stat = 'allMonth';
            return view('admin.bukuBesar', compact('perkiraan','kodeper','trans','bulanString','bulan', "bulanselect", "stat"));
        }else if($kodeper == 'semua'){
            $transaksi = Transaksi::whereMonth('tanggal', $bulanselect)->get();

            return view('admin.bukuBesar', compact('perkiraan','kodeper','transaksi','bulanString','bulan', 'stat','bulanselect'));
        }else{
            $transaksi = Transaksi::where('nmr_perkiraan', $kodeper)->whereMonth('tanggal', $bulanselect)->get();
            return view('admin.bukuBesar', compact('perkiraan','kodeper','transaksi','bulanString','bulan', 'stat','bulanselect'));
        }


        
        
        


    }
}
