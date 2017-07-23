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
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
section {
	width: 60%;
	margin: 0 auto;
}
h2 {
	width : 100%;
	height : 50px;
	color: orange;
}
#notice{
	margin-bottom: 20px;
}
#boardWrap {
	width: 80%;
	margin: 0 auto;
}
#boardWrap > img {
	margin-top: 5%;
	margin-bottom: 3%;
}
#boardWrap > p {
	display: inline-block;
}

#tit_header{
	float : left;
	line-height : 2;
	font-size : 250%;
	width : 100%;
	height : 80px;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}
#writer{
	text-align: right;
	font-size: 130%;
}
#date{
	text-align: right;
}
#hit{
	text-align: right;
}
#file{
	float: right;
	text-align:right; 
}
#content {
	width : 100%;
	height : 500px;
	font-size: 200%;
	overflow: auto;
}
#phone{
	display : inline;
	font-size: 120%;
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
#tool {
	width : 100%;
	float: right;
}
#tool > a {
	float: right;
	margin-left : 2%;
}
.bar {
	width: 100%;
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
#del{
	cursor: pointer;
}

</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section >
	<div id="boardWrap">
	<br>
	<c:choose>
		<c:when test="${board eq 'notice' }">
			<a href="noticeList.notice?curPage=1"><img alt="" src="../images/common/NOTICE.png"></a>
		</c:when>
		<c:when test="${board eq 'question' }">
			<a href="questionList.question?curPage=1"><img alt="" src="../images/common/question.png"></a>
		</c:when>
	</c:choose>
	<br>
	<p id="tit_header">${dto.title}<br></p>
	<p id="writer">작성자 : ${dto.writer}</p>
	<p id="date">작성날짜 / ${dto.reg_date}</p>
	<div id="file">
	<c:if test="${board eq 'notice'}">
	<p id="hit">조회수 / ${dto.hit}</p>
	<p>첨부파일</p>
	<c:forEach items="${files}" var="f" varStatus="i">
	<p><a href="../upload/${f.fname}">${f.oname}</a></p>
	<input type="hidden" value="${i.count}" id="${f.fname}" name="${i.count}">	
	</c:forEach>
	</c:if>
	</div>
	<div id="content">${dto.contents}</div>
	<c:if test="${board eq 'notice' and not empty member}">
	<img  class="bar" alt="" src="../images/common/bar.png">
	<div id="tool">
	<a href="${board}List.${board}?curPage=1" class="form-control" style="width : 120px; text-align: center;" >리스트 보기</a>
	</div>
	</c:if>
	<c:if test="${board eq 'question' and member.id != dto.writer and empty admin}">
	<img  class="bar" alt="" src="../images/common/bar.png">
	<div id="tool">
	<a href="${board}List.${board}?curPage=1" class="form-control" style="width : 120px; text-align: center;" >리스트 보기</a>
	</div>
	</c:if>
	<c:if test="${board eq 'question'}">
	<c:if test="${member.id eq dto.writer or not empty admin}">
	<div id="phone">
	연락처 / ${dto.phone_kind} ${dto.phone_1} - ${dto.phone_2} - ${dto.phone_3}
	</div>
	</c:if>
	</c:if>	
	
	<c:choose>
		<c:when test="${board eq 'notice' and not empty admin}">
		<img  class="bar" alt="" src="../images/common/bar.png">
					<div id="tool">
			<a  id ="del" class="form-control" style="width : 120px; text-align: center;">글 삭제</a>
			
			<a href="${board}UpdateForm.${board}?num=${dto.num}&count=${list}" class="form-control" style="width : 120px; text-align: center;">글 수정</a>
			
			<a href="noticeList.notice?curPage=1" class="form-control" style="width : 120px; text-align: center;">리스트 보기</a>
			</div>
		</c:when>
		
		<c:when test="${board eq 'question' and not empty admin}">
		<img  class="bar" alt="" src="../images/common/bar.png">
			<div id="tool">
			<a  id ="del" class="form-control" style="width : 120px; text-align: center;">글 삭제</a>
			<a href="${board}UpdateForm.${board}?num=${dto.num}&count=${list}" class="form-control" style="width : 120px; text-align: center;">글 수정</a>
			<a href="questionList.question?curPage=1" class="form-control" style="width : 120px; text-align: center;">리스트 보기</a>
			</div>
		</c:when>
	</c:choose>
		<c:if test="${board eq 'question' and member.id eq dto.writer}">
		<img  class="bar" alt="" src="../images/common/bar.png">
		<div id="tool">
			<a  id ="del" class="form-control" style="width : 120px; text-align: center;">글 삭제</a>
			<a href="${board}UpdateForm.${board}?num=${dto.num}&count=${list}" class="form-control" style="width : 120px; text-align: center;">글 수정</a>
			<a href="questionList.question?curPage=1" class="form-control" style="width : 120px; text-align: center;">리스트 보기</a>
			</div>
		</c:if>

	<c:if test="${board eq 'question' }">
	<img  class="bar" alt="" src="../images/common/bar.png">
	<c:choose>
		<c:when test="${empty member and empty admin}">
			댓글을 남기고 싶다면 로그인을 먼저하세요
			<hr>		
		</c:when>
		<c:when test="${not empty member}">
			<input type="hidden" name="type" value="${board}" class="type"> 
			<input type="hidden" name="type_num" value="${dto.num}" class="type_num">	
			<input type="text" name="writer" value="${member.id}" readonly="readonly" class="writer form-control" style="width: 9%;">
			<input type="text" name="contents" class="contents form-control" style="width:50%;">		
			<input type="submit" value="댓글달기" id="reply" class="form-control" style="width : 120px; text-align: center;">
			<hr>
		</c:when>
		<c:when test="${not empty admin}">
			<input type="hidden" name="type" value="${board}" class="type"> 
			<input type="hidden" name="type_num" value="${dto.num}" class="type_num">	
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
	<div id="reply_contents">${R.contents}</div>
	<br>
	</c:forEach>
	</div>	
	</c:if>

		
	</div>
	</section>
	<c:import url="../temp/footer.jsp"/>
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
	
<script type="text/javascript">
	$("#del").click(function() {
		var result = confirm("삭제 하시겠습니까?");
		
		if(result){
			location.href = "./${board}Delete.${board}?num=${dto.num}&board_type=${board}";
		}else {
			location.href = "./${board}View.${board}?num=${dto.num}&type=${board}";
		}
	});
	
	
	
</script>
	
</body>
</html>