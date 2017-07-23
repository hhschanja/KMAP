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
<title>${festival.name}</title>
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

#line{
width: 90%;
height: 2%;
margin-top: 10%;
}

#line > img{
width: 100%;
}

#contents_form{
width: 90%;
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

#map{
width: 500px;
height: 300px;
margin-left: 5%;

}


#button{
width: 80px;
font-weight: bolder;
color: black;
float: right;
margin-top: 2%;
margin-right: 20%;
text-decoration: none;
}



/* =============SECTION finish============= */
</style>
</head>
<body>

<c:import url="../temp/header.jsp"/>

<!--  =============SECTION start=============  -->

<section>

<form id="frm" action="./festivalUpdate.festival" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${festival.num}">

<table>
<tr><td id="table_title">축제명</td></tr>
<tr><td id="table_input"><input style="width: 50%;" type="text" name="name" class="confirm" value="${festival.name}"></td></tr>
<tr><td id="table_title">사진</td></tr>
<tr><td id="table_input">
<c:if test="${not empty upload.fname}">
<input type="hidden" name="fname" value="${upload.fname }">
<input type="hidden" name="oname" value="${upload.oname }">
<img style="width: 200px; height: 200px;" alt="" src="../upload/${upload.fname}">
</c:if>
<input type="file" name="file" class="confirm" value="프로필사진"></td></tr>
<tr><td id="table_title">개최자</td></tr>
<tr><td id="table_input"><input type="text" name="host" class="confirm" value="${festival.host}"></td></tr>
<tr><td id="table_title">연락처</td></tr>
<tr><td id="table_input"><input type="text" name="phone" class="confirm" value="${festival.phone}" placeholder="'-'를 포함시켜주세요"></td></tr>
<tr><td id="table_title">시작일</td></tr>
<tr><td id="table_input"><input type="date" name="start_date" class="confirm" value="${festival.start_date}"></td></tr>
<tr><td id="table_title">종료일</td></tr>
<tr><td id="table_input"><input type="date" name="last_date" class="confirm" value="${festival.last_date}"></td></tr>
<tr><td id="table_title">가격</td></tr>
<tr><td id="table_input"><input type="number" name="price" placeholder="입장료가 없다면 0을 입력" class="confirm" value="${festival.price}" min="0"></td></tr>
<tr><td id="table_title">주소</td></tr>
<tr>
<td id="table_input">
		<input type="text" id="sample5_address" placeholder="주소" name="address" class="confirm" readonly="readonly" value="${festival.address}">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
</td>
</tr>

</table>

<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="contents_title">
상세설명
</div>

<div id="contents_form">
	<textarea  rows="40" cols="30" name="contents" id="contents">${festival.contents}</textarea>	
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="button">
<input type="button" class="form-control" id="btn" value="수정완료">
</div>

<!-- 수정할때 사진을 등록 안했다면 예전사진이 그대로 다시 넘어가는거 -->
	<c:if test="${not empty upload.fname}">
	<input type="hidden" name="fname" value="${upload.fname }">
	<input type="hidden" name="oname" value="${upload.oname }">
	</c:if>

</form>
</section>

<!--  =============SECTION finish=============  -->
<c:import url="../temp/footer.jsp"/>
</body>
</html>