<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>대동여酒도</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

	/*============hearder start =================================================  */
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
   
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      background-image : url("./images/common/reply.jpg");
      background-repeat : repeat;
      margin-bottom: 0;
    }
   /* ================================section start ===========-================= */
   section {
   	height: 900px;
   }
   .panel-body > img {
   	overflow: auto;
   }
   .panel-heading{
   	text-align: center;
   }
   #hot-deal{
   	width : 66%;
   	height: 100%;
   	overflow: hidden;
   }
   .row_sub {
   	height: 400px;
   }
   /*===========section finish============================================================  */
    /* Add a gray background color and some padding to the footer */
    footer { 	
      background-image : url("./images/common/bg.png");
      background-repeat : repeat;
      padding: 25px;
    }
    /*==================슬라이드=============  */
    
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  </style>
</head>
<body>
<div class="jumbotron">
  <div class="container text-center">
    <img alt="" src="./images/common/logo.JPG">      
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">기업소개</a></li>
        <li><a href="#">전통주</a></li>
        <li><a href="#">양조장</a></li>
        <li><a href="#">커뮤니티</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#">connect with korea-sool</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> LOG IN</a></li>
        <li><a href="#">JOIN</a></li>
      </ul>
    </div>
  </div>
</nav>

<section>
<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="">
        <div class="panel-heading">전통주</div>
        <div class="panel-body"><a href="#"><img src="./images/common/하늘.jpg" class="img-responsive"  alt="Image"></a></div>
        
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="">
        <div class="panel-heading">양조장</div>
        <div class="panel-body"><a href="#"><img src="./images/common/logo.JPG" class="img-responsive"  alt="Image"></a></div>
        
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="">
        <div class="panel-heading">커뮤니티</div>
        <div class="panel-body"><a href="#"><img src="./images/common/하늘2.jpg" class="img-responsive"  alt="Image"></a></div>
        
      </div>
    </div>
  </div>
</div><br>

<div class="container row_sub">    
  <div class="row row_sub">
    <div class="col-sm-4" id="hot-deal">
    	<div class="panel-heading">전통주 Best</div>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="./images/common/지붕.jpg" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>지붕</h3>
        </div>      
      </div>

      <div class="item">
        <img src="./images/common/하늘.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>하늘</h3>
        </div>      
      </div>
    
      <div class="item">
        <img src="./images/common/하늘2.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>하늘2</h3>
        </div>      
      </div>
    </div>

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
    </div>
    
    <div class="col-sm-4"> 
      <div class="">
        <div class="panel-heading">좋아요 Best</div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive"  alt="Image"></div>
        
      </div>
    </div>
  </div>
</div><br><br>
</section>

<footer class="container-fluid text-center">
  <p>Korea-Sool Copyright</p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer>

</body>
</html>