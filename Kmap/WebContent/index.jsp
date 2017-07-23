<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <title>대동여酒도</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <c:import url="./temp/bootStrap.jsp"/>
  <script type="text/javascript">
  	$(function() {
  		$.ajax({
  			url : "freeboardBestRecommend.freeboard",
  			type : "GET",
  			success : function(data) {
  				$("#Community").html(data);
			}
  		})
  		$.ajax({
  			url : "pairingIndex.pairing",
  			type : "GET",
  			success : function(data) {
  				$("#pairing").html(data);
			}
  		})
	})
  </script> 	
  <style>
body {
	background-image: url("./images/common/reply.jpg");
	background-repeat: repeat;
}
/* ================================section start ===========-================= */
section {
	width : 80%;
	height: 900px;
	margin: 0 auto;
}
.panel-heading {
	text-align: left;
	font-size: 1.2em;
}
#hot-deal {
	width: 33%;
	height: 100%;
	margin-left: 10px;
	float: left;
	font-size: 1.5em;
	font-weight: bolder;
}
.row {
	width: 100%;
	height: 400px;
	position: relative;
}
.row img {
	width: 360px;
	height: 400px;
	display: inline;
}
.carousel {
	width: 100%;
}
.box1 {
	background-image: url("./images/common/전통술.jpg");
	background-repeat: no-repeat;
	height: 400px;
}
.box2 {
	background-image: url("./images/common/양조장2.jpg");
	height: 400px;
}
.box3 {
	background-image: url("./images/common/주막.jpg");
	height: 400px;
}
.box4 {
	background-image: url("./images/common/Festival.jpg");	
	overflow: hidden;
	margin-left : 3%;
	width : 30%;
	height: 300px;
}
.box4  a {
	color: #FFF;
}
.body a {
	color: black;
	text-decoration: none;
}
.body {
	max-width: 1500px;
	width: 100%;
	display: inline-block;
	box-shadow: 3px 9px 20px 0px rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	text-align: center;
	margin: 0 auto;
	overflow: hidden;
}
.carousel-inner {
	height: 132px;
}
.carousel-control {
	right: auto;
}
.box-title {
	font-size: 4.2em;
	font-family: 'Titillium Web', 'Open Sans', sans-serif;
	font-weight: 600;
	top: 38% !important;
	text-transform: uppercase;
	position: relative;
	z-index: 555;
}
.box-title2 {
	font-size: 4.2em;
	font-family: 'Titillium Web', 'Open Sans', sans-serif;
	font-weight: 600;
	top: 38% !important;
	text-transform: uppercase;
	position: relative;
	z-index: 555;
}
.box-title2 > a {
	color: #FFF;
}
.Best {
	width: 33%;
	float: left;
	font-size: 1.5em;
	font-weight: bolder;
}
.Best p {
	text-align : right;
}
.Best a {

	font-size: small;
}
.freeboard {
	width: 100%;
	height: 50%;
	text-align: left;
	line-height: 2;
}
.freeboard img {
	width: 15px;
	height: 15px;
}
.tkind {
	width: 100%;
}
#Community {
	border-top: 3px solid black;
	font-size : small;
	font-weight: normal;
}

.Festival {
	width: 33%;
	height: 100%;
	float: left;
	z-index: 111;
}
.main {
	margin-top: 50px;
}
/*===========section finish============================================================  */

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
<c:import url="./temp/header.jsp"/>
<section>
<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="">
        <div class="body box1"><div class="box-title"><a href="./alchol/alcholList.alchol">전통주</a></div></div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="">
        
        <div class="body box2"><div class="box-title"><a href="./maker/makerList.maker">양조장</a></div></div>
        
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="">
        <div class="body box3"><div class="box-title"><a href="./pairing/pairingList.pairing">커뮤니티</a></div></div>
      </div>
    </div>
  </div>
</div><br>

<div class="container main">
<div class="row">
    <div class="Best"> 
        <div class="panel-heading">Community - 자유게시판</div>
        <p><a href="./freeboard/freeboardList.freeboard">+더보기</a></p>
        <div class="" id="Community"></div>
    </div>
    
    
    
    <div id="pairing"></div>
    
    
	<div class="Festival"> 
        <div class="body box4"><div class="box-title2"><a href="./festival/festivalList.festival">FESTIVAL</a></div></div>
    </div>
</div>    
  </div>
</section>
<c:import url="./temp/footer.jsp"/>
</body>
</html>