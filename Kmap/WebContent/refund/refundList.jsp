<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>교환 및 반품</title>
<style type="text/css">
/* =============SECTION start============= */
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
}
/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>
	<div id="boardWrap">
	<br>

	<form action="refundList.list}">
			<div class="boardSearch">
				<select class="form-control" name="kind" id="kind">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="handling">처리상태</option>
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
					<td class="thead">신청자</td>
					<td class="thead">제목</td>
					<td class="thead">신청일</td>
					<td class="thead">처리상태</td>
					
				</tr>
			</thead>
			<tbody>
	<c:forEach items="${refundList}" var="dto">
				<tr>
					<td class="tbody tnum">${dto.num}</td>
					<td class="tbody tdate">${dto.id}</td>
					<td class="tbody ttitle"><a href="./refundView.refund?num=${dto.num}">${dto.title}</a> </td>
					<td class="tbody tdate">${dto.write_date}</td>
					<td class="tbody tdate">${dto.handling}</td>
					
				</tr>
	</c:forEach>
			</tbody>	
		</table>
		<div class="container">
				<ul class="pagination">
					<c:if test="${makePage.curBlock > 1}">
						<li><a href="refundList.refund?curPage=${pageResult.startNum-1}&search=${param.search}&kind=${param.kind}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}"
						var="i">
						<li><a href="refundList.refund?curPage=${i}&search=${param.search}&kind=${param.kind}">${i}</a></li>
					</c:forEach>
					<c:if test="${makePage.curBlock < makePage.totalBlock}">
						<li><a href="refundList.refund?curPage=${pageResult.lastNum+1}&search=${param.search}&kind=${param.kind}">다음</a></li>
					</c:if>
				</ul>
			</div>
	
	 
	</div>
	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>