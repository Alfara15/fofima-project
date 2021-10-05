<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\Transaksi;
use App\Perkiraan;

class TransaksiController extends Controller
{
   public function index(){
        $kredit = Perkiraan::where('nmr_perkiraan','1001')->orWhere('nmr_perkiraan','1002')->orWhere('nmr_perkiraan','1003')->get();
        $perkiraan = Perkiraan::whereNotIn('nmr_perkiraan', ['1001','1002','1003'])->get();
        return view('transaksi', compact('kredit','perkiraan'));
   }

   public function prosestransaksi(Request $request){
        
        $this->validate($request, [
            'file' => 'mimes:jpeg,png,bmp,tiff |max:4096',
        ],
            $messages = [
                'required' => 'semua wajib diisi',
                'mimes' => 'masukan format gambar'
            ]
        );
       $file = $request->file('file');
       $tanggal = $request->input('tanggal');
       $nominal = $request->input('nominal');
       $perkiraan = $request->input('perkiraan');
       $kredit = $request->input('kredit');
       $keterangan = $request->input('keterangan');

       $namafile = $file->getClientOriginalName();
       $tujuanupload = 'nota';
      $upload = DB::table('buku_besar')->insert(['tanggal' => $tanggal, 'tipe' => 'debet', 'nmr_perkiraan' => $perkiraan, 'nominal' => $nominal, 'keterangan_transaksi' => $keterangan, 'nota' => $namafile]);
      $upload2 = DB::table('buku_besar')->insert(['tanggal' => $tanggal, 'tipe' => 'kredit', 'nmr_perkiraan' => $kredit, 'nominal' => $nominal, 'keterangan_transaksi' => $keterangan, 'nota' => $namafile]);
       if($upload and $upload2){
           $file->move($tujuanupload,$file->getClientOriginalName());
           $transaksi = Transaksi::get();
           return redirect('/BukuBesar');

       }else{
           echo "gagal";
       }


   }
   public function tampilkan(){
         $transaksi = DB::table('buku_besar')->get();
     

        $perkiraan = DB::table('nomor_perkiraan')->get();
        return view('tabel',compact('transaksi','perkiraan'));
   }
}
