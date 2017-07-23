<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>
<c:choose>
	<c:when test="${board.equals('freeboard')}">
	나의 자유게시판
	</c:when>
	<c:when test="${board.equals('purchase')}">
	나의 구입목록
	</c:when>
	<c:when test="${board.equals('question')}">
	나의 질의응답
	</c:when>
</c:choose>

</title>
<style type="text/css">
/* =============SECTION start============= */
a {
	color: black;
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

#title{

font-size: 1.5em;

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
.t1{
	width : 10%;
	line-height: normal;
}
.t2{
	width: 40%;
}

.t3 {
	width : 5%;
}

.t4 {
	width : 5%;
}

.t5 {
	width : 15%;
}

.t6 {
	width : 20%;
}

.t7 {
	width : 5%;
}


#btn{
	width : 50px;
	
}

#photo{
 width: 100px;
 height: 100px;
}

#size{
margin-top: 35px;
}

#container{

width: 120px;
float: right;

}

/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>

	<section>
	<div id="boardWrap">
	<br>
	
<!-- 자유게시판 마이페이지 -->

	<c:choose>
	<c:when test="${board.equals('freeboard')}">
	<div id="title">
	회원님의 작성글입니다.
	</div>
	<form action="./freeboardMyList.freeboard">
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
					<td class="thead">분류</td>
					<td class="thead">제목</td>
					<td class="thead">작성날짜</td>
					<td class="thead">조회수</td>					
					<td class="thead">좋아요</td>
				</tr>
			</thead>
			<tbody>
	<c:forEach items="${boardList}" var="dto">
				<tr>
					<td class="tbody tkind">${dto.kind}</td>
					<td class="tbody ttile"><a href="./${board}View.${board}?num=${dto.num}&type=${board}">${dto.title}</a></td>
					<td class="tbody tdate">${dto.reg_date}</td>
					<td class="tbody thit">${dto.hit}</td>	
					<td class="tbody trecomend">${dto.recommend }</td>				
				</tr>
	</c:forEach>
			</tbody>	
		</table>
		
		<div id="container">
				<ul class="pagination">
					<c:if test="${pageResult.curBlock > 1}">
						<span><a href="${board}MyList.${board}?curPage=${pageResult.startNum-1}&search=${param.search}&kind=${param.kind}">&lt; PRIOR</a></span>
					</c:if>
					<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
						<span><a href="${board}MyList.${board}?curPage=${i}&search=${param.search}&kind=${param.kind}">${i}</a></span>
					</c:forEach>
					<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
						<span><a href="${board}MyList.${board}?curPage=${pageResult.lastNum+1}&search=${param.search}&kind=${param.kind}">NEXT &gt;</a></span>
					</c:if>
				</ul>
			</div>
		
	</c:when>

	<c:when test="${board.equals('purchase')}">
	<div id="title">
	회원님이 구매하신 목록입니다.
	</div>

		<table class="table table-hover">
			<thead>
				<tr>
				<td class="thead"></td>
				<td class="thead">상품이름</td>
				<td class="thead">수량</td>
				<td class="thead">가격</td>
				<td class="thead">포인트</td>
				<td class="thead">상태</td>
				<td class="thead">환불</td>
				</tr>
			</thead>
			<tbody>
	<c:forEach items="${purchaseList}" varStatus="i">
					<tr>
					<td class="tbody t1">
					<div id="photo">
					<img style="width: 100%; height: 100%;" alt="" src="${pageContext.request.contextPath}/upload/${files[i.index]}">
					</div>
					</td>
					<td class="tbody t2"><div id="size">${purchaseList[i.index].name}</div></td>
					<td class="tbody t3"><div id="size">${purchaseList[i.index].count}</div></td>
					<td class="tbody t4"><div id="size">${purchaseList[i.index].price}</div></td>
					<td class="tbody t5"><div id="size">${purchaseList[i.index].point}</div></td>
					<td class="tbody t6"><div id="size">${purchaseList[i.index].status}</div></td>
					<td class="tbody t7"><div id="size">
					<c:if test="${purchaseList[i.index].point eq 0}">
					<input type="button" value="환불불가" class="form-control" style="width: 80px;">
					</c:if>
					<c:if test="${purchaseList[i.index].point > 0}">
					<a class="form-control" style="width: 80px; text-align: center;"
					 href="../member/refund_page.jsp?purchase_num=${purchaseList[i.index].num}&refund_type=${purchaseList[i.index].charge_type}&point=${purchaseList[i.index].point}">결제취소 </a>
					 </c:if>
					 </div></td>
					
					</tr>
	</c:forEach>
			</tbody>	
		</table>
		
		<div id="container">
				<ul class="pagination">
					<c:if test="${pageResult.curBlock > 1}">
						<span><a href="${board}MyList.${board}?curPage=${pageResult.startNum-1}">&lt; PRIOR</a></span>
					</c:if>
					<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
						<span><a href="${board}MyList.${board}?curPage=${i}">${i}</a></span>
					</c:forEach>
					<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
						<span><a href="${board}MyList.${board}?curPage=${pageResult.lastNum+1}">NEXT &gt;</a></span>
					</c:if>
				</ul>
			</div>
			
			
	</c:when>
	<c:otherwise> 

	<div id="title">
	회원님이 문의하신 내용입니다.
	</div>
	<form action="./questionMyList.question">
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
					<td class="thead">제목</td>
					<td class="thead">날짜</td>
				</tr>
			</thead>
			<tbody>
	<c:forEach items="${boardList}" var="dto">
				<tr>
					<td class="tbody tnum">${dto.num}</td>
					<td class="tbody ttitle"><a href="./${board}View.${board}?num=${dto.num}&type=${board}">${dto.title}</a></td>
					<td class="tbody tdate">${dto.reg_date}</td>
				</tr>
	</c:forEach>
			</tbody>	
		</table>
		
		<div id="container">
				<ul class="pagination">
					<c:if test="${pageResult.curBlock > 1}">
						<span><a href="${board}MyList.${board}?curPage=${pageResult.startNum-1}&search=${param.search}&kind=${param.kind}">&lt; PRIOR</a></span>
					</c:if>
					<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
						<span><a href="${board}MyList.${board}?curPage=${i}&search=${param.search}&kind=${param.kind}">${i}</a></span>
					</c:forEach>
					<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
						<span><a href="${board}MyList.${board}?curPage=${pageResult.lastNum+1}&search=${param.search}&kind=${param.kind}">NEXT &gt;</a></span>
					</c:if>
				</ul>
			</div>
			
	</c:otherwise>
	</c:choose>
	
		
	</div>
	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>