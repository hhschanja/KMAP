<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>양조장 등록</title>
<c:import url="../temp/bootStrap.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js" charset="utf-8"></script><!-- 네이버 에디터 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 우편번호검색 -->
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
        		alert("상호명을 입력하세요");
        	}
        	else if(confirm[1].value==""){
        		alert("사진을 등록하세요");
        	}
        	else if(confirm[2].value==""){
        		alert("주소를 입력하세요");
        	}
        	else if(confirm[3].value==""){
        		alert("연락처를 입력하세요");
        	}
        	else if(confirm[4].value==""){
        		alert("대표자를 입력하세요");
        	}
        	else if(confirm[5].value==""){
        		alert("설립일을 입력하세요");
        	}
        	else if(confirm[6].value==""){
        		alert("홈페이지를 입력하세요");
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
	height : 100%;
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
margin: 0 auto;
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
width: 70px;
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
<section>
<form id="frm" action="./makerInsert.maker" method="post" enctype="multipart/form-data">
<table>
<tr><td id="table_title">상호명</td></tr>
<tr><td id="table_input"><input style="width: 50%;" type="text" name="name" class="confirm"></td></tr>
<tr><td id="table_title">사진</td></tr>
<tr><td id="table_input"><input type="file" name="file" class="confirm"></td></tr>
<tr><td id="table_title">주소</td></tr>
<tr>
<td id="table_input">
		<p>
		<input type="text" id="sample6_postcode" placeholder="우편번호" name="address_num" readonly="readonly">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="address_main" readonly="readonly" class="confirm">
		<input type="text" id="sample6_address2" placeholder="상세주소" name="address_detail">
		</p>
</td>
</tr>
<tr><td id="table_title">연락처</td></tr>
<tr><td id="table_input"><input type="text" name="phone" class="confirm" placeholder="'-' 포함"></td></tr>
<tr><td id="table_title">대표</td></tr>
<tr><td id="table_input"><input type="text" name="ceo" class="confirm"></td></tr>
<tr><td id="table_title">설립일</td></tr>
<tr><td id="table_input"><input type="date" name="establish" class="confirm"></td></tr>
<tr><td id="table_title">홈페이지</td></tr>
<tr><td id="table_input"><input type="text" name="site" class="confirm"></td></tr>


</table>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="contents_title">
상세내용
</div>

<div id="contents_form">
	<textarea  rows="40" cols="30" name="contents" id="contents"></textarea>	
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="button">
<input type="button" class="form-control" id="btn" value="올리기">
</div>
</form>

</section>
<c:import url="../temp/footer.jsp"/>
</body>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>
</html>