<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${festival.name }</title>
<c:import url="../temp/bootStrap.jsp"/>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0de07eb294c4d6d6cb52be82eb7db31b&libraries=services"></script><!-- 지도 -->

<style type="text/css">

/* =============SECTION start============= */
section {
	width: 60%;
	margin: 0 auto;
}

#view{
width: 1100px;
height: 300px;
margin-top: 5%;
}

#view_photo{
width: 40%;
height: 100%;
margin: 0 auto;
margin-top: 3%;
float: left;
overflow: hidden;
}

#view_photo img{
width: 100%;
height: 100%;
}

#view_list{
width: 60%;
height: 100%;
float: left;
margin-top: 5%;
}

#view_list_1{
width: 85%;
height: 250px;
margin-left: 10%;
display: inline-block;
overflow: hidden;
}

#view_list_1 > p{
font-weight: bolder;
}

#p1{
font-size: 2.5em;

}

#p3{
font-size: 1.8em;
font-family: fantasy;
}


#p2{
margin-top:7%;
font-size: 1.3em;
}

#p4{
font-size: 1.1em;
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
margin-top: 5%;
}

#contents img{
width: 100%;
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
width: 200px;
height: 50px;
float: right;
margin-top: 2%;
margin-right: 10%;
}

#button_admin{
width: 85px;
height:50px;
font-weight: bolder;
color: black;
margin-right: 1%;
display: inline-block;
}


#button_admin a{
text-decoration: none;
}
#result{
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
#result > p {
	display: inline;
	margin-bottom: 0;
}
#result > span {
	cursor : pointer;
	float: right;
	text-align: right;
}
#reply_contents{
	height: 20px;
	text-align: left;
}

#reply{
	float: right;
}
#reply_writer{
	float: left;
}
.form-control{
	display: inline;
}
#del {
	cursor: pointer;
}
/* =============SECTION finish============= */

</style>
</head>
<body>

<c:import url="../temp/header.jsp"/>

<!--  =============SECTION start=============  -->

<section>

<div id="view">

<c:if test="${not empty upload.fname}">	
<div id="view_photo">
	<img alt="" src="../upload/${upload.fname}">
</div>
</c:if>

<div id="view_list">

	<div id="view_list_1">
		<p id="p1">${festival.name}</p><input type="hidden" value="${festival.name}" id="festival">
		<p id="p3">${festival.start_date} ~ ${festival.last_date}</p>
		<p id="p2">${festival.address}</p><input type="hidden" value="${festival.address}" id="address">
		<p id="p4">개최자: ${festival.host} / 연락처: ${festival.phone}</p>
	<c:if test="${festival.price!=0}">
		<p id="">입장료: <fmt:formatNumber value="${festival.price}" type="currency" currencySymbol=""/>원</p>
	</c:if>
	</div>

</div>

</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

   <div id="contents">${festival.contents}</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="title">찾아가는 길</div>

<div id="map" style="width:70%;height:500px;"></div>

<div id="line"><img alt="" src="../images/common/line.png"></div>
	<h2>축제  후기</h2>

	<c:choose>
		<c:when test="${empty member and empty admin}">
			댓글을 남기고 싶다면 로그인을 먼저하세요
			<hr>		
		</c:when>
		<c:when test="${not empty member}">
			<input type="hidden" name="type" value="festival" class="type"> 
			<input type="hidden" name="type_num" value="${festival.num}" class="type_num">	
			<input type="text" name="writer" value="${member.id}" readonly="readonly" class="writer form-control" style="width: 9%;">
			<input type="text" name="contents" class="contents form-control" style="width:50%;">		
			<input type="submit" value="댓글달기" id="reply" class="form-control" style="width : 120px; text-align: center;">
			<hr>
		</c:when>
		<c:when test="${not empty admin}">
			<input type="hidden" name="type" value="festival" class="type"> 
			<input type="hidden" name="type_num" value="${festival.num}" class="type_num">	
			<input type="text" name="writer" value="${admin.id}" readonly="readonly" class="writer form-control" style="width: 9%;">
			<input type="text" name="contents" class="contents form-control" style="width:50%;">		
			<input type="submit" value="댓글달기" id="reply" class="form-control" style="width : 120px; text-align: center;">
			<hr>
		</c:when>
	</c:choose>

	
	<div id="result">
	<c:forEach items="${reply}" var="R">	
	<p id="reply_writer">작성자 | ${R.writer} / ${R.reg_date}</p>
	
	<c:if test="${member.id eq R.writer}">
	<span class="mod" id="${R.num}">수정</span>
	<span>&emsp;</span>
	<span class="del" id="${R.num}">삭제</span><br>
	</c:if>
	
	<c:if test="${admin.id eq R.writer}">
	<span class="mod" id="${R.num}">수정</span>
	<span>&emsp;</span>
	<span class="del" id="${R.num}">삭제</span><br>
	</c:if>	
		
	<br>
	<div id="reply_contents">${R.contents} </div>
	<br>
	
	</c:forEach>
	</div>

<c:if test="${not empty admin}">

<div id="button_admin_form">

<div id="button_admin">
		<a href="festivalUpdateForm.festival?num=${festival.num }" class="form-control" id="btn">수정하기</a>
</div>
<div id="button_admin">
<form action="festivalDelete.festival" id="frm_del">
	<input type="hidden" name="num" value="${festival.num }">
	<input type="hidden" name="fname" value="${upload.fname}">
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
var address = $("#address").val();
var festival = $('#festival').val();

//주소로 좌표를 검색합니다
geocoder.addr2coord(address, function(status, result) {

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
    	content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="http://map.daum.net/link/search/'+festival+'">'+festival+'</a></div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    

</script>
<script type="text/javascript">
		$("#reply").click(function() {
			var type = $(".type").val();
			var type_num = $(".type_num").val();
			var writer = $(".writer").val();
			var contents = $(".contents").val();
			
			$.ajax({
				url : "replyWrite.reply",
				type : "GET",
				data :{
					type : type,
					type_num : type_num,
					writer : writer,
					contents : contents
				},
				success : function(data) {
					$(".contents").val("");
					$("#result").html(data);
				}
			});
		});
		
		$("#result").on("click",".del", function() {
			
			var id = $(this).attr('id');
			var type_num = $(".type_num").val();
			var type = $(".type").val();
			var result = confirm("댓글을 지우시겠습니까?");
			if(result){				
			$.ajax({
				url : "replyDelete.reply",
				type : "GET",
				data : {
					id : id,
					type_num : type_num,
					type : type
					},
				success : function(data) {
					$("#result").html(data);
				}
					
			});
			}
			
		});
		$("#result").on("click",".mod", function() {
			var id = $(this).attr('id');

			$.ajax({
				url : "replyUpdateForm.reply",
				type : "GET",
				data : {id : id},
				success : function(data) {
					$("#result").html(data);
				}
			});		
			
		});
		
		$("#result").on("click","#update", function() {
			var updateNum = $("#updateNum").val();
			var updateContents = $("#updateContents").val();
			var type_num = $(".type_num").val();
			var type = $(".type").val();
			$.ajax({
				url : "replyUpdate.reply",
				type : "GET",
				data : {
					updateNum : updateNum,
					updateContents : updateContents,
					type_num : type_num,
					type : type
					},
				success : function(data) {
					$("#result").html(data);
				}
			});
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

	