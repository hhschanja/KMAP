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
     
    $("#title").change(function() {
    	var title = $(this).val();
    	$(this).attr("value", title);
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
<title>
<c:choose>
		<c:when test="${board eq 'notice' }">
		공지사항
		</c:when>
		<c:when test="${board eq 'question' }">
		질의응답
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
	background-color: white;
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
#result{
	width: 80%;
	margin: 0 auto;
}
.del {
	margin-bottom : 2%;
	cursor: pointer;
}
.del:hover {
	color: red;
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
input[type=file]{
	display: inline;
}
/* =============SECTION FINISH============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
<div id="boardWrap">
	<br>
	<c:choose>
		<c:when test="${board eq 'notice' }">
			<img alt="" src="../images/common/NOTICE.png">
		</c:when>
		<c:when test="${board eq 'question' }">
			<img alt="" src="../images/common/question.png">
		</c:when>
	</c:choose>
	<form action="./${board}Update.${board}" method="post" id="frm" enctype="multipart/form-data" >
	<input type="hidden" name="num" value="${dto.num}" id="num">
	<input type="hidden" name="writer" value="${admin.id}">
	<c:if test="${board eq 'notice'}">
	<p>작성자 | ${admin.id}</p><br>	
	</c:if>
	<c:if test="${board eq 'question'}">
	<p>작성자 | ${member.id}</p><br>
	<input type="hidden" name="writer" value="${dto.writer}">
	<div>
	연락처 |
	<select class="form-control" name="phone_kind" id="phone_kind" style="width : 120px;">
			<option value="KT">KT</option>
			<option value="SKT">SKT</option>
			<option value="LGT">LGT</option>
	</select>
	<input type="text" name="phone_1" class="phone form-control" value="${dto.phone_1}" style="width : 120px;"> -
	<input type="text" name="phone_2" class="phone form-control" value="${dto.phone_2}" style="width : 120px;"> -
	<input type="text" name="phone_3" class="phone form-control" value="${dto.phone_3}" style="width : 120px;">
	</div><br>
	</c:if>
	<input type="text" placeholder="제목" name="title" id="title" value="${dto.title}" class="form-control" style="width : 77%;"><br><br>
	<textarea rows="" cols="" id="contents" name="contents">${dto.contents}</textarea>
	<br>
	<c:if test="${board eq 'notice'}">
	<div id="updateForm"> 	
	<input type="button" id="addfile" value="파일추가" class="form-control" style="width: 120px; text-align: center;">
	</div>
	</c:if>
	
	<br>
	<input type="submit" value="게시글수정완료" id="btn" class="form-control" style="width: 150px; text-align: center;">	
	</form>
	
	
	<div id="result">
	<hr>
	<c:forEach items="${upload}" var="U" varStatus="i">
	${U.oname} <span id="${U.fname}" class="del"> 파일지우기<br></span>
	</c:forEach>
	</div>
</div>
</section>
	<c:import url="../temp/footer.jsp"/>
	
	<script type="text/javascript">
	var count = ${param.count};
		
		$("#result").on("click",".del", function() {
			var fname = $(this).attr('id');
			var num = $("#num").val();
			var result = confirm("삭제하시겠습니까?");
			
			if(result){
			 $.ajax({
				url : "adminUploadDelete.admin",
				type : "GET",
				data : {
					fname : fname,
					num : num
					},
				success : function(data) {					
					count--;
					alert(count);
					$("#result").html(data);
				}
			});
			}
		});
		
		$("#addfile").click(function() {
			if(count<5){
				$("#updateForm").append('<div id="f'+count+'"><input type="file" name="file'+count+'"><span title="f'+count+'" class="rFile">X</span></div>');
				count++;
			}else {
				alert('최대 5개만 가능');
			}
		});
		
		$("#updateForm").on("click", ".rFile", function() {
			var f = $(this).attr("title");
		 	$("#"+f).remove();
		 	count--;
		 	if(count<0){
		 		count=0;
		 	}
		});
		
		
	</script>
</body>
</html>