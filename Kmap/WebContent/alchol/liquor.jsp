<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>리큐르</title>
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
	height: 550px;
	overflow: hidden;
}

.section_top_1 {
	width: 50%;
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
	width: 42%;
	height: 100%;
	margin-top: 14px;
	display: inline-block;
	overflow: hidden;
}

.section_top_2_1 {
	width: 85%;
	height: 70%;
	margin-top: 3%;
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
	height: 400px;
	margin-top: 10px;
	background-color: #6A936D;
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
	float: right;
	width: 44%;
	height: 100%;
	display: inline-block;
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
	margin-top: 10%;
	margin-left: 50%;
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
	height: 900px;
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
	height: 50%;
}

.section_bottom_1_img {
	margin-left: 10%; 
	height: 100%;
	width: 80%;
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
	font-size: 20px; color : white; margin-top : 10%; margin-left : 60%;
	text-align : left;
	background-color: #333031;
	text-align: left;
	margin-left: 60%;
	margin-top: 10%;
	color: white;
}



.section_bottom_2 {
	overflow: hidden;
	width: 35%;
	height: 100%;
	display: inline-block;
	
}

.section_bottom_2_box {
	width: 100%;
	height: 100%;
}

.img_bottom {
	margin-left: 10%;
	width: 80%;
	height: 100%;
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
				<p>리큐르(Liqueur)의 어원은 ‘녹아들다’는 의미의 라틴어인 리케파세페(Liquefacere)에서 유래된 프랑스어다.</p>
				<br>
				<p>우리나라 주세법에서는 고량주, 럼, 보드카 진, 위스키형 기타 제제주를 일반증류주로, 인삼주와 매실주와 오카피주 등은 리큐르로 분류하였다.</p>
				<p>일반증류주와 리큐르의 경계는 술 속에 포함된 엑스분(술을 증발시켰을 때 증발하지 않고 남아있는 성분)이 2% 이상이면 리큐르, 2% 미만이면 일반 증류주로 분류한다. </p>
				<p>인삼 증류주라 하더라도 엑스분 2%의 경계에 따라, 리큐르 인삼주와 일반 증류주 인삼주로 갈린다.</p>
				
			</div>
			<div class="section_top_2">
				<div class="section_top_2_1">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/liquor_top.jpg"
						class="section_top_2_img">
				</div>
			</div>
		</div>
		<div class="section_middle">
			<div class="section_middle_1">
				<img alt=""
					src="${pageContext.request.contextPath}/images/alchol_img/liquor_middle.jpg"
					class="section_middle_1_img">
			</div>
			<div class="section_middle_2">
				<h2>한국의 대표적인 리큐르</h2>
				<br> <br> <br> <br>
				<p>인삼주와 매실주와 오카피주 등은 리큐르로 분류</p>
				<div class="section_middle_inner">

					
					<h1><a href="alcholList_2.alchol?type=리큐르">리큐르 더 알아보기 &emsp;&emsp;></a></h1>
				</div>
			</div>
		</div>


		<div class="section_bottom">

			<div class="section_bottom_1">
				<div class="section_bottom_1_box">
				
					<br>
					<p>이강주</p>
					<p>이강주는 술 이름에서부터 그 재료를 밝히고 있습니다. </p>
					<p>배 리(梨)와 생강 강(薑), 즉 배와 생강이 들어간 술입니다. </p>
					<p>그런데 꼭 이강주가 아니더라도 우리 술에서 배와 생강은 아주 자유롭게 쓰였습니다. </p>
					<p>배는 시원하고 부드럽고 달콤하여 술과 자유로이 섞이는데 배즙, 배 곤 물, 배과육 등의 형태로 술 속에 들어가 맛을 부드럽고 경쾌하게 만듭니다. </p>
					<br>
					<p>생강은 막힌 혈을 뚫어주는 기질이 있어, 소주의 독하고 강렬한 기운과 잘 어울립니다. </p>
					<p>이 때문에 소주를 내릴 때에 소줏고리의 꼭지에 생강 한 톨을 끼워 넣어, 생강의 은은한 향을 소주 속에 담아내기도 합니다.</p>
					<br>
					<p>이강주에는 배와 생강 말고도 울금, 계피, 꿀이 들어갑니다. </p>
					<p>울금과 계피 또한 맛과 향이 강렬한 약재이지요. 울금은 카레의 원료로 생김새는 생강과 흡사합니다. 	</p>
					<p>울금은 습관성이 없는 신경 안정제로 쓰이기도 하는데, 	</p>
					<p>음양의 성질을 모두 지니고 있어 높은 혈압을 내려주고 낮은 혈압을 올려주는 기능을 합니다. 	</p>
					<p>이 때문에 조선시대에는 궁궐에서 직접 사람을 파견하여 재배 관리토록 할 만큼 귀하게 여겼던 약재였습니다. 	</p>
					<br>
					<p>현재 울금 재배는 10여년 전에 전남 진도에서 시작되어 재배 지역을 제법 넓힌 상태입니다. 	</p>
					<p>이 여파로 여러 양조장에서 노란 울금 막걸리가 상품화되어 인기를 얻고 있습니다. 	</p>
					<p>계피는 활달한 향 때문에 수정과에도 넣어먹는 상쾌한 약재입니다.	</p>
					
					
					

				</div>
			</div>
			<div class="section_bottom_2">
				<div class="section_bottom_2_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/liquor_bottom.jpg"
						class="img_bottom">

				</div>
	

			</div>

		</div>

	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>