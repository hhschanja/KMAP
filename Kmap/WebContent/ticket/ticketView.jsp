<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ticket.name }</title>
<style type="text/css">
/*센션 스타트  */
section {
	width: 60%;
	margin: 0 auto;
	margin-top: 50px;
	overflow: hidden;
}

.section_top {
	width: 100%;
	height: 300px;
}

.section_top_1 {
	width: 30%;
	height: 100%;
	display: inline-block;
	overflow: hidden;;
	margin-left: 15%;
	float: left;
}

.section_top_1 img {
	width: 76%;
	height: 90%;
	margin-top: 5%;
	margin-left: 5.5%;
}

.section_top_2 {
	width: 50%;
	height: 100%;
	float: left;
	display: inline-block;

	
}


table {
	margin-top: 3%;
	font-size: 20px;
	width: 100%;
	height: 100%;
	

}
.title{
		font-weight: bolder;
		text-indent: 50px;
		
}

.first_td {
	font-weight: bold;
	width: 16%;
}

/*======================================  */
.section_middle {
	margin-top: 30px;
	margin-left: 5%;
	width: 90%;
	font-size: 20px;
}

#line {
	width: 90%;
	height: 2%;
	margin-top: 10%;
}

#line>img {
	width: 100%;
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
</style>
</head>
<body>

<c:import url="../temp/header.jsp"/>
	<section>
		<div class="section_top">
			<div class="section_top_1">

				<c:if test="${not empty upload.fname}">
					<a href="../upload/${upload.fname}"> <img alt="" src="../upload/${upload.fname}"></a>
				</c:if>
				

			</div>
			<div class="section_top_2">
				
				<table>
				<tr>
						<td colspan="2" class="title">${ticket.name }</td>
						
					</tr>
					<tr>
						<td class="first_td">양조장:</td>
						<td>&ensp;${maker.name }</td>
					</tr>
					<tr>
						<td class="first_td">가&nbsp;&ensp;&nbsp;격:</td>
						<td>&ensp;<fmt:formatNumber value="${ticket.price }" type="currency" currencySymbol=""/>원</td>
					</tr>
					<tr>
						<td class="first_td">갯&nbsp;&ensp;&nbsp;수:</td>
						<td>&ensp;${ticket.count }개</td>
					</tr>
					<tr>
						<td class="first_td">체험기간:</td>
						<td>&ensp;${ticket.start_month }월 ~ ${ticket.last_month }월</td>
					</tr>
					<tr>
						<td class="first_td">소요시간:</td>
						<td>&ensp;${ticket.required_time }시간</td>
					</tr>
					
					


				</table>
				<c:if test="${member !=null }">
		<form action="../basket/basketInsert.basket" method="post" id="basket">
				장바구니 담기: <input type="number"  min="1" max="${ticket.count }" style="display: inline-block;"name="count" id="basketCount"> 
				<input type="hidden" name="name"value="${ticket.name }"> 
				<input type="hidden"name="type_num" value="${ticket.tnum }"> 
				<input type="hidden" name="price" value="${ticket.price }">
				<input type="hidden" name="type"value="ticket">
				<input type="button" class="form-control" style="width :60px; margin-top: 5px; display: inline-block;" value="담기" id="basketBtn">
			</form>

			<form action="../purchase/purchaseFormOne.jsp"method="post" style="margin-top: 1px;" id="purchase">
				구매 갯수: <input type="number" min="1" max="${ticket.count }" name="count" style="display: inline-block;" id="purchaseCount"> 
				<input type="hidden" name="name"value="${ticket.name }"> 
				<input type="hidden" name="type_num"value="${ticket.tnum }"> 
				<input type="hidden" name="type"value="ticket">
				<input type="hidden" name="fname" value="${upload.fname}">
				<input type="hidden" name="price" value="${ticket.price }">
				<input type="button"style="width :80px;margin-top: 5px; display: inline-block;"  class="form-control" value="구매하기" id="purchaseBtn">
			</form>
			</c:if>
			</div>

			</div>
		
		<div id="line">
			<img alt="" src="../images/common/line.png">
		</div>
		
		<div class="section_middle">${ticket.contents }
		<br>
		</div>

		<div id="line" style="margin-top: 5px">
			<img alt="" src="../images/common/line.png">
		</div>

		<div class="section_bottom">
			<br><br><br>
			
			
<br><br><br>
					</div>
			<div id="line" style="margin-top: 5px">
			<img alt="" src="../images/common/line.png">
			<h2>양조장 체험 후기</h2>
		</div>
	<c:choose>
		<c:when test="${empty member and empty admin}">
			댓글을 남기고 싶다면 로그인을 먼저하세요
			<hr>		
		</c:when>
		<c:when test="${not empty member}">
			<input type="hidden" name="type" value="ticket" class="type"> 
			<input type="hidden" name="type_num" value="${ticket.tnum}" class="type_num">	
			<input type="text" name="writer" value="${member.id}" readonly="readonly" class="writer form-control" style="width: 9%;">
			<input type="text" name="contents" class="contents form-control" style="width:50%;">		
			<input type="submit" value="댓글달기" id="reply" class="form-control" style="width : 120px; text-align: center;">
			<hr>
		</c:when>
		<c:when test="${not empty admin}">
			<input type="hidden" name="type" value="ticket" class="type"> 
			<input type="hidden" name="type_num" value="${ticket.tnum}" class="type_num">	
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
	
	<div id="map" style="width:90%;height:350px;"></div>
		<a href="./ticketList.ticket" style="float: left; margin-right: 11%; "><input type="button"style="width :130px;margin-top: 5px; display: inline-block;"  class="form-control" value="체험리스트"></a>
	<c:if test="${admin != null }">
			
			<form action="ticketDelete.ticket" method="post" id="frm">
			<input type="hidden" name="tnum" value="${ticket.tnum }">
			<input type="hidden" name="fname" value="${upload.fname }">
			<input type="button"style="width :130px;margin-top: 5px; display: inline-block; float: right"  class="form-control" value="삭제" id="delete">
			<a href="ticketUpdateForm.ticket?tnum=${ticket.tnum }" style="float: right;"><input type="button"style="width :130px;margin-top: 5px; display: inline-block;"  class="form-control" value="수정"></a>
			</form>
			
			</c:if> 
	<input type="hidden" id="address_main" value="${maker.address_main }"> 
	<input type="hidden" id="maker" value="${maker.name }">
	</section>
	<br>
	<br>
	<br>
	
	<br>
	<br>
	<c:import url="../temp/footer.jsp"/>
	


<script>
$("#basketBtn").click(function(){
	var count = $("#basketCount").val() * 1
	var max = $("#basketCount").attr("max") * 1
	if(max>=count &&count > 0){
		$("#basket").submit();
		
	}else{
		alert("담을 수 있는 수량을 벗어났습니다.");
	}
});
$("#purchaseBtn").click(function(){
	var count = $("#purchaseCount").val() * 1
	var max = $("#purchaseCount").attr("max") * 1
	if(max>=count &&count > 0){
		$("#purchase").submit();
		
	}else{
		alert("구매할 수 있는 수량을 벗어났습니다.");
	}
});
$("#delete").click(function(){
	var result = confirm("삭제하시겠습니까?");
	if(result){
		$("#frm").submit();
		
	}
});
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var address_main = $("#address_main").val();
var maker = $('#maker').val();
// 주소로 좌표를 검색합니다
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
		
	</script>

</body>
</html>