<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교환 및 반품</title>
<style type="text/css">
.navbar {
      margin-bottom: 50px;
      border-radius: 0;
}
 
.form-control:HOVER{
	color: gray;
}
/*센션 스타트  */
section {
	width: 60%;
	margin: 0 auto;
	margin-top: 50px;
	overflow: hidden;
}

/*======================================  */
.section_middle {
	margin-top: 30px;
	margin-left: 5%;
	width: 90%;
	font-size: 20px;
}

#line {
	width: 90%;
	height: 2%;
	margin-top: 10%;
}

#line>img {
	width: 100%;
}
#boardWrap {
	width: 80%;
	margin: 0 auto;
}

#boardWrap>p {
	text-align: left;
	font-size: 20px;
}

#boardWrap>img {
	margin-top: 5%;
	margin-bottom: 3%;
}
h3{
	text-align:center;
	font-size: 40px;
	font-family: serif; 
	text-decoration:underline overline;
	font-weight: 900;
}
#tit_header>p {
	font-weight: 900;
	text-align:left;
	font-size: 15px;
	
}

</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>
			<div id="boardWrap">
			<br> <h3>REFUND PAGE</h3>
			<br>
			
			<p>작 성 자&ensp;| ${refund.id }</p>
			<p>작성날짜 | ${refund.write_date }</p>
			<p>신청번호 | ${refund.num }</p>
			<p>구매번호 | ${refund.purchase_num }</p>
			<p>처리상태 | ${refund.handling }</p>
			<c:if test="${refund.refund_type !='null null'}">
			<p>환불계좌 | ${refund.refund_type }</p>
			</c:if>
		
		
		</div>
		
			<div id="line">
			<img alt="" src="../images/common/line.png">
		</div>
		<br>
		<div id="tit_header">
				<p>『${refund.title }』</p>
			</div>
		<div class="section_middle"><br><br>${refund.contents }</div>

		<div id="line">
			<img alt="" src="../images/common/line.png">
		</div>
		<c:if test="${not empty admin }">
		<c:if test="${refund.handling eq '미처리' }">
		<a href="refundMod.refund?handling=접수완료&num=${refund.num }"><input class="form-control" style="width :100px; margin-top: 5px; display: inline-block;" type="button" value="접수하기"></a>
		</c:if>
		<c:if test="${refund.handling eq '접수완료' }">
		 <a href="refundMod.refund?handling=환불완료&num=${refund.num }&id=${refund.id }&point=${refund.point }"><input  class="form-control" style="width :100px; margin-top: 5px; display: inline-block;" type="button" value="환불완료"></a>
		 </c:if>
	</c:if>
	</section>

<c:import url="../temp/footer.jsp"/>
</body>
</html>