<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0de07eb294c4d6d6cb52be82eb7db31b&libraries=services"></script><!-- 지도 -->
<c:import url="../temp/bootStrap.jsp"/>
<title>${pairing.title}</title>
<style type="text/css">

/* =============SECTION start============= */
section {
	width: 60%;
	margin: 0 auto;
}

#view_title{

width: 40%;
height: 80px;
margin-top: 100px;
font-size: 3.0em;
font-weight: bolder;
color: #404040;
margin-left: 5%;
}

#view_photo{
width: 700px;
height: 450px;
margin: 0 auto;
margin-top: 3%;
}

#view_photo img{
width: 100%;
height: 100%;
}


#line{
width: 90%;
height: 2%;
margin: 0 auto;
margin-top: 5%;
}

#line > img{
width: 100%;
}

#contents{
width: 99%;
height: 100%;
margin: 0 auto;
margin-top: 10%;
}

#contents img{
width: 100%;
}


#button_admin_form{
width: 200px;
height: 50px;
margin-top: 2%;
float: right;
}

#button_admin{
width: 85px;
height:50px;
font-weight: bolder;
color: black;
display: inline-block;
}


#button_admin a{
text-decoration: none;
}

#button_admin2{
width: 115px;
height:50px;
font-weight: bolder;
color: black;
margin-right: 1%;
display: inline-block;
}

#button_admin2 a{
text-decoration: none;
}

#button_admin3{
width: 100px;
height:50px;
font-weight: bolder;
color: black;
margin-right: 1%;
display: inline-block;
}

#button_admin3 a{
text-decoration: none;
}

#sebu{
	width: 300px;
	float: right;
	font-size: 1.2em;
	font-weight: bold;
}

#view{
display: inline-block;
}

#hit{
margin-left: 10px;
display: inline-block;
}

#like{
width: 20%;
height: 20%;
margin: 0 auto;
margin-top: 50px;

}

#like_ment{
width: 100px;
height: 10px;
margin: 0 auto;
margin-top: 20px;
font-size: 2.3em;
font-weight: bolder;
}


/* =============SECTION finish============= */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<!--  =============SECTION start=============  -->

<section>

<div id="view_title">${pairing.title}</div>

<div id="sebu">
	<div id="view">
		조회수:${pairing.hit}
	</div>
	<div id="hit">
		추천수:${pairing.recommend}
	</div>
</div>

<div id="view_photo">
	<a href="../upload/${files[0].fname}"><img alt="" src="../upload/${files[0].fname}"></a>
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

   <div id="contents">${pairing.contents}</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<div id="like">
	<a href="./pairingRecommend.pairing?num=${pairing.num }"><img style="width: 100%; height: 100%;" alt="" src="../images/pairing/finger.png" ></a>
</div>
<div id="like_ment">
<a href="./pairingRecommend.pairing?num=${pairing.num }">좋아요</a>
</div>

<div id="line"><img alt="" src="../images/common/line.png"></div>

<c:if test="${not empty admin}">

<div id="button_admin_form">

<div id="button_admin">
		<a href="./pairingUpdateForm.pairing?num=${pairing.num}" class="form-control" id="btn">수정하기</a>
</div>
<div id="button_admin">
	<form action="./pairingDelete.pairing" id="frm_del">
	<input type="hidden" name="num" value="${pairing.num}">
	<input type="button" value="삭제하기" class="form-control" id="btn_del">
	</form>
</div>

</div>

</c:if>

</section>
<!--  =============SECTION finish=============  -->
<c:import url="../temp/footer.jsp"/>
</body>
<script type="text/javascript">

$("#btn_del").click(function() {
	var result = confirm("정말로 삭제하시겠습니까?");

	if(result){
		$("#frm_del").submit();
	}else{
		
	}
});



</script>
</html>
