<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>증류주</title>


<style type="text/css">
body{
	background-image: url("../images/alchol_img/alchol_tile_2.jpg");
	background-repeat: repeat;

}
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
	width: 37%;
	height: 100%;
	margin-top: 14px;
	display: inline-block;
	overflow: hidden;
}

.section_top_2_1 {
	width: 100%;
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
	background-color: #8797B0;
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
	
	width: 54%;
	height: 100%;
	float: right;
	
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
	margin-left: 60%;
	
}

.section_middle_inner h1 {
	margin-top: 10px;
	font-size: 20px;
	font-weight: bolder;
	text-align:center;
}
/*============섹션 중간 부분 두번째 div 끝===========  */
/*============섹션 중간 부분 끝===============  */

/*============섹션 마지막 부분===============  */
.section_bottom {
	margin-top: 50px;
	width: 100%;
	height: 1000px;
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
	height: 100%;
}

.img_bottom {
	margin-left: 10%;
	margin-top: 5%;
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
				<p>한국의 증류주를 대표하는 소주는 크게 두 분류로 나뉜다.</p>
				<br>
				<br>
				<p>전통방식의 증류식 소주와 주정을 원료로 한 희석식소주로 나뉜다. </p>
				<p>안동소주와 문배주가 전통방식의 증류식 소주고, 진로로 대표되는 소주가 희석식 소주다. </p>
				<p>한국의 희석식 소주는 품질과 가격 경쟁력을 갖추고 있어 외화 획득에도 기여하고 있다.</p>
				<p>그래서 외국사람들은 한국을 대표하는 술로 소주를 꼽기도 한다. </p>
				<br>
				<p>다만 희석식 소주는 값싼 원료를 쓰기 때문에 대중주로서 명성은 있어도, 명품이 되기에는 한계가 있다. </p>
				<p>명품 증류주는 전통 증류주에서 찾아야 한다.</p>

			</div>
			<div class="section_top_2">
				<div class="section_top_2_1">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/hard_top.jpg"
						class="section_top_2_img">
				</div>
			</div>
		</div>
		<div class="section_middle">
			<div class="section_middle_1">
				<img alt=""
					src="${pageContext.request.contextPath}/images/alchol_img/hard_middle.jpg"
					class="section_middle_1_img">
			</div>
			<div class="section_middle_2">
				<h2>한국의 다양한 증류주들</h2>
				<br> <br> <br> <br>
				<p>전통 방식으로 증류한 증류식 소주를 소개합니다.</p>
				<div class="section_middle_inner">

					
					<h1><a href="alcholList_2.alchol?type=증류주">전통 증류주 알아보기 &emsp;&emsp;></a></h1>
				</div>
			</div>
		</div>


		<div class="section_bottom">

			<div class="section_bottom_1">
				<div class="section_bottom_1_box">
				<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/gamhongro.jpg"
						class="section_bottom_1_img"> <br> <br> <br>
					
					<br>
					<p>평양 명주 감홍로</p>
					<br>
					<p>감홍로는 알코올 40도나 되는 도수 높은 소주다. </p>
					<p>감홍로를 빚으려면 쌀과 좁쌀을 찌고 여기에 누룩과 물을 섞어 발효시킨다. </p>
					<p>일반 소주는 1차 증류에서 끝나지만 감홍로는 한 번 더 증류해 한약재를 넣어 다시 소주의 독성을 약화시키고 약효를 강화시키려는 전략이 함께 담겨 있다. </p>
					<br>
					<p>감홍로에는 장에 좋다는 용안육, 정기를 북돋아준다는 정향, 비타민이 풍부한 진피, 산삼 못지 않다는 지초 그리고 향긋한 계피, 활달한 생강, 달콤한 감초가 들어있다. </p>
					<br>
					<p>농림부 명인으로 지정되어 있는 이기숙씨는 인간을 기분 좋게 만들어주는 먹을거리로 술과 마약이 있는데, 마약은 만들 수 없으니 술을 만든다는 얘기를 아버지로부터 들었다고 했다.</p>
					<br>
					<p>문배주로 인간문화재가 된 이경찬 옹이 그의 아버지인데, 모든 술에는 독이 있으니 술을 빚으려면 독 기운이 적은 거라야 좋다며 감홍로를 빚으셨다고 한다.</p>
					

					

				</div>
			</div>
			<div class="section_bottom_2">
				<div class="section_bottom_2_box">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/hard_bottom.jpg"
						class="img_bottom">

				</div>
				

			</div>

		</div>

	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>