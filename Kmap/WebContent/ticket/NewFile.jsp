<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<form action="./ticketUpdate.ticket" method="post" enctype="multipart/form-data">
	<input type="hidden" name="tnum" value="${ticket.tnum }">
	이름:<input type="text" name="name" value="${ticket.name }">
	가격:<input type="number" name="price" value="${ticket.price }">
	수량:<input type="number" name="count" value="${ticket.count }"> 
	설명:<input type="text" name="contents" value="${ticket.contents }">
	메이커번호:<input type="number" name="maker_num" value="${ticket.maker_num }">
	시작월:<input type="text" name="start_month" value="${ticket.start_month }">
	종료월:<input type="text" name="last_month" value="${ticket.last_month }">
	소요시간:<input type="number" name="required_time" value="${ticket.required_time }">
	<c:if test="${not empty upload.fname}">
	<img style="width: 100px; height: 100px;" alt="" src="../upload/${upload.fname}">
	<input type="hidden" name="fname" value="${upload.fname }">
	<input type="hidden" name="oname" value="${upload.oname }">
	</c:if>
	<p>이미지<input type="file" name="file"></p>
	<input type="submit" value="수정">
	
	</form>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>