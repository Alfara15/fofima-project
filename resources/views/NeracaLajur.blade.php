@section('title', ' Neraca Lajur')
@section('icon', 'bi-file-earmark-bar-graph')
@extends('layout.keuangan')
@section('konten')
    <h2>Yayasan SMK Bagimu Negeriku</h2><br>
     <h3>Tahun 2021</h3>
    <form action="/neracaLajur/cari" method="POST">
        @csrf
        <div class="form-group">
            <label for="exampleInputEmail1">Nomor Pekiraan</label>
            <select name="nomor" id="" class='form-control' style="width: 20rem">
                @foreach($perkiraan as $p)
                    <option value="{{$p['nmr_perkiraan']}}">{{$p['nmr_perkiraan']}} {{$p['keterangan_nomor']}}</option>
                @endforeach
             </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Bulan</label>
            <select name="bulaninput" id="" class='form-control' style="width: 20rem">
                @foreach($bulanString as $b)
                    <option value="{{$b}}">{{$b}}</option>
                @endforeach
             </select>
        </div>
        <button type="submit" class="btn btn-primary mt-3">cari</button>
    </form>
    <br><br>
    <table border='1' class='table table-stripped table-dark'>
    <thead>
    <tr>
        <th rowspan=2 align='center'>Keterangan</th>
        <th rowspan=2>Nomor Perkiraan</th>
        <th rowspan=2>Saldo</th>
        <th colspan=2>Januari</th>
        <th colspan=2>Februari</th>
        <th colspan=2>Maret</th>
        <th colspan=2>April</th>
        <th colspan=2>Mei   </th>
        <th colspan=2>Juni</th>
        <th colspan=2>Juli</th>
        <th colspan=2>Agustus</th>
        <th colspan=2>September</th>
        <th colspan=2>Oktober</th>
        <th colspan=2>November</th>
        <th colspan=2>Desember</th>
        <th colspan=2 style="background-color: green">Mutasi/31 Desember 2021</th>
    </tr>
    <tr>
        <th>Debet</th>
        <th>Kredit</th>
        <th style="background-color: green">Debet</th>
        <th style="background-color: green">Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Debet</th>
        <th>Kredit</th>
        <th>Saldo</th>
    </tr>
    </thead>
    <tbody>
    @foreach($neraca as $neracas)
    <tr>   
        <th align=left>{{$neracas['keterangan_nomor']}}</th>
        <th>{{$neracas['nmr_perkiraan']}}</th>
        <th>{{$neracas['nmr_perkiraan']}}</th>
        @foreach($bulanString as $bulans)
        <th>@if($neracas[$bulans. ' Debet'] > 0)Rp. {{number_format($neracas[$bulans. ' Debet'])}}@endif</th>
        <th>@if($neracas[$bulans. ' Kredit'] > 0)Rp. {{number_format($neracas[$bulans. ' Kredit'])}}@endif</th>
        @endforeach
        <th>{{$neracas['saldoakhir']}}</th>
    </tr>
    @endforeach
    </tbody>
    
    
    
</table>
@endsection
