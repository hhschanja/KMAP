<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js" charset="utf-8"></script><!-- 네이버 에디터 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 주소검색 -->
<script src="//apis.daum.net/maps/maps3.js?apikey=0de07eb294c4d6d6cb52be82eb7db31b&libraries=services"></script><script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 주소검색 -->
<title>축제 등록</title>
<script type="text/javascript">

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "contents",
        sSkinURI: "/Kmap/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#btn").click(function(){ 
        // 이부분에 에디터 validation 검증
         
     	
        var confirm = document.getElementsByClassName("confirm");

        	if(confirm[0].value==""){
        		alert("축제명을 입력하세요");
        	}
        	else if(confirm[1].value==""){
        		alert("사진을 등록하세요");
        	}
        	else if(confirm[2].value==""){
        		alert("개최자를 입력하세요");
        	}
        	else if(confirm[3].value==""){
        		alert("연락처를 입력하세요");
        	}
        	else if(confirm[4].value==""){
        		alert("시작일을 입력하세요");
        	}
        	else if(confirm[5].value==""){
        		alert("종료일을 입력하세요");
        	}
        	else if(confirm[6].value==""){
        		alert("가격을 입력하세요");
        	}
        	else if(confirm[7].value==""){
        		alert("개최장소를 입력하세요");
        	}
        	else{
        		//id가 smarteditor인 textarea에 에디터에서 대입
                editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
        		$('#frm').submit();
        	}
        
        })
})
</script>
<style type="text/css">


/* =============SECTION start============= */
section {
	width: 60%;
	margin: 0 auto;
}
textarea{
	width: 80%;
	
}

table {
width: 90%;
margin-top: 5%;
margin-left: 5%;
}

#table_title{
width: 20%;
font-size: 2.5em;
font-weight: bolder;
color: #404040;
padding-top: 30px;

}

#table_input{
width: 80%;
font-size: 1.5em;
font-weight: bolder;
color: #404040;

}

#map{
width: 500px;
height: 300px;
margin-left: 5%;

}

#line{
width: 90%;
height: 2%;
margin-top: 10%;
}

#line > img{
width: 100%;
}

#contents_form{
width: 85%;
overflow: hidden;
margin-top: 5%;
margin-left: 5%;
}

#contents_title{
font-size: 2.5em;
font-weight: bolder;
color: #404040;
margin-top: 5%;
margin-left: 5%;
}

#button{
width: 80px;
font-weight: bolder;
color: black;
float: right;
margin-top: 2%;
margin-right: 20%;
}


/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<!--  =============SECTION start=============  -->

<section>

<form id="frm" action="./festivalInsert.festival" method="post"  enctype="multipart/form-data">

<table>
<tr><td id="table_title">축제명</td></tr>
<tr><td id="table_input"><input style="width: 50%;" type="text" name="name" class="confirm"></td></tr>
<tr><td id="table_title">사진</td></tr>
<tr><td id="table_input"><input type="file" name="file" class="confirm" value="프로필사진"></td></tr>
<tr><td id="table_title">개최자</td></tr>
<tr><td id="table_input"><input type="text" name="host" class="confirm"></td></tr>
<tr><td id="table_title">연락처</td></tr>
<tr><td id="table_input"><input type="text" name="phone" class="confirm" placeholder="'-'를 포함시켜주세요"></td></tr>
<tr><td id="table_title">시작일</td></tr>
<tr><td id="table_input"><input type="date" name="start_date" class="confirm"></td></tr>
<tr><td id="table_title">종료일</td></tr>
<tr><td id="table_input"><input type="date" name="last_date" class="confirm"></td></tr>
<tr><td id="table_title">가격</td></tr>
<tr><td id="table_input"><input type="number" name="price" placeholder="입장료가 없다면 0을 입력" class="confirm" min="0"></td></tr>
<tr><td id="table_title">주소</td></tr>
<tr>
<td id="table_input">
		<input type="text" id="sample5_address" placeholder="주소" name="address" class="confirm" readonly="readonly">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
</td>
</tr>

</table>

<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="contents_title">
상세내용
</div>

<div id="contents_form">
	<textarea  rows="40" cols="30" name="contents" id="contents"></textarea>	
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="button">
<input type="button" class="form-control" id="btn" value="등록하기">
</div>
</form>

</section>

<!--  =============SECTION finish=============  -->

<c:import url="../temp/footer.jsp"/>
</body>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>