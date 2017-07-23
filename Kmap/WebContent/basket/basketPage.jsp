<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>장바구니</title>
<style type="text/css">
a:HOVER{
	color: gray;
}
section{
	width: 60%;
	margin: 0 auto;
}
section table{

	width: 100%;
}
table th{
	text-align: center;
	height: 50px;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	font-size: 20px;
}
table td{
	border-bottom: 1px solid black;
	margin-top: 1px;
	font-size: 20px;
	font-weight: bold;
	
	text-align: center;
}
.imgTd{
	width: 30%;
}

</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<!--========================================  -->
<section>
<div>
<img style="width: 100px; height: 90px; display: inline-block;" alt="" src="../images/common/cartRider.JPG"> <span style="font-size: 50px; font-weight: bolder ">&ensp; 장바구니</span>
</div>
<br>
<table style="margin-top: 10px;">
<tr><th class="imgTd">이미지</th><th>상품명</th><th>담은 갯수</th><th>가격</th><th>제거</th> </tr>

<c:forEach items="${basket}" varStatus="i" >
<tr>
<td class="imgTd"><div>

<c:if test="${pType[i.index] == 'ticket'}">
<a href="../ticket/ticketView.ticket?tnum=${basket[i.index].type_num}"><img style="width: 100px; height: 120px;" alt="" src="../upload/${files[i.index]}"></a> 
</c:if>
<c:if test="${pType[i.index] == 'alchol'}">
<a href="../alchol/alcholView.alchol?anum=${basket[i.index].type_num}"><img style="width: 100px; height: 120px;" alt="" src="../upload/${files[i.index]}"></a>
</c:if>
</div></td> 
<td>
<c:if test="${pType[i.index] == 'ticket'}">
<a href="../ticket/ticketView.ticket?tnum=${basket[i.index].type_num}">${basket[i.index].name}</a> 
</c:if>
<c:if test="${pType[i.index] == 'alchol'}">
<a href="../alchol/alcholView.alchol?anum=${basket[i.index].type_num}">${basket[i.index].name}</a>
</c:if>
</td>
<td>${basket[i.index].count}</td>
<td>${basket[i.index].price}</td>
<td><a href="basketDelete.basket?num=${basket[i.index].num}">X</a></td>
</tr>
</c:forEach>

</table>
<c:if test="${not empty basket}">
<a href="../purchase/purchaseForm.purchase">
<input type="submit"style="width :80px;margin-top: 5px; display: inline-block; float: right;"  class="form-control" value="구매하기"> 
</a>
</c:if>

<!--========================================  -->
</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>