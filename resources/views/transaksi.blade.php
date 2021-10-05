@extends('layout.keuangan')
@section('title', 'Buku Besar')
@section('konten')
@php
        $bln = 'semua';
        $perk = 'semua';
        
        if(isset($bulanselect)){
            $bln = $bulanselect;
            $perk = $kodeper;
        }


    @endphp
    
        <script>
            $(document).ready(function(){
                var d = new Date();

                var date = $("#date").val();
                alert(d);
            });
        </script>
    <div class="container">
        <div class="row">
            <div class="col-6">
            <h1>TRANSAKSI</h1>
            </div>
            <div class="col-6">
            <!-- Button trigger modal -->
<button type="button" class="btn btn-primary float-right" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Tambah Transaksi
</button>
</div>


<form action="/BukuBesar/cari" method='post' class="m-3">
        @csrf
        <div class="form-group col-xs-2">
            <label for="exampleInputEmail1">Bulan</label>
            <select name="bulan" id="" class="form-control" style="width: 10rem">
             @for($j = 0;$j < count($bulan); $j++)
                <option value="{{$bulan[$j]}}" 
                @if($bulan[$j] == $bln)
                 selected
                  @endif >{{$bulanString[$j]}}</option>
             @endfor 
             <option value="semua" @if($bln == 'semua')
                 selected
                  @endif > Semua </option>
             </select>
        </div>
        <div class="form-group mb-3">
            <label for="exampleInputPassword1">Kode Perkiraan</label>
            <select name="kodeper" id="" class='form-control' style="width: 20rem">
            @foreach($perkiraan as $p)
                <option value="{{$p->nmr_perkiraan}}" @if($p->nmr_perkiraan == $perk)
                 selected
                  @endif>{{$p->nmr_perkiraan}} {{$p->keterangan_nomor}}</option>
            @endforeach
                <option value="semua"
                @if($perk == "semua")
                 selected
                  @endif> Semua </option>
        </select>
        </div>
        <button type="submit" class="btn btn-primary">Cari</button>
    </form>
    <hr>

    
    <div class="fof-flex">
@php
    $totalDebet = 0;
    $totalKredit = 0;
@endphp

@php

if(isset($stat)){ 
switch($stat){
    case "allMonthAllItems": @endphp
        @for($i = 0; $i < count($trans); $i++)
        @php
                    $totalDebetT = 0;
                    $totalKreditT = 0;
                @endphp
            <table border=1 class='table table-stripped' style:"background-color: yellow">
                <tr>
                    <th>Tanggal</th>
                    <th>Nomer Perkiraan</th>
                    <th>Keterangan</th>
                    <th>Tipe</th>
                    <th>Nominal</th>
                </tr>
                @foreach($trans[$i] as $t)
                
                <tr>
                    <td>{{$t['tanggal']}}</td>
                    <td>{{$t['nmr_perkiraan']}}</td>
                    <td>{{$t['keterangan_transaksi']}}</td>
                    <td>{{$t['tipe']}}</td>
                    <td>{{$t['nominal']}}</td>
                </tr>
                @php
                    if($t['tipe'] == 'debet'){
                        $totalDebetT += $t['nominal'];
                    }else{
                        $totalKreditT += $t['nominal'];
                    }
                    
                    
                @endphp
                @endforeach
                <tr>
                    <th colspan=4>Total Debet</th>
                    <th>{{$totalDebetT}}</th>
                </tr>
                <tr>
                    <th colspan=4>Total Kredit</th>
                    <th>{{$totalKreditT}}</th>
                </tr>
            </table>
        @endfor
       @php break;
    case "allMonth": @endphp
    @for($i = 0; $i < count($trans); $i++)
        @php
                    $totalDebetT = 0;
                    $totalKreditT = 0;
                @endphp
             <table border=1 class='table table-stripped' style:"background-color: yellow">
                 <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Nomer Perkiraan</th>
                        <th>Keterangan</th>
                        <th>Tipe</th>
                        <th>Nominal</th>
                    </tr>
                </thead>
                @foreach($trans[$i] as $t)
                <tbody>
                <tr>
                    <td>{{$t['tanggal']}}</td>
                    <td>{{$t['nmr_perkiraan']}}</td>
                    <td>{{$t['keterangan_transaksi']}}</td>
                    <td>{{$t['tipe']}}</td>
                    <td>{{$t['nominal']}}</td>
                </tr>
                
                @php
                    if($t['tipe'] == 'debet'){
                        $totalDebetT += $t['nominal'];
                    }else{
                        $totalKreditT += $t['nominal'];
                    }
                    
                    
                @endphp
                @endforeach
                <tr>
                    <th colspan=4>Total Debet</th>
                    <th>{{$totalDebetT}}</th>
                </tr>
                <tr>
                    <th colspan=4>Total Kredit</th>
                    <th>{{$totalKreditT}}</th>
                </tr>
                </tbody>
            </table>
        @endfor

        @php break;
    case "allItems": @endphp
        

        @php break;
    default:  @endphp

    <table border=1 class='table table-stripped' style:"background-color: yellow">
        <tr>
            <th>Tanggal</th>
            <th>Nomor Perkiraan</th>
            <th>Keterangan</th>
            <th>Tipe</th>
            <th>Nominal</th>
        </tr>
        @foreach($transaksi as $t)
        <tr>
            <td align=center>{{$t->tanggal}}</td>
            <td align=center>{{$t->nmr_perkiraan}}</td>
            <td align=center>{{$t->keterangan_transaksi}}</td>
            <td align=center>{{$t->tipe}}</td>
            <td align=center>{{$t->nominal}}</td>
        </tr>
        @php
            if($t->tipe == 'debet'){
                $totalDebet += $t->nominal;
            }else{
                $totalKredit += $t->nominal;
            }
            
            
        @endphp
        @endforeach
        <tr>
            <td align=center colspan=4>Total Debet</td>
            <td align=center>{{$totalDebet}}</td>
        </tr><tr>
            <td align=center colspan=4>Total Kredit</td>
            <td align=center>{{$totalKredit}}</td>
        </tr>
    </table>
        @php break; 
}
    



 }else{ @endphp 
    <div class='fof-debet'>
    <table border=1 class="table table-stripped ">
        <tr>
            <th>Tanggal</th>
            <th>Nomor Perkiraan</th>
            <th>Keterangan</th>
            <th>Tipe</th>
            <th>Nominal</th>
        </tr>
        @foreach($transaksi as $t)
        <tr>
            <td align=center>{{$t->tanggal}}</td>
            <td align=center>{{$t->nmr_perkiraan}}</td>
            <td align=center>{{$t->keterangan_transaksi}}</td>
            <td align=center>{{$t->tipe}}</td>
            <td align=center>{{$t->nominal}}</td>
        </tr>
        @php
            if($t->tipe == 'debet'){
                $totalDebet += $t->nominal;
            }else{
                $totalKredit += $t->nominal;
            }
            
            
        @endphp
        @endforeach
        <tr>
            <td align=center colspan=4>Total Debet</td>
            <td align=center>{{$totalDebet}}</td>
        </tr><tr>
            <td align=center colspan=4>Total Kredit</td>
            <td align=center>{{$totalKredit}}</td>
        </tr>
    </table>
   

</div>    
@php } @endphp

    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Transaksi</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="/bukubesar/transaksi" method="POST" enctype='multipart/form-data'>
                          @csrf
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="form-label">Tanggal</label>
                                <input type="date" class="form-control" id="exampleInputPassword1" name='tanggal' required id='date'>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="form-label">Kredit</label>
                                <select  id="" class="form-control" required name='kredit'>
                                    @foreach($kredit as $k)
                                        <option value="{{$k->nmr_perkiraan}}">{{$k->nmr_perkiraan}} {{$k->keterangan_nomor}}</option>
                                    @endforeach
                                </select>
                                <div id="emailHelp" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="form-label">Debet</label>
                                <select  id="" class="form-control" required name='perkiraan'>
                                    @foreach($perkiraan as $p)
                                        <option value="{{$k->nmr_perkiraan}}">{{$p->nmr_perkiraan}} {{$p->keterangan_nomor}}</option>
                                    @endforeach
                                </select>
                                <div id="emailHelp" class="form-text"></div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="form-label">Nominal</label>
                                <input type="text" class="form-control" required name='nominal'>
                            </div>
                            <div class="mb-3 form-group">
                                <label for="exampleInputPassword1" class="form-label">keterangan Transakasi</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" required name='keterangan'>
                            </div>
                            
                            <div class="mb-3 form-check">
                                <label for="nota" class="form-label">Nota</label>
                                <input type="file" class="form-input-file" id="nota" name=
                                'file'>

                            </div>
                        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batalkan</button>
        <button type="submit" class="btn btn-primary">Kirim</button>
        </form>
      </div>
    </div>
  </div>
</div>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
@endsection