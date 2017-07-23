<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${pairing.title}</title>
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
        		alert("제목명을 입력하세요");
        	}
        	else if(confirm[1].value==""){
        		alert("사진을 등록하세요");
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
width: 90px;
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
<form id="frm" action="./pairingUpdate.pairing" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${pairing.num}">
<table>
<tr><td id="table_title">제목</td></tr>
<tr><td id="table_input"><input style="width: 50%;" type="text" name="title" class="confirm" value="${pairing.title}"></td></tr>
<tr><td id="table_title">사진</td></tr>
<tr><td id="table_input"><input type="file" name="file" class="confirm" ></td></tr>
</table>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="contents_title">
상세내용
</div>

<div id="contents_form">
	<textarea  rows="40" cols="30" name="contents" id="contents">${pairing.contents }</textarea>	
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="button">
<input type="button" class="form-control" id="btn" value="수정하기">
</div>
</form>

</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>