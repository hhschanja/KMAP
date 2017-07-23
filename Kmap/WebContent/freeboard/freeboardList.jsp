<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>자유게시판</title>
<style type="text/css">
/* =============SECTION start============= */
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
a {
	color: black;
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
	margin-bottom: 3%;
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
.tkind{
	width : 10%;
}
.tnum{
	width: 9%;
}
.twriter{
	width : 10%;
}
.tdate {
	width : 15%;
}
.thit {
	width : 9%;
}
.trecomend {
	width: 10%;
}
#btn{
	width : 50px;	
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
/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>
	<div id="boardWrap">
	<br>
	<img alt="" src="../images/common/community.png">
	<form action="${board }List.${board}">
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
					<td class="thead">NO</td>
					<td class="thead">분류</td>
					<td class="thead">제목</td>
					<td class="thead">작성자</td>
					<td class="thead">작성날짜</td>
					<td class="thead">조회수</td>					
					<td class="thead">좋아요</td>
				</tr>
			</thead>
			<tbody>
	<c:forEach items="${boardList}" var="dto">
				<tr>
					<td class="tbody tnum">${dto.num}</td>
					<td class="tbody tkind">${dto.kind}</td>
					<td class="tbody ttile"><a href="./${board}View.${board}?num=${dto.num}&type=${board}">${dto.title}</a></td>
					<td class="tbody twriter">${dto.writer}</td>
					<td class="tbody tdate">${dto.reg_date}</td>
					<td class="tbody thit">${dto.hit}</td>	
					<td class="tbody trecomend">${dto.recommend }</td>				
				</tr>
	</c:forEach>
			</tbody>	
		</table>
		
		<div id="pager">           

<div id="pagination">

<c:if test="${pageResult.curBlock > 1}">
	<span class="block"><a href="./freeboardList.freeboard?curPage=${pageResult.startNum-1}&kind=${param.kind}&search=${param.search}">&lt; Prior</a></span>  
</c:if>

<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="y"> <!-- 이거 page를 num으로 바꿔여해 -->  
    <span><a href="./freeboardList.freeboard?curPage=${y}&kind=${param.kind}&search=${param.search}">${y}</a></span>
</c:forEach>  

<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
	<span class="block"><a href="./freeboardList.freeboard?curPage=${pageResult.lastNum+1}">Next &gt;</a></span>  
</c:if>

</div>
</div>
			<c:if test="${not empty member}">
				<p id="btn"><a href="./freeboardWriteForm.jsp?board=${board}" class="form-control" style="width : 120px; text-align: center;">글쓰기</a></p>							
			</c:if>
	</div>
	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>