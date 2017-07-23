<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
     
    //전송버튼 클릭이벤트
    $("#btn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
		var title = $("#title").val();
        
        if(title==""){
        	alert("제목을 입력하세요");
        	
        }
        if(title!=""){
	        //폼 submit
	        $("#frm").submit();      	
        }
    })
})
</script>
<style type="text/css">
/* =============SECTION START============= */
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
textarea {
	width : 99%;
	
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
.rFile {
	cursor: pointer;
}
input[type=file]{
	display: inline-block;
}
/* =============SECTION FINISH============= */
</style>
<title>자유게시판</title>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	
	<section>
	<div id="boardWrap">
	<br>
	<img alt="" src="../images/common/community.png">
	<form action="./freeboardUpdate.freeboard" id="frm" enctype="multipart/form-data" method="post">
	<input type="hidden" value="${param.num}" id="num" name="num">
	<input type="hidden" name="writer" value="${boardList.writer}">
	<div>
	카테고리 분류<br><br> 
	<select id="kind" name="kind" class="form-control" style="width: 120px;">
		<option value="일상">일상</option>
		<option value="전통주 칼럼">전통주 칼럼</option>
	</select>
	</div><br>
	<p>작성자 | ${member.id}</p><br>
	<input type="text" name="title" value="${boardList.title}" class="form-control" style="width:77%;" placeholder="제목을 입력하세요"><br>
	<textarea rows="" cols="" id="contents" name="contents">${boardList.contents}</textarea>
	<div id="updateForm"> 
	<input type="button" id="addfile" value="파일추가" class="form-control" style="width:120px; text-align: center;">	
	</div>
	
	<hr>
	<div id="result">
	<c:forEach items="${upload}" var="U" varStatus="i">
	file : ${U.oname}<span id="${U.fname}" class="del">X<br></span>
	</c:forEach>
	</div>
	<input type="submit" value="게시글수정완료" class="form-control" style="width:120px; text-align: center;">
	</form>
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
				url : "uploadDelete.upload",
				type : "GET",
				data : {
					fname : fname,
					num : num
					},
				success : function(data) {					
					count--;
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