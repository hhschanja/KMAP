<%@page import="com.kmap.upload.AdminUploadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전통주</title>
<style type="text/css">
section {
	width: 60%;
	height : 1000px;
	margin: 0 auto;
	overflow: hidden;
}
a{
color: black;
}
.section_top{
	width: 100%;
	margin-top: 30px;
	
}
.section_top_searchBox{
	width: 700px;
	margin-left: 25%;
}

/*알콜 상품 보이는 부분  */
.alchol_List {
	width: 23%;
	height: 500px;
	margin-top: 30px;
	float: left;
	margin-left: 1%;
	display: inline-block;
	box-shadow : 3px 9px 20px 0px rgba(0,0,0,0.2);
	float: left;
	overflow: hidden;
}
.alchol_List_p_div{
		margin-top: 12px;
		overflow: hidden;
		
	}
	.alchol_List_p_div > p{
	    letter-spacing: 1px;
		font-size: 12px;
		font-weight: bold;
		margin-left: 10px;
	}	
	
 .title{
 	width: 100%;
 	
 	margin-top: 0px;
 	margin-left: 15px;
 	letter-spacing: 1px;
 	overflow: hidden;
 	font-size: 20px;
 	text-align: center;
 	font-weight: 900;
 	width: 80%;
 }
.img {
	width: 100%;
	height: 300px;
	border-bottom: #e4e6e4 0.5px solid;
	
}
/*알콜 상품 보이는 부분  */
	#kind {
		width: 100px;
		height: 30px;
	margin-left: 10%;
	}
#search {
	width: 50%;
	height: 35px;
	float: left;
	margin-left: 1%;
	display: inline-block;
}
	#search_btn{
	margin-left: 1%;
	width: 90px;
		height: 35px;
	}
	
	.form-control{
		display: inline-block;
		float: left;
	}
	.dodo{
		
		font-weight: bold;
		float: right;
		margin-right: 5%;
	}
	.dodo > input{
		width: 110px;
		text-align: center;
		font-size: 20px;
	}
#line {
	width: 97%;
	height: 2%;
	margin-top: 20px;
}

#line>img {
	width: 100%;
}
.btn:HOVER{
	color: white;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>
	<div class="section_top">
		<form class="section_top_searchBox" action="alcholList.alchol">
			
				<select class="form-control" style="width: 80px ; height: 35px;"  name="kind" id="kind">
					<c:choose>
					<c:when test="${param.kind=='material' }">
					<option value="name">주명</option>
					<option value="material" selected="selected">원료</option>
					<option value="kind">종류</option>
					<option value="contents">내용</option>
					</c:when>
					<c:when test="${param.kind=='kind' }">
					<option value="name">주명</option>
					<option value="material">원료</option>
					<option value="kind" selected="selected">종류</option>
					<option value="contents">내용</option>
					</c:when>
					<c:when test="${param.kind=='contents' }">
					<option value="name">주명</option>
					<option value="material">원료</option>
					<option value="kind">종류</option>
					<option value="contents" selected="selected">내용</option>
					</c:when>
					<c:otherwise>
					<option value="name">주명</option>
					<option value="material">원료</option>
					<option value="kind">종류</option>
					<option value="contents">내용</option>
					</c:otherwise>
					
					</c:choose>
				</select> 
				
					<input   type="text" name="search" id="search">
					
					<input   class="btn" type="submit" value="SEARCH" id="search_btn">
			

		</form>
		</div>
					
		<div id="line" >
			<img alt="" src="../images/common/line.png">
		</div>
		
		<c:forEach items="${alcholList }" varStatus="i" var="alchol">
			<div class="alchol_List">
				<a href="alcholView.alchol?anum=${alchol.anum}&type=alchol"> <img
					class="img" alt="" src="../upload/${files[i.index]}"></a>
			
				<div class="title">
					<a href="alcholView.alchol?anum=${alchol.anum }&type=alchol" >${alchol.name } </a>
				</div >
				<div class="alchol_List_p_div">
				<p>종류: ${alchol.kind }</p>
				<p>가격: <fmt:formatNumber value="${alchol.price }" type="currency" currencySymbol=""/>원</p>
				<p>도수: ${alchol.degree }%</p>
				<p>용량:${alchol.capacity }ml</p>
				<p>원재료: ${alchol.material }</p>
				<p>제조일:${alchol.made_date }</p>
				</div>
			</div>



		</c:forEach>
		<br>





	</section>

<c:import url="../temp/footer.jsp"/>


</body>
</html>