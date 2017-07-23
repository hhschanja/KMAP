<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<script type="text/javascript" src="/Kmap/SE2/js/HuskyEZCreator.js" charset="utf-8"></script> <!-- 네이버 글에디터 -->
<script type="text/javascript">

$(function(){
    var title = document.getElementById("title");
	var contents = document.getElementById("contents");
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
     
	       var phone = document.getElementsByClassName("phone"); 
    //전송버튼 클릭이벤트
    $("#btn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
       	
        var title = $("#title").val();
        if(title==""){
        	alert("제목을 입력하세요");
        	
        }
       	for(var i=0;i<phone.length;i++){
       		if(phone[i].value==""){
       			alert("연락처를 입력하세요");
       		}
       		break;
       	}
        if(title!=""){
	        //폼 submit
	        $("#frm").submit();      	
        }
          
        })
    
})
</script>
<title>
<c:choose>
		<c:when test="${param.board eq 'notice' }">
		공지사항 입력
		</c:when>
		<c:when test="${param.board eq 'question' }">
		질의응답 입력
		</c:when>
</c:choose>
</title>
<style type="text/css">

/* =============SECTION START============= */
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
textarea {
	width: 99%;
}
section {
	width: 60%;
	margin: 0 auto;
}
#boardWrap{
	width: 80%;
	margin: 0 auto;
}
#boardWrap > img {
	margin-top: 5%;
	margin-bottom: 3%;
}
#frm{
	width: 80%;
	margin: 0 auto;
}
.phone{
	width: 10%;
}
#contents {
	margin-top: 20px;
}
#btn {
	margin-top: 20px;
}
.form-control{
	display: inline;
}
.rFile {
	cursor: pointer;
}
input[type=file] {
	display: inline;
}
/* =============SECTION FINISH============= */
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section>
	<div id="boardWrap">
	<c:if test="${param.board eq 'notice'}">
	<br>
	<img alt="" src="../images/common/NOTICE.png">
	<form action="./${param.board}Write.${param.board}" method="post" enctype="multipart/form-data" id="frm">
	<input type="hidden" name="writer" value="${admin.id}">
	<c:choose>
		<c:when test="${not empty member}">
			<p>작성자 : ${member.id}</p><br>		
		</c:when>
		<c:when test="${not empty admin}">
			<p>작성자 : ${admin.id}</p><br>
		</c:when>
	</c:choose>
	<p><input type="text" placeholder="제목을 입력하세요" name="title" id="title"  class="form-control" style="width : 77%;"></p><br>
	<textarea rows="" cols="" id="contents" name="contents"></textarea>
	<input type="button" id="addfile" value="파일첨부" class="form-control" style="width : 120px; text-align: center;">
	<input type="button" value="완료" id="btn" class="form-control" style="width : 120px; text-align: center;">
	<div id="result"></div>	
	</form>
	</c:if>
	<c:if test="${param.board eq 'question'}">
	<br>
	<img alt="" src="../images/common/question.png">
	<form action="./${param.board}Write.${param.board}" method="post" id="frm">
	<input type="hidden" name="writer" value="${member.id}">
	<p>작성자 | ${member.id}</p><br>
	<div>
	연락처 |
	<select class="form-control" name="phone_kind" id="phone_kind" style="width : 120px;">
			<option value="KT">KT</option>
			<option value="SKT">SKT</option>
			<option value="LGT">LGT</option>
	</select>
	<input type="text" name="phone_1" class="phone form-control" style="width : 120px; text-align: center;"> -
	<input type="text" name="phone_2" class="phone form-control" style="width : 120px; text-align: center;"> -
	<input type="text" name="phone_3" class="phone form-control" style="width : 120px; text-align: center;">
	</div><br>
	<p><input type="text" placeholder="제목을 입력하세요" name="title" id="title" style="width : 77%;"class=" form-control" ></p><br>
	<textarea rows="" cols="" id="contents" name="contents"></textarea>
	<input type="button" value="완료" id="btn" class="form-control" style="width : 120px; text-align: center;">
	</form>
	</c:if>
	</div>
	</section>
	<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
		var count=0;
		$("#addfile").click(function(){
			if(count<5){
				var files ='<div id="f'+count+'"><input type="file" name="file'+count+'"><span title="f'+count+'" class="rFile">X</span></div>';
				count++;
				$("#result").append(files);
			}else {
				alert('최대 5개만 가능');
			}
		});
		
		$("#result").on("click", ".rFile", function() {
			var f = $(this).attr("title");
		 	$("#"+f).remove();
			count--; 
			
		});
		
	</script>	
	
</body>
</html>