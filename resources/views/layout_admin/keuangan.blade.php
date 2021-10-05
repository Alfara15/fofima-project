
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootsrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <title>@yield('title')</title>
    <link rel="stylesheet" type="text/css" href="css/admin.css">
    <style>
      .abu-link:hover {
    background-color:gray;
}
      .how1:hover{
        background-color:gray;
      }
      a {text-decoration: none;
      }
    </style>
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light  bg-dark fixed-top ">
  <div class="container-fluid ">
    <a class="navbar-brand text-white" href="#"> SELAMAT DATANG ADMIN | <b>PEMBUKUAN FOFIMA</b></a>
    <form class="d-flex">
        <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">Search</button>
        
    </form>
    
    </div>
  </div>
</nav>
<section id="dashboard">
<div class="row no-gutters mt-5" >
    <div class="col-md-2 bg-dark mt-1 pr-3 pt-4" style="position:fixed; z-index:4; overflow-y: scroll; height:calc(100%-10vh); bottom:0px; top:3rem;">
<ul class="nav flex-column ml-3 mb-5" >
  <li class="nav-item">
      <i class="fas fa-tachometer-alt me-2 bg-white"></i>
      
      <a class="nav-link active text-light abu-link" aria-current="page" href="dashboard" ><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
      <i class="bi bi-speedometer2 mr-2"></i>  DASHBOARD</a><hr class="bg-secondary">
  </li>
  <li class="nav-item">
    <a class="nav-link text-light  abu-link" href="{{route('admin.edit')}}"><i class="bi bi-person-circle"></i>  ADMIN</a><hr class="bg-secondary">
  </li>
  </li>
  <li class="nav-item">
    <a class="nav-link text-light  abu-link" href="BukuBesar"><i class="bi bi-book mr-2"></i>  BUKU BESAR</a><hr class="bg-secondary">
  </li>
  <li class="nav-item">
    <a class="nav-link text-light  abu-link" href="neracaLajur"><i class="bi bi-file-earmark-bar-graph mr-2"></i>  NERACA LAJOR</a><hr class="bg-secondary">
  </li>
  <li class="nav-item">
    <a class="nav-link text-light  disable"><i class="bi bi-file-text mr-2"></i>  LAPORAN :</a><hr class="bg-secondary">
  </li>
  <li class="nav-item">
    <a class=" how1 nav-link   text-light  abu-link1  " href="#" style="margin-left:30px; font-size: 13px;"><i class="bi bi-graph-down mr-2"></i>  SURPLUS DEFISIT BULANAN</a><hr class="bg-secondary">
  </li>
  <li class="nav-item">
    <a class="how1 nav-link  text-light  abu-link1" href="#"style="margin-left:30px; font-size: 13px; "><i class="bi bi-journal-check mr-2"></i>  NERACA TAHUNAN </a><hr class="bg-secondary">
  </li>
  <li class="nav-item">
    <a class="nav-link text-light  abu-link" href="#"><i class="bi bi-box-arrow-left mr-2"></i>  LOGOUT</a>
  </li>
</ul>
</div>

<div class="col-md-10 p-6 pt-3" style="margin-left:17vw;">
<h3><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
      <i class="bi @yield('icon')"></i>{{'  '}}@yield('title')</h3><hr>
  @yield("konten")
</div>
</div>



    <script type="text/javascript" src="admin.js"></script>
  </body>
</html>