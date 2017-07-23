<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${alchol.name }</title>
<c:import url="../temp/bootStrap.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js" charset="utf-8"></script><!-- 네이버 에디터 -->
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
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
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
	width: 99.3%;
	
}

table {
width: 95%;
margin-left: 5%;
margin-top: 10%;
}

#table_title{
width: 20%;
font-size: 2.5em;
font-weight: bolder;
color: #404040;
padding-top: 20px;

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
width: 80%;
margin: 0 auto;
margin-top: 15px;
margin-left: 5%;
overflow: hidden;

}
/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
<form id="frm" action="./alcholUpdate.alchol" method="post" enctype="multipart/form-data">
<input type="hidden" name="anum" value="${alchol.anum }">
<table>
<tr><td id="table_title">제품명</td></tr>
<tr><td id="table_input"><input style="width: 30%;" type="text" name="name" value="${alchol.name }"></td></tr>
<tr><td id="table_title">사진</td></tr>
<tr><td id="table_input">
<c:if test="${not empty upload.fname}">
<input type="hidden" name="fname" value="${upload.fname }">
<input type="hidden" name="oname" value="${upload.oname }">
<img style="width: 200px; height: 200px;" alt="" src="../upload/${upload.fname}">
</c:if><input type="file" name="file"></td></tr>
<tr><td id="table_title">종류</td></tr>
<tr><td id="table_input"><select name="kind">
			<option value="막걸리">막걸리</option>
			<option value="리큐르">리큐르</option>
			<option value="약주">약&nbsp;&ensp;&nbsp;주</option>
			<option value="청주">청&nbsp;&ensp;&nbsp;주</option>
			<option value="증류주">증류주</option>
			<option value="과실주">과실주</option>
		</select> </td></tr>
<tr><td id="table_title">가격</td></tr>
<tr><td id="table_input"><input type="number" name="price" placeholder="원" value="${alchol.price }"> 원</td></tr>
<tr><td id="table_title">제조일</td></tr>
<tr><td id="table_input"><input type="date" name="made_date" value="${alchol.made_date }" > </td></tr>
<tr><td id="table_title">원료</td></tr>
<tr><td id="table_input"><input type="text" name="material" value="${alchol.material }"></td></tr>
<tr><td id="table_title">도수</td></tr>
<tr><td id="table_input"><input type="number" name="degree" placeholder="%" value="${alchol.degree }"> %</td></tr>
<tr><td id="table_title">용량</td></tr>
<tr><td id="table_input"><input type="number" name="capacity" placeholder="ml" value="${alchol.capacity }"> ml </td></tr>
<tr><td id="table_title">갯수</td></tr>
<tr><td id="table_input"><input type="number" name="count" placeholder="개" value="${alchol.capacity }"> 개 </td></tr>
</table>
<input type="hidden" name="maker_num" value="${alchol.maker_num }">
<div id="line"><img alt="" src="../images/common/line.png">
</div>
<div id="contents_form">
	<textarea  rows="50" cols="30" name="contents" id="contents">${alchol.contents }</textarea>	
</div>
<div id="line"><img alt="" src="../images/common/line.png"></div>
<br>
<br>
<br>
<input style="width: 80px;font-weight: bolder;" type="button" class="form-control" id="btn" value="수정하기">
</form>
</section>
<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function () {
	
	 $("select[name=kind] option").each(function(){
		    if($(this).val()=="${alchol.kind}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
		 });
	
});
</script>
</body>
</html>