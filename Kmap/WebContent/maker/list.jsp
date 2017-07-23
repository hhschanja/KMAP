<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>양조장 소개</title>
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">
/* =============SECTION start============= */
section {
	width: 60%;
	margin: 0 auto;
}

#list{
	width: 100%;
	height: 300px;
	margin: 0 auto;
	margin-top: 50px;

}

#list_photo{
	width: 30%;
	height: 100%;
	display: inline-block;
	float: left;
}

#list_photo img{
	width: 100%;
	height: 100%;
}

#list_list{
	width: 60%;
	float: left;
	height: 100%;
	display: inline-block;
	margin-left: 5%;
}

#list_list > p{
color: black;
font-weight: bold;

}

#list_list a{
color: black;
font-weight: bold;

}

#list_title{
	font-size: 2.0em;
	font-weight: bolder;
	margin-top: 10%;
}

#list_address{

font-size: 1.2em;
margin-top: 5%;
font-weight: bolder;

}

#list_contents{

font-size: 1.0em;
margin-top: 2%;

}

#button{
width: 200px;
height: 15%;
background-color: black;
margin-top: 4%;
margin-right:4%;
float: right;
}

#button_write{
width: 50%;
height: 60%;
margin: 0 auto;
margin-top: 4%;
}

#button a{
color: white;
font-size: 1.4em;
text-decoration: none;
}



#line{
width: 100%;
height: 2%;
margin-top: 3%;
}

#line > img{
width: 100%;
}


#pager{
height: 30px;
margin-top: 20px;
}


#pagination{
float: right;
font-size: 1.3em;
margin-right: 10%;
}

#pagination > span{
margin-right: 10px;

}

.block{
border: 1px solid black;

}


#button_admin{
width: 85px;
height:50px;
font-weight: bolder;
color: black;
float: right;
margin-top: 20px;
}

#button_admin a{

text-decoration: none;

}




/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<!--  =============SECTION start=============  -->
<section>
<c:forEach items="${list}" varStatus="i">
<div id="list">
	<div id="list_photo">
		<a href="../upload/${files[i.index]}"><img alt="" src="${pageContext.request.contextPath}/upload/${files[i.index]}"></a>
	</div>
	
	<div id="list_list">
		<p id="list_title"><a href="./makerView.maker?num=${list[i.index].num}">${list[i.index].name}</a></p>
		<p id="list_address">${list[i.index].address_main} ${list[i.index].address_detail}</p>
		<p id="list_contents">대표: ${list[i.index].ceo} / 설립연도: ${list[i.index].establish}</p>
		<div id="button">
			<div id="button_write">
			<a href="./makerView.maker?num=${list[i.index].num}">자세히보기</a>
			</div>
		</div>
	</div>
	
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

</c:forEach>

<div id="pager">           
	<div id="pagination">

<c:if test="${pageResult.curBlock > 1}">
	<span class="block"><a href="./makerList.maker?curPage=${pageResult.startNum-1}">&lt; Prior</a></span>  
</c:if>

<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="y"> <!-- 이거 page를 num으로 바꿔여해 -->  
    <span><a href="./makerList.maker?curPage=${y}">${y}</a></span>
</c:forEach>  

<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
	<span class="block"><a href="./makerList.maker?curPage=${pageResult.lastNum+1}">Next &gt;</a></span>  
</c:if>

	</div>
</div>

<c:if test="${not empty admin}">
<div id="button_admin">
	<a href="./makerInput.jsp" class="form-control" id="btn">작성하기</a>
</div>
</c:if>

</section>

<!--  =============SECTION finish=============  -->

<c:import url="../temp/footer.jsp"/>

</body>
<script type="text/javascript">
$(document).ready(function(){
    $("#header_ul").mouseover(function(){
        $("#menu_bar").slideDown("slow");
    });
    $("#menu_bar").mouseleave(function(){
        $("#menu_bar").slideUp("slow");
    });

});


</script>
</html>




