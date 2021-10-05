@extends('layout_admin.keuangan')
@section('title', 'Admin Setting')
@section('icon', 'bi-person-circle')
@section('konten')
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">No</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
            <th scope="col">Aksi</th>
        </tr>
    </thead>
    <tbody>
        @php $no = 1 @endphp
        @foreach($data as $datas)
        <form action="{{Route('update',$datas->id,'edit')}}" method="POST" onsubmit="return confirm('Apakah anda yakin?')">
            @csrf
            @method('patch')
            <tr>
                <td>{{$no}}</td>
                <td>{{$datas->name}}</td>
                <td>{{$datas->email}}</td>
                <td>
                    <select name="role" id="" @if($datas->id == Auth::user()->id) disabled @endif class='form-control'>
                        <option value='1' @if($datas->role_id == 1) selected @endif>Yayasan</option>
                        <option value='2' @if($datas->role_id == 2) selected @endif>SMK</option>
                        <option value='3' @if($datas->role_id == 3) selected @endif>Asrama</option>
                    </select>
                </td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button  class="btn btn-warning" name='aksi' value="edit" @if($datas->id == Auth::user()->id) disabled @endif>Edit</button>
                    </div>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button class="btn btn-danger" style="margin-left:15px;" name='aksi' value='hapus' @if($datas->id == Auth::user()->id) disabled @endif>Hapus</button>
                    </div>
                </td>
            </tr>
        </form>
        @php $no++ @endphp
        @endforeach
    </tbody>
</table>
@endsection