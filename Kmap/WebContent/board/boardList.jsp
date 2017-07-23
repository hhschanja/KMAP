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
/* =============SECTION start============= */
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
section {
	width: 60%;
	height : 1000px;
	margin: 0 auto;
}
h2 {
	width : 100%;
	height : 50px;
	color: orange;
}
.table {
	margin: 0 auto;
	margin-top: 20px;
	width: 100%;
}
#boardWrap {
	width: 80%;
	margin: 0 auto;
}
#boardWrap > img {
	margin-top: 5%;
}
.boardSearch{
	margin-top : 30px;
	display: inline-block;
}
.thead {
	text-align : center;
	border-bottom: 3px gray solid;
	border-top: 1px black solid;
}
.tbody{
	text-align : center;
	border-bottom: 0.5px gray solid;
}
.tnum{
	width: 9%;
}
.tdate {
	width : 13%;
}
.thit {
	width : 9%;
}
.pagination >  li{
	width : 40%;
	margin: 0 auto;
	float: right;
}
#admin_write {
	float: right;
}
#pager{
width: 100%;
margin-bottom: 0px;
}
#pagination{
width: 10%;
margin-top: 3%;
margin-left: 80%;
}
#pagination a{
color: black;
}
.btn:HOVER{
	color: white;
}
#view {
	cursor: pointer;
}

#role{
cursor: pointer;
}
/* =============SECTION finish============= */
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
	<form action="${board}List.${board}">
			<div class="boardSearch">
				<select class="form-control" name="kind" id="kind">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="contents">내용</option>
				</select>
			</div>
			<div class="boardSearch">
				<input class="form-control" type="text" name="search" id="search">
			</div>

			<div class="boardSearch">
				<input class="btn" type="submit" value="SEARCH">
			</div>
	</form>
		<table class="table table-hover">
			<thead>
				<tr>
					<td class="thead">No.</td>
					<td class="thead">제목</td>
					<td class="thead">작성자</td>
					<td class="thead">날짜</td>
					<c:if test="${board eq 'notice'}">
					<td class="thead">조회수</td>					
					</c:if>
				</tr>
			</thead>
			
			<tbody>
	<c:forEach items="${boardList}" var="dto">
				<tr>
					<td class="tbody tnum">${dto.num}</td>
					<td class="tbody ttitle"><a id="role" onclick="role(${dto.num}, '${dto.writer}')">${dto.title}</a></td>
					<td class="tbody twriter">${dto.writer}</td>
					<td class="tbody tdate">${dto.reg_date}</td>
					<c:if test="${board eq 'notice'}">
					<td class="tbody thit">${dto.hit}</td>					
					</c:if>
				</tr>
	</c:forEach>
			</tbody>	
		</table>
		<div id="pager">           

<div id="pagination">

<c:if test="${pageResult.curBlock > 1}">
	<span class="block"><a href="./${board}List.${board}?curPage=${pageResult.startNum-1}&kind=${param.kind}&search=${param.search}">&lt; Prior</a></span>  
</c:if>

<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="y"> <!-- 이거 page를 num으로 바꿔여해 -->  
    <span><a href="./${board}List.${board}?curPage=${y}&kind=${param.kind}&search=${param.search}">${y}</a></span>
</c:forEach>  

<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
	<span class="block"><a href="./${board}List.${board}?curPage=${pageResult.lastNum+1}">Next &gt;</a></span>  
</c:if>

</div>
</div>
	<c:if test="${not empty admin and board eq 'notice'}">
	<a href="./boardWriteForm.jsp?board=${board}" class="form-control" style="width : 120px; text-align: center;" id="admin_write">관리자 글쓰기</a>	
	</c:if>
	

	<c:if test="${board  eq 'question' and empty admin and not empty member}"> 
	<a href="./boardWriteForm.jsp?board=${board}" class="form-control" style="width : 120px; text-align: center;">글쓰기</a>
	</c:if>

	</div>
	</section>
<c:import url="../temp/footer.jsp"/>

<input type="hidden" id="admin" value="${admin.id}">
<input type="hidden" id="member" value="${member.id}">
<input type="hidden" id="board" value="${board}">

</body>
<script type="text/javascript">

function role(num, writer) {
	
	var member = $("#member").val();
	var admin = $("#admin").val();
	var board = $("#board").val();
	
	if(admin=="" && member!=writer && board=='question'){
		alert("권한이 부족합니다.");
		location.href = './'+board+'List.'+board;
	}else{
			location.href = './'+board+'View.'+board+'?num='+num+'&type='+board;

	}
	
};

</script>
</html>


