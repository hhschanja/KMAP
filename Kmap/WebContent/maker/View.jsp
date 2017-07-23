<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0de07eb294c4d6d6cb52be82eb7db31b&libraries=services"></script><!-- 지도 -->
<c:import url="../temp/bootStrap.jsp"/>
<title>${maker.name}</title>
<style type="text/css">

/* =============SECTION start============= */
section {
	width: 60%;
	margin: 0 auto;
}

#view_title{

width: 40%;
height: 80px;
margin-top: 100px;
font-size: 3.0em;
font-weight: bolder;
color: #404040;
margin-left: 5%;
}

#view_photo{
width: 80%;
height: 600px;
margin: 0 auto;
margin-top: 3%;
}

#view_photo img{
width: 100%;
height: 100%;
}

#view_list{
width: 100%;
height: 250px;
}

#view_list_1{
width: 70%;
height: 250px;
display: inline-block;
overflow: hidden;
}

#view_list_1 > p{
margin-left: 15%;
margin-top: 2%;
font-size: 1.2em;
font-weight: bolder;
}

#view_list_2{
width: 29%;
height: 300px;
display: inline-block;
overflow: hidden;
}

#button_1{
width: 210px;
height: 15%;
background-color: black;
margin-top: 7%;
margin-right:5%;
overflow: hidden;
}

#button_2{
width: 210px;
height: 15%;
background-color: black;
margin-top: 30%;
margin-right:5%;
overflow: hidden;

}

#button_write{
width: 85%;
height: 50%;
margin: 0 auto;
margin-top: 5%;
}

#button_write > a{
font-size: 1.3em;
color: white;
text-decoration: none;

}

#line{
width: 90%;
height: 2%;
margin-top: 5%;
}

#line > img{
width: 100%;
}

#contents{
width: 99%;
height: 100%;
margin: 0 auto;
margin-top: 10%;
}

#contents img{
width: 100%;
}


.container1{

width: 50%;
height: 50%;
margin: 0 auto;
margin-top: 5%;
}

#title{
width: 30%;
height: 60px;
margin-top: 3%;
margin-bottom: 3%;
font-size: 2.0em;
font-weight: bolder;
color: #404040;
margin-left: 5%;

}

#map{
margin-left: 10%;
}


.margine{
width: 80%;
height: 100%;
margin: 0 auto;

}

#button_admin_form{
width: 100%;
float: right;
margin-right: 10%;
}

#button_admin{
width: 85px;
height:50px;
font-weight: bolder;
color: black;
margin-right: 1%;
float: right;
}

#button_admin2{
width: 115px;
height:50px;
font-weight: bolder;
color: black;
margin-right: 1%;
float: right;
}

#button_admin3{
width: 100px;
height:50px;
font-weight: bolder;
color: black;
margin-right: 1%;
float: right;
}

#button_admin_form a{
text-decoration: none;
font-size: 1.0em;

}

#button_admin4{
width: 80px;
height:50px;
font-weight: bolder;
color: black;
margin-left: 50px;
float: left;
}

#product_comment{
	width: 350px;
	height: 30px;
	margin-left: 100px;
	font-size: 1.8em;
	margin: 0 auto;
}


/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<!--  =============SECTION start=============  -->

<section>

<div id="view_title">${maker.name}
	<input type="hidden" value="${maker.name}" id="mak">
</div>

<div id="view_photo">
	<a href="../upload/${files[0].fname}"><img alt="" src="../upload/${files[0].fname}"></a>
</div>

<div id="view_list">

	<div id="view_list_1">
		<p>주소: ${maker.address_main} ${maker.address_detail} / 우편번호 ${maker.address_num}</p>
		<input type="hidden" value="${maker.address_main}" id="address_main">
		<input type="hidden" value="${maker.address_detail}" id="address_detail">
		<p>연락처: ${maker.phone}</p>
		<p>CEO: ${maker.ceo}</p>
		<p>설립일: ${maker.establish}</p>
		<p>홈페이지: <a href="${maker.site}">${maker.site}</a></p> <!-- 링크 구현...어떻게하지? ㅠ -->
	</div>

	<div id="view_list_2">
		<div id="button_2">
			<div id="button_write">
<!-- 술 주소 입력 --><a href="../alchol/alcholList.alchol?search=${maker.num}&kind=maker_num">전통주 보러가기&emsp;&gt;</a>
			</div>
		</div>
		<div id="button_1">
			<div id="button_write">
<!-- 체험 주소 입력 --><a href="../ticket/ticketList.ticket?search=${maker.num}&kind=maker_num">체험 보러가기&emsp;&gt;</a>
			</div>
		</div>
	</div>
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

   <div id="contents">${maker.contents}</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="title">제품</div>

<c:choose>
<c:when test="${empty files2}">
	
	<div id="product_comment">
	판매중인 상품이 없습니다.
	</div>

</c:when>
<c:otherwise>

<div class="container1">
  <div id="myCarousel" class="carousel slide"  data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <c:forEach items="${alchol }" varStatus="i" begin="1">
      <li data-target="#myCarousel" data-slide-to="${i.index }"></li>
      
      </c:forEach>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
	
      <div class="item active">
        <img src="../upload/${files2[0]}" alt="${files2[0]}" style="width:100%;">
        
        <div class="carousel-caption">
          <h3>${alchol[0].name }</h3>
        </div>
      </div>
    
    <c:forEach items="${alchol }" varStatus="i" begin="1">
    
      <div class="item ">
        <img src="../upload/${files2[i.index]}" alt="${files2[i.index]}" style="width:100%;">
        <div class="carousel-caption">
          <h3>${alchol[i.index].name }</h3>
        </div>
      </div>
    
    </c:forEach>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</c:otherwise>
</c:choose>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="title">찾아가는 길</div>

<div id="map" style="width:70%;height:500px;"></div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="button_admin4">
	<a href="./makerList.maker" class="form-control" id="btn">목록으로</a>
</div>

<c:if test="${not empty admin}">

<div id="button_admin_form">

<div id="button_admin3">
		<a href="../alchol/alcholInsert.jsp?maker_num=${maker.num}" class="form-control" id="btn">술 등록하기</a>
</div>
<div id="button_admin2">
	<a href="../ticket/ticketInsert.jsp?maker_num=${maker.num}" class="form-control" id="btn">체험 등록하기</a>
</div>

<div id="button_admin">
		<a href="./makerUpdateForm.maker?num=${maker.num}" class="form-control" id="btn">수정하기</a>
</div>
<div id="button_admin">
<form action="./makerDelete.maker" id="frm_del">
	<input type="hidden" name="num" value="${maker.num}">
	<input type="button" class="form-control" id="btn_del" value="삭제하기">
</form>
</div>

</div>

</c:if>




</section>
<!--  =============SECTION finish=============  -->
<c:import url="../temp/footer.jsp"/>
</body>

<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var address_main = $("#address_main").val();
var maker = $("#mak").val();

//주소로 좌표를 검색합니다
geocoder.addr2coord(address_main, function(status, result) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
    	content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="http://map.daum.net/link/search/'+maker+'">'+maker+'</a></div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    


$('#btn_del').click(function() {
	var result = confirm("정말로 삭제하시겠습니까?");

	if(result){
		$('#frm_del').submit();
	}else{
		
	}
});


</script>

</html>
