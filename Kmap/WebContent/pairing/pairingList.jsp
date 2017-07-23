<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
section {
	width: 60%;
	margin: 0 auto;
}

#wrap{
	width: 100%;
	height: 100%;
}

#list{
	width: 30%;
	height: 250px;
	margin-left: 2%;
	margin-top: 2%;
	border: 1px solid #e6e6e6;
	display:inline-block;
	overflow: hidden;
}

#photo{
	width: 98%;
	height: 170px;
	border: 2px solid #cccccc;
	margin: 0 auto;
	margin-top: 1%;
}

#contents{
	width: 80%;
	height: 50px;
	margin: 0 auto;
	margin-left:10%;
	overflow: hidden;
}

#serve{
	width: 100%;
	height: 25px;
	background-color: #f2f2f2;
	border: 1px solid #e6e6e6;
}

#title{
	width: 100%;
	height: 40%;
	margin-top: 1%;
	font-size: 1.2em;
	font-weight:bold;
}

#writer{
	width: 100px;
	height: 40%;
	margin-top: 2%;
	float:right;
}

#view_img{
	width: 8%;
	height: 90%;
	display: inline-block;

}

#hit_img{
	width: 8%;
	height: 90%;
	display: inline-block;

}

/* #serve_location{
	width: 50%;
	height: 100%;
	float: right;

} */

.boardSearch{
	float: left;

}

#search_form{
	width: 450px;
	height: 50px;
	margin: 0 auto;
	margin-top: 20px;
}

.container_page{
	width: 120px;
	height: 50px;
	float: right;
}

.container_page span{

display: block;
float: left;
margin-left: 3px;

}

.btn:HOVER{

cursor: pointer;
color: white;

}



</style>
<title>안주 페어링</title>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>

<article id="wrap">

<c:forEach items="${pairing}" varStatus="i">
	<div id="list">
		<div id="photo">
			<a href="./pairingView.pairing?num=${pairing[i.index].num}"><img style="width: 100%; height: 100%;" alt="" src="${pageContext.request.contextPath}/upload/${files[i.index]}"></a>
		</div>
		<div id="contents">
			<div id="title">
				<a href="./pairingView.pairing?num=${pairing[i.index].num}">${pairing[i.index].title}</a>
			</div>
			<div id="writer">By ${pairing[i.index].writer}</div>
		</div>
		<div id="serve">
			<!-- <div id="serve_location"> -->
			<div id="view_img">
				<img style="width: 100%; height: 100%;" alt="" src="../images/pairing/eye.png">
			</div>
			${pairing[i.index].hit}
			<div id="hit_img">
				<img style="width: 100%; height: 100%;" alt="" src="../images/pairing/finger.png">
			</div>
			${pairing[i.index].recommend}
			<!-- </div> -->
		</div>
	
	</div>
</c:forEach>
	
</article>

<article id="search_form">
<form action="./pairingList.pairing">
			<div class="boardSearch">
				<select style="width: 90px;" class="form-control" name="kind" id="kind">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="contents">내용</option>
				</select>
			</div>
			<div class="boardSearch">
				<input style="width: 250px;" class="form-control" type="text" name="search" id="search" value="${param.search }">
			</div>

			<div class="boardSearch">
				<input class="btn" type="submit" value="SEARCH">
			</div>
	</form>
</article>
			<div class="container_page">
					<c:if test="${makePage.curBlock > 1}">
						<span><a href="./pairingList.pairing?curPage=${pageResult.startNum-1}&search=${param.search}&kind=${param.kind}">이전</a></span>
					</c:if>
					<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}"
						var="i">
						<span><a href="./pairingList.pairing?curPage=${i}&search=${param.search}&kind=${param.kind}">${i}</a></span>
					</c:forEach>
					<c:if test="${makePage.curBlock < makePage.totalBlock}">
						<span><a href="./pairingList.pairing?curPage=${pageResult.lastNum+1}&search=${param.search}&kind=${param.kind}">다음</a></span>
					</c:if>
			</div>
			<br><br>
	<c:if test="${not empty admin }">
	<a class="form-control" style="width: 70px; font-size: 1.1em; float: right;" href="pairingWriteForm.jsp">글쓰기</a>
	</c:if>
</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>