<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>과실주</title>
<style type="text/css">
a{
	color: white;
}
a:HOVER{
	color: white;
}
/*섹션========================================================================  */
section {
	font-family: inherit;
	width: 100%;
	margin: 0 auto;
	background-image: url("../images/alchol_img/alchol_tile_2.jpg");
	background-repeat: repeat;
	width: 100%;
}
/*============맨 위의 div 첫번째================  */
.section_top {
	background-color: white;
	width: 100%;
	height: 600px;
	overflow: hidden;
}

.section_top_1 {
	width: 58%;
	height: 100%;
	font-size: 20px;
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
	width: 90%;
	height: 80%;
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
	margin-top: 10px;
	height: 400px;
	background-color: #B08792;
}
/*============섹션 중간 부분 첫번째 div=============  */
.section_middle_1 {
	width: 50%;
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
	
	width: 50%;
	height: 100%;
	display: inline;
	float: right;
	overflow: hidden;
	color: white;
	text-align: center;
}

.section_middle_2 h2 {
	margin-left: 5%;
	margin-top: 5%;
	font-size: 30px;
}

.section_middle_2 p {
	font-size: 20px;
}

.section_middle_inner {
	width: 400px;
	height: 40px;
	line-height: 40px;
	border: 0.5px white solid;
	font-size: 25px;
	margin-top: 5%;
	margin-left: 60%;
	
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
	height: 1400px;
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
	margin-left: 10%;
	width: 80%;
	height: 553px;
}

.section_bottom_1 p {
	margin-top: 15px;
	font-size: 20px;
}

.section_bottom_inner {
	width: 300px;
	height: 50px;
	line-height: 40px;
	border: 0.5px white solid;
	font-size: 20px;
	color: white;
	margin-top: 10%;
	margin-left: 10%;
	text-align: left;
	background-color: #333031;
	text-align: left;
	color: white;
}

.section_bottom_inner h1 {
	font-weight: bolder;
	margin-left: 10%;
}

.section_bottom_2 {
	overflow: hidden;
	width: 35%;
	height: 100%;
	display: inline-block;
}
.section_bottom_2_box_1{
width: 100%;
height: 1000px;
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
/*섹션========================================================================  */
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
	<section>

		<div class="section_top">
			<div class="section_top_1">
				<br>
				<p>과실주는 과실을 원료로 하여 발효시킨 술이다.</p>
				<p>과실주는 크게 두 가지 형태, 발효주로서 과실주와 혼성주로서 과실주로 구분할 수 있다.</p>
				<p>발효주로서 과실주는 포도, 사과, 배, 복분자 등의 과실을 발효시켜서 만든다.</p>
				<p>혼성주로서의 과실주는 일반증류주나 희석식 소주에 침출시키는 매실주나 모과주 따위를 지칭한다.</p>
				<br>
				<p>주세법의 과실주 정의는</p>
				<p>가) 과실(과일즙과 건조된 과실포함) 또는 과실과 물을 원료로 하여 발효시킨 술덧을 여과, 제성하거나 나무통에
					저장한 것.</p>
				<p>나) 과실을 주원료로 당분과 물을 혼합하여 발효시킨 것.</p>
				<p>다) 가) 또는 나)의 규정에 과실즙을 첨가한 것.</p>
				<p>라) 가) 또는 나)의 규정에 주류 또는 물료를 혼합한 것’으로 규정되어 있다.</p>
				<br>
				<p>주정이나 증류주를 혼합할 때는, 발효한 과실주의 알코올분 총량이 20% 이상이고, 주정이나 증류주의 알코올분
					총량이 80% 이하여야 과실주로 분류한다.</p>


			</div>
			<div class="section_top_2">
				<div class="section_top_2_1">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/fruit_top.jpg"
						class="section_top_2_img">
				</div>
			</div>
		</div>
		<div class="section_middle">
			<div class="section_middle_1">
				<img alt=""
					src="${pageContext.request.contextPath}/images/alchol_img/fruit_middle.jpg"
					class="section_middle_1_img">
			</div>
			<div class="section_middle_2">
				<h2>한국의 다양한 과실주 제품들</h2>
				<br> <br> <br> <br>
				<p>포도와 머루, 자두, 다래, 사과, 복분자 등으로 제조되는 와인.</p>
				<p>한국의 다양한 과실로 전국의 양조장에서 빚어내는 과실주 제품</p>
				<div class="section_middle_inner">
					<h1><a href="alcholList_2.alchol?type=과실주">과실주 더  알아보기 &emsp;&emsp;></a></h1>
				</div>
			</div>
		</div>


		<div class="section_bottom">

			<div class="section_bottom_1">
				<div class="section_bottom_1_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/deseo.jpg"
						class="section_bottom_1_img"> <br> <br> <br>
					<br>
					<p>숙성기간 9년, 산머루 100%로 만드는 한국와인
					<p>와인을 포도로만 만든다는 상식은 반은 맞고 반은 틀렸다. 국제적으로 인기 있는 와인이 대부분 포도로 만들긴
						해도 구대륙과 신대륙 와인 모두에서 사과나 감 등 포도가 아닌 과일을 이용한 와인들을 흔히 발견할 수 있다. 자국
						와인이 시장의 50%를 차지하고 있는 일본에서는 와인용 효모를 사용한 사케에 버젓이 '와인'이라는 이름을 붙여서 팔기도
						한다. 와인을 너무 딱딱한 시선으로 바라볼 필요가 없는 것이다.</p>

					<p>국내 와인 양조는 이제 걸음마 단계지만, 70년대부터 시작해 벌써 30년이 넘는 양조 역사를 지닌 곳이
						있다. 바로 파주 산머루농원이다. 이름처럼 산머루를 재배해 산머루주, 즙, 쨈 등을 만드는 곳이다. 감악산 중턱에
						위치해 사시사철 일조량이 많고 배수가 잘 돼 산머루를 재배하기 적합한 환경이다. 2014년에는 농림부 지정 '찾아가는
						양조장'으로 선정됐다.</p>
					<br>

					<p>이곳의 와인에는 머루 드 서(Meoru De Seo)라는 라벨이 붙어있다. 2대째인 서충원 대표의 이름을 딴
						것으로 만드는 사람의 이름을 넣어 품질을 끝까지 책임진다는 의미를 담았다.</p>

					<p>산머루는 당도가 높고 압착이 쉬워 즙을 내 가공하기 적합한 과일이다. 현재 시중에 판매 중인 산머루 와인은
						모두 2006년에 빚은, 9년이란 긴 시간 동안 숙성된 고급 와인이다. 프랑스나 이태리 와인이라면 15만 원 이상을
						호가할 것이다. 그만큼 산머루의 품질이 뛰어나다는 증거이기도 하다.</p>
						<p>
					%만으로 만든다. 알코올함량은 13.5%이다. 산머루는 모두 산머루농원과 주변 산
					머루 마을에서 나는 것으로만 만들어
					품질을 관리한다.
					</p>

<p>압착부터 숙성, 포장까지 전 가공이 산머루 농원에서 이루어진다. 특히 숙성은 감악산 중턱에 100m 길이 터널을 뚫어 오크통을 이용한다. 연중 15도 이하로 서늘한 온도를 유지하기 때문에 와인뿐만 아니라 고급 산머루주를 만들 때도 이용한다.</p> 

<p>테이블 와인으로나 선물용으로 드라이와 스위트의 완성도는 충분한 수준이다. 그중 드라이는 상온에서 마시기 적합하며 달지 않고 산미가 적당해 기름진 음식과 잘 어울린다. 아로마의 강도는 아쉬움이 있지만, 검은 과실 향의 존재감이 분명하고 미디엄 바디에 부드러운 산미로 치즈 등 가벼운 안주와 마시기에도 좋다.</p>

					<div class="section_bottom_inner">
						
						<h1><a href="alcholList_2.alchol?type=과실주"> 더 알아보기 &emsp;></a></h1>
					</div>

				</div>
			</div>
			<div class="section_bottom_2">
				<div class="section_bottom_2_box_1">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/fruit_bottom_1.jpg"
						class="img_bottom">

				</div>
				<div class="section_bottom_2_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/fruit_bottom_2.jpg"
						class="img_bottom">
				</div>

			</div>

		</div>

	</section>

<c:import url="../temp/footer.jsp"/>

</body>
</html>