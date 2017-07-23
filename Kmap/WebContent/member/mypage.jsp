<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>마이페이지</title>
<style type="text/css">
section {
	width: 60%;
	height : 100%;
	margin: 0 auto;
}

#title{
	color: black;
	font-size: 1.5em;

}

#profile{
	width: 90%;
	height: 150px;
	border: 1px solid #262626;
	margin: 30px auto;
}

#photo{
width: 100px;
height: 100px;
margin: 20px 20px;
float: left;
}

#list{
width: 30%;
height: 100%;
float: left;
margin-left: 50px;
}

#list_id{
width: 100%;
height: 50px;
margin-top: 20px;
font-size: 2.5em;
}

#list_point{
width: 100%;
height: 20px;
margin-top: 10px;
font-size: 1.2em;
}

#list_button{
width: 30%;
height: 100%;
float: right;
}

.form-control{
width: 120px;
height: 30px;
font-size: 1.1em;
margin-top: 100px;
margin-left: 100px;
}

.menu{
	width: 100%;
	height: 90px;
	border-bottom: 1px dotted black;
}

.menu_list{
	width: 60%;
	height: 100%;
}

.menu_title{
	width: 100%;
	height: 20px;
	font-weight: bold;
	margin-top: 30px;
}

.menu_contents{
	width: 100%;
	height: 30px;
	font-size: 0.9em;
	margin-top: 10px;
}

.menu_img{
}



</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>

<section>
<article id="title">
대동여주도를 이용해주셔서 감사합니다.
</article>

<article id="profile">
<div id="photo">
<img style="width: 100%; height: 100%;" alt="" src="../images/member/human.png">
</div>

<div id="list">
<div id="list_id">
${member.id}
</div>
<div id="list_point">
가용 포인트 : ${member.point}
</div>
</div>
<div id="list_button">
<a href="./memberDelete.member" class="form-control">회원 탈퇴하기</a>
</div>

</article>

<div class="menu">
<div class="menu_list">
<div class="menu_title">
<a href="./modform.jsp">Profile 회원 정보</a>
</div>
<div class="menu_contents">
<a href="./modform.jsp.">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>
개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</a>
</div>
</div>
<div id="menu_img">

</div>
</div>

<div class="menu">
<div class="menu_list">
<div class="menu_title">
<a href="../purchase/purchaseMyList.purchase"> Order 주문내역 조회</a>
</div>
<div class="menu_contents">
<a href="">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.</a>
</div>
</div>
<div id="menu_img">

</div>
</div>

<div class="menu">
<div class="menu_list">
<div class="menu_title">
<a href="../basket/basketList.basket">Basket 장바구니</a>
</div>
<div class="menu_contents">
<a href="../basket/basketList.basket">고객님께서 담아놓으신 상품을 확인하실 수 있습니다.</a>
</div>
</div>
<div id="menu_img">

</div>
</div>

<div class="menu">
<div class="menu_list">
<div class="menu_title">
<a href="../freeboard/freeboardMyList.freeboard">Freeboard 내 게시글</a> 
</div>
<div class="menu_contents">
<a href="../freeboard/freeboardMyList.freeboard">고객님께서 올린 게시글들을 확인하실 수 있습니다.</a>
</div>
</div>
<div id="menu_img">

</div>
</div>



<div class="menu">
<div class="menu_list">
<div class="menu_title">
<a href="../board/questionMyList.question">Consult 1:1 맞춤상담</a>
</div>
<div class="menu_contents">
<a href="../board/questionMyList.question">고객님의 궁금하신 문의사항에 대하여 1:1맞춤상담 내용을 확인하실 수 있습니다.</a>
</div>
</div>
<div id="menu_img">

</div>
</div>

<div class="menu">
<div class="menu_list">
<div class="menu_title">
<a href="../refund/refundListMine.refund">환불 요청 목록</a>
</div>
<div class="menu_contents">
<a href="../refund/refundListMine.refund">고객님께서 신청하신 환불요청을 확인하실 수 있습니다.</a>
</div>
</div>
<div id="menu_img">

</div>
</div>




</section>

	<c:import url="../temp/footer.jsp"/>
</body>
</html>