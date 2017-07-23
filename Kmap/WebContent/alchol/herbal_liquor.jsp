<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>약주/청주</title>
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
	margin-top : 5px;
	float: right;
	width: 49%;
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
	margin-left: 10%; width : 80%;
	height: 100%;
	width: 80%;
}
.section_bottom_1_img_y{
	margin-left: 10%; width : 80%;
	height: 90%;
	width: 30%;
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
.section_bottom_2_box_y {
	margin-top: 10px;

	width: 100%;
	height: 440px;
}


.img_bottom {
	margin-left: 10%;
	
	width: 80%;
	height: 100%;
}
.section_top_bottom{
	margin-top: 50px;
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
				<p>현재 우리술에서 약주는 맑은 술의 대명사로 쓰인다. </p>
				
				<p>문화재로 지정된 발효주들이 대체로 청주가 아니라 약주에 속한다.  </p>
				<p>약주에는 몇 가지 복합적인 의미가 담겨있다. </p>
				<p>약재가 들어간 술이거나 약효가 있는 술의 뜻을 담고 있다. </p>
				<p>술을 높여 불러 약주라 하고, 어른들이 술을 마시면 “약주 드셨습니까?”하고 여쭤본다.  </p>
				<p>청주와 같은 의미로 약주를 사용하기도 한다. </p>
				<br>
				<p>현재 우리 주세법에 따르면 약주와 청주를 구분하는 기준은 전통누룩의 사용량이다. </p>
				<p>약주에는 전통누룩을 1% 이상 사용하고, 청주에는 1% 미만을 사용하게 되어 있다. </p>
				<p>본질적인 차이는 약주는 야생효소나 효모의 집합체인 전통 누룩을 사용하고, 청주는 분리 추출한 효소를 쌀알에 배양한 흩임누룩을 사용한다는 점이다. </p>
				<br>
				<p>즉 현재 청주는 일본스타일 청주를 지칭하는 말로 쓰이고 있다. </p>
				<p>이는 일제 식민지를 거치면서 생겨난 변화로, 개념어에 대한 재검토가 필요하다.</p>
				
				
			</div>
			
			<div class="section_top_2">
				<div class="section_top_2_1">
					<img alt=""src="${pageContext.request.contextPath}/images/alchol_img/yakju_top.jpg"class="section_top_2_img">
				</div>
			</div>
		</div>
		<div class="section_middle">
			<div class="section_middle_1">
				<img alt=""
					src="${pageContext.request.contextPath}/images/alchol_img/yakju_middle.jpg"
					class="section_middle_1_img">
			</div>
			<div class="section_middle_2">
				<h2>한국의 다양한 약주들</h2>
				<br> <br> <br> <br>
				<p>문화재로 지정된 발효주들이 대체로 청주가 아니라 약주에 속한다.</p>
				<div class="section_middle_inner">

					
					<h1><a href="alcholList_2.alchol?type=약주">약주 더 알아보기 &emsp;&emsp;></a></h1>
				</div>
			</div>
		</div>


		<div class="section_bottom">

			<div class="section_bottom_1">
				<div class="section_bottom_1_box">
				<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/gugiju.jpg"
						class="section_bottom_1_img_y"> <br> <br> <br>
					
					<br>
					<p>삼백년을 산다는 약술 청양 구기주. </p>
					<br>
					<p>청양은 구기자 산지로 유명한 고장이다.  </p>
					<p>그곳에 구기자로 술을 빚어 명인된 임영순 씨가 살고 있다.  </p>
					<br>
					<p>임영순 씨는 1996년에 농림부로부터 전통술 명인 지정을 받았고, 2000년에 충남 무형문화재로 지정되었다. </p>
					
					<p>술 이름이 구기자주가 아니라 구기주인 이유는 열매인 구기자뿐만 아니라, 뿌리, 잎, 꽃, 열매 모든 부분을 재료로 사용하기 때문이다. </p>
					<br>
					<p>술에서는 약재 향이 진하게 도는데, 입안이 끈적이지 않고 누룩의 잔맛도 느껴지지 않는다. </p>
					
					<p>마시고 나면 감칠맛이 돌아서 한 잔 더 마시고 싶은 생각이 절로 인다. </p>
					<p>그 효능이나 깊은 맛에서나 좋은 약술이라는 평을 받을 만하다.</p>
					

					

				</div>
			</div>
			<div class="section_bottom_2">
				<div class="section_bottom_2_box_y">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/yakju_bottom_1.jpg"
						class="img_bottom">

				</div>
			<div class="section_bottom_2_box_y">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/yakju_bottom_2.jpg"
						class="img_bottom">

				</div>
							

			</div>

		</div>
		
		<div class="section_top section_top_bottom">
			<div class="section_top_1">
				<br>
				<p>청주는 탁주의 상대적인 말로, 본래 맑은 술을 뜻한다. </p>
			
				<p>하지만 청주가 법적 명칭이 되면서 다른 의미를 띠게 되었다.  </p>
				<p>주세법에 청주는</p>
				<p>1) 곡류 중 쌀(찹쌀을 포함한다), 국(麴) 및 물을 원료로 하여 발효시킨 술덧을 여과하여 제성한 것 또는 그 발효·제성 과정에 대통령령으로 정하는 재료를 첨가한 것. </p>
				<p>2) 1)에 따른 주류의 발효·제성 과정에 대통령령으로 정하는 주류 또는 재료를 혼합하거나 첨가하여 여과하여 제성한 것으로서 </p>
				<p>알코올분 도수가 대통령령으로 정하는 도수 범위 내인 것’으로 규정하고 있다. </p>
				<p>그리고 원료의 사용에서 청주는 ‘전분질 원료의 합계 중량을 기준으로 하여 누룩을 100분의 1미만으로 사용하여야 한다’고 규정하고 있다.</p>
				

			</div>
			<div class="section_top_2">
				<div class="section_top_2_1">
					<img alt=""
						src="${pageContext.request.contextPath}/images/alchol_img/chungju_top.jpg"
						class="section_top_2_img">
				</div>
			</div>
		</div>
		<div class="section_middle">
			<div class="section_middle_1">
				<img alt=""
					src="${pageContext.request.contextPath}/images/alchol_img/yakju_middle.jpg"
					class="section_middle_1_img">
			</div>
			<div class="section_middle_2">
				<h2>한국의 다양한 청주들</h2>
				<br> <br> <br> <br>
				<p>청주는 탁주의 상대적인 말로, 본래 맑은 술을 뜻한다.</p>
				<div class="section_middle_inner">

					
					<h1><a href="alcholList_2.alchol?type=청주">전통 청주 알아보기 &emsp;&emsp;></a></h1>
				</div>
			</div>
		</div>
		


	</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>