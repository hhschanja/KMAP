<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>막걸리</title>
<style type="text/css">
a{
	color: white;
}
a:HOVER{
	color: white;
}
section {
	font-family: inherit; width : 100%;
	margin: 0 auto;
	background-image: url("../images/alchol_img/alchol_tile_2.jpg");
	background-repeat: repeat;
	width: 100%;
}
/*============맨 위의 div 첫번째================  */
.section_top {
	background-color: white;
	width: 100%;
	height: 630px;
	overflow: hidden;
}

.section_top_1 {
	width: 58%;
	height: 100%;
	font-size: 18px;
	display: inline-block;
	overflow: hidden;
}

.section_top_1 p {
	margin-top: 14px;
	margin-left: 40px;
}
/*============맨 위의 div 첫번째 끝==================  */
/*============맨 위의 div 두번째==================  */
.section_top_2 {
	width: 34%;
	height: 100%;
	margin-top: 14px;
	display: inline-block;
	overflow: hidden;
}

.section_top_2_1 {
	width: 85%;
	height: 70%;
	margin-top: 7.5%;
	margin-left: 7%;
}

.section_top_2_img {
	width: 100%;
	height: 100%;
}
/*============맨 위의 div 두번째 끝==================  */
/*============섹션 중간 부분=================  */
.section_middle {
	width: 100%;
	margin-top: 20px;
	height: 400px;
	background-color: #CAB189;
}
/*============섹션 중간 부분 첫번째 div=============  */
.section_middle_1 {
	width: 40%;
	height: 100%;
	display: inline-block;
}

.section_middle_1_img {
	width: 100%;
	height: 100%;
}
/*============섹션 중간 부분 첫번째 div 끝===========  */
/*============섹션 중간 부분 두번째 div===========  */
.section_middle_2 {
	float: right;
	width: 54%;
	height: 100%;
	display: inline-block;
	overflow: hidden;
	color: white;
	text-align: center;
}

.section_middle_2 h2 {
	margin-left: 5%;
	margin-top: 5%;
	font-size: 25px;
}

.section_middle_2 p {
	font-size: 18px;
}

.section_middle_inner {
	width: 400px;
	height: 50px;
	
	border: 0.5px white solid;
	font-size: 90%;
	margin-top: 10%;
	margin-left: 60%;
	text-align: left;
	
}

.section_middle_inner h1 {
	margin-top: 10px;
	font-size: 20px;
	text-align:center;
	font-weight: bolder;

}
/*============섹션 중간 부분 두번째 div 끝===========  */
/*============섹션 중간 부분 끝===============  */

/*============섹션 마지막 부분===============  */
.section_bottom {
	margin-top: 50px;
	width: 100%;
	height: 1100px;
	overflow: hidden;
}

.section_bottom_1 {
	margin-left: 10%;
	width: 50%;
	height: 100%;
	display: inline-block;
	overflow: hidden;
}

.section_bottom_1_box {
	margin-top: 10px;
	width: 100%;
	height: 40%;
}

.section_bottom_1_img {
	margin-left: 10%; width : 80%;
	height: 100%;
	width: 80%;
}

.section_bottom_1 p {
	margin-top: 15px;
	font-size: 20px;
}
.section_bottom_2 {
	overflow: hidden;
	width: 35%;
	height: 100%;
	display: inline-block;
}

.section_bottom_2_box {
	width: 100%;
	height: 450px;
}

.img_bottom {
	margin-left: 10%;
	margin-top: 5%;
	width: 80%;
	height: 70%;
}
/*============섹션 마지막 부분 끝=============  */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>
		<div class="section_top">
			<div class="section_top_1">
				<br>			
				<p>막걸리는 가장 대중적이면서, 가장 앞선 시대에 등장한 우리 술로 여겨진다.</p>
				<p>막걸리는 체에 막 걸렀다해서 생긴 이름이다.</p>
				<p>막이라는 뜻을 신선하다 또는 거칠다라는 뜻으로 받아들일 수 있는데, 이즈음엔 신선하다는 뜻이 더 강조되고
					있다.</p>
				<p>막걸리의 법적 명칭인 탁주는 술빛이 흐리기 때문에 붙여진 이름이다.</p>
				<br>
				<p>주세법상에 탁주는 “전분질 원료와 국을 주원료로 하여 발효시킨 술덧을 혼탁하게 제성한 것”을 말한다.</p>
				<p>탁주와 청주(약주)를 구분하는 경계는, 탁주는 술덧을 여과하지 않고 혼탁하게 하여 거른 것이고, 청주(약주)는
					여과하여 맑게 거른 것이다.</p>
				<br>
				<p>탁주의 주요한 원료는 멥쌀과 밀누룩과 물이다.</p>
				<p>멥쌀 고두밥을 찐 뒤에, 이를 식혀서 물과 함께 빻은 누룩을 비벼 항아리에 담는다.</p>
				<p>항아리를 25도 전후의 따뜻한 곳에 놓아두면 술이 발효되기 시작하여 빠르게는 4-5일 만에, 더디게는 7-8일
					만에 완성된다.</p>
				<p>발효가 다 끝난 상태에서 술항아리 윗부분의 맑은 술을 떠내면 청주가 되는데, 탁주는 청주를 떠내고 난 뒤에
					가라앉아 있는 술지게미에 물을 부어 하루쯤 재웠다가 체에 걸러 마시는 형태를 이른다.</p>
				<br>
				<p>하지만 청주를 떠내지 않고 처음부터 술지게미까지 휘휘 저어서, 체에 걸러 탁주를 내리는 경우도 있다 .</p>
			</div>
			<div class="section_top_2">
				<div class="section_top_2_1">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/makgeolli_top.jpg"
						class="section_top_2_img">
				</div>
			</div>
		</div>
		<div class="section_middle">
			<div class="section_middle_1">
				<img alt=""
					src="${pageContext.request.contextPath}/images/alchol_img/makgeolli_middle.jpg"
					class="section_middle_1_img">
			</div>
			<div class="section_middle_2">
				<h2>한국의 다양한 맛걸리들</h2>
				<br> <br> <br> <br>
				<p>쌀이나 각종 곡류와 누룩으로 빚어 말 그대로 막 걸러내었다 하여 붙여진 이름이 막걸리다.</p>
				<div class="section_middle_inner">
					<h1><a href="alcholList_2.alchol?type=막걸리">막걸리 종류별 알아보기 &emsp;&emsp;></a></h1>
				</div>
			</div>
		</div>
		<div class="section_bottom">
			<div class="section_bottom_1">
				<div class="section_bottom_1_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/haechang.jpg"
						class="section_bottom_1_img"> <br> <br> <br>
					<br>
					<p>무감미료 막걸리 - 해창 막걸리</p>
					<p>감미료가 안 들어간 해창 막걸리는 맛이 덤덤하고 담백하다.</p>
					<p>단맛이 고스란히 빠지니, 마치 물밑의 고요함과 같은 적막함이 느껴진다.</p>
					<p>아주 섬세하게 그 향과 맛을 좇아가보면 고소한 맛이 미끌리듯이 느껴지고, ‘쌉쓸한’ 맛이 혀 끝에 물린다.</p>
					<p>설탕보다 200배 강한 단맛을 지니고 있다는 아스파탐이나 스테비오사이드가 들어간 맛은, 입안에서 엷은
						듯하면서도 짜릿하게 느껴지는 단맛의 질감이 입안에 오래 남는다.</p>
					<p>쌀의 전분에서 넘어온 단맛은 입안에서 두툼하고 무겁게 느껴지지만, 삼키고 나면 사라져버린다.</p>
					<p>감미료의 단맛은 미세하지만 뒷끝이 남고, 쌀의 단맛은 뭉툭하지만 뒷끝이 없다.</p>
					<p>감미료가 들어간 술을 높이 평가하기 어려운 이유는 원재료의 진솔한 맛을 가려버리기 때문이다.</p>
				</div>
			</div>
			<div class="section_bottom_2">
				<div class="section_bottom_2_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/makgeolli_bottom_1.jpg"
						class="img_bottom">
				</div>
				<div class="section_bottom_2_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/makgeolli_bottom_2.jpg"
						class="img_bottom">
				</div>
			</div>
		</div>
	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>