<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>우리술 대잔치</title>
<style type="text/css">
/* =============SECTION start============= */
section {
	width: 70%;
	height : 700px;
	margin: 0 auto;
}
map:HOVER{
		width: 100%;
		height : 100%;
		background-color: red;
}
.mapTotal{
width: 100%;
height: 448px;
margin-top: 5%;
}
.mapSect01{
width: 35%;
height: 448px;
float: left;
}
.mapSearch{
width: 640px;
height: 400px;
float: left;
}
#s{
width: 100%;
height: 40%;
}
.realSearch{
width: 100%;
height: 70%;
margin: 0 auto;
border: 2px #e6e6e6 solid;
}
#s1{
width: 100px;
float: left;
margin-left: 10%;
margin-top: 5%;
}
#s2{
width: 220px;
float: left;
margin-left: 10px;
margin-top: 5%;
}
#s3{
width: 100px;
float: left;
margin-top: 5%;
}
#s4{
width: 100px;
float: left;
margin-top: 5%;
margin-left: 3%;
}
#s4 a{
font-weight:bold;
color: black;
text-decoration: none;
}
#result{
width: 100%;
height: 400px;
margin-top: 0px;
border: 2px #e6e6e6 solid;
}
#list{
width: 200px;
height: 80%;
border-bottom: 2px solid black;
margin-top:5px;
overflow:hidden;
display: inline-block;
margin-left: 1%;
}
#list_photo{
width:100%;;
height:60%;
}
#list_contents{
width:100%;
height:40%;
}
#list_contents a{
text-align:center;
color: black;
}
#list_contents_1{
font-size: 1.6em;
font-weight: bolder;
margin-top: 5%;
}
#list_contents_2{
width: 100%;
height: 50%;
font-size: 1.0em;
font-weight:bold;
margin-top: 10%;
}
#pager{
width: 100%;
margin-bottom: 0px;
}
#pagination{
width: 30%;
margin-top: 3%;
margin-left: 80%;
}
#pagination a{
color: black;
}
.btn{
color: #737373;
}
.btn:HOVER{
cursor: pointer;
color: white;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
<div class="mapTotal">
<div class="mapSect01">
		<div class="mapWrap">
		
			<img src="../images/festival/country_map_00.jpg" usemap="#countryMap"
				alt="전국맵">
				
			<map name="countryMap" id="countryMap">
			
				<area shape="poly"
					coords="124,117,132,125,145,124,153,125,155,117,149,112,151,103,133,109,124,118"
					href="#" alt="서울" onclick="setArea('11');"  class="kor" title="서울">
					
				<area shape="poly"
					coords="94,127,102,128,108,120,114,126,121,128,125,124,125,116,117,112,108,116,101,118,89,124,91,126"
					href="#" alt="인천" onclick="setArea('28');"class="kor" title="인천">
				<area shape="poly"
					coords="165,234,169,228,173,236,176,236,179,224,178,217,169,214,161,221,161,231"
					href="#" alt="대전" onclick="setArea('30');"class="kor" title="대전">
				<area shape="poly"
					coords="250,265,253,269,251,276,253,281,249,284,252,289,258,286,261,280,267,281,270,273,276,268,273,263,273,256,267,257,261,264,258,267,250,262"
					href="#" alt="대구" onclick="setArea('27');"class="kor" title="대구">
				<area shape="poly"
					coords="283,331,292,335,302,330,309,327,314,314,318,307,305,310,302,314,295,319,295,326,284,326"
					href="#" alt="부산" onclick="setArea('26');"class="kor" title="부산">
				<area shape="poly"
					coords="296,295,303,294,307,302,311,303,319,308,326,295,322,286,311,282,300,280,299,287,297,292"
					href="#" alt="울산" onclick="setArea('31');"class="kor" title="울산">
				<area shape="poly"
					coords="116,329,126,334,127,336,133,336,142,331,138,321,136,322,129,325,124,325,113,328"
					href="#" alt="광주" onclick="setArea('29');"class="kor" title="광주">
				<area shape="poly"
					coords="107,110,120,110,128,113,138,107,149,103,153,110,156,118,151,126,143,128,137,126,128,124,126,120,125,126,122,134,117,136,129,138,125,144,116,138,116,151,125,149,126,151,123,157,133,171,151,173,160,175,180,165,196,152,203,131,203,118,181,111,182,103,182,93,189,90,178,73,161,68,146,60,127,68,121,79,114,89,108,96,104,108"
					href="#" alt="경기" onclick="setArea('41');"class="kor" title="경기">
				<area shape="poly"
					coords="143,61,143,62,151,63,153,69,165,62,164,69,178,69,181,78,191,86,184,96,183,109,206,117,203,125,204,150,211,150,218,145,225,149,240,145,240,153,252,155,276,162,310,162,321,145,246,21,240,19,245,28,234,44,202,48,158,48,141,57"
					href="#" alt="강원" onclick="setArea('42');"class="kor" title="강원">
				<area shape="poly"
					coords="321,152,325,159,331,186,324,201,328,211,321,223,327,243,322,251,331,256,337,247,336,262,327,288,318,286,310,280,301,284,292,290,277,297,269,291,262,284,268,282,278,273,278,266,274,257,267,255,260,261,249,263,252,273,252,282,251,286,237,286,223,267,212,259,213,249,219,239,220,231,212,231,209,229,209,222,206,209,209,198,212,198,216,192,223,193,225,185,238,181,247,181,253,175,264,162,272,162,284,161,302,163,314,161,318,157"
					href="#" alt="경북" onclick="setArea('47');"class="kor" title="경북">
				<area shape="poly"
					coords="212,266,222,271,233,274,233,283,238,290,251,290,255,295,262,290,269,296,278,294,290,288,296,292,302,303,311,305,303,316,294,323,288,324,282,332,267,331,263,326,266,321,254,328,259,333,248,340,257,340,254,344,250,353,241,345,230,349,222,347,222,333,215,339,207,345,191,325,192,313,199,309,193,289,197,276,213,264"
					href="#" alt="경남" onclick="setArea('48');"class="kor" title="경남">
				<area shape="poly"
					coords="109,257,111,257,117,263,121,267,117,272,110,281,103,284,102,290,110,288,121,297,104,296,103,302,107,313,121,311,130,300,140,303,148,302,152,310,162,313,169,313,181,313,189,317,194,309,188,292,199,270,212,263,208,252,192,254,173,254,163,244,155,247,149,246,142,241,139,240,133,241,129,250,121,251,114,254"
					href="#" alt="전북" onclick="setArea('45');"class="kor" title="전북">
				<area shape="poly"
					coords="92,321,96,328,100,334,95,341,98,353,94,360,98,364,107,366,113,375,107,375,102,371,101,379,93,375,89,366,87,363,86,375,95,380,99,382,102,389,108,402,114,401,118,390,123,388,132,388,140,388,142,377,154,382,169,388,179,379,187,372,199,360,188,350,187,345,196,345,201,339,189,329,189,318,180,312,169,315,151,314,148,306,142,310,135,302,129,304,124,311,112,314,103,314,103,303,99,307,89,314"
					href="#" alt="전남" onclick="setArea('46');"class="kor" title="전남">
				<area shape="poly"
					coords="211,248,200,251,189,250,185,238,179,232,183,219,174,211,167,206,163,197,168,188,175,185,165,173,174,171,194,156,201,148,212,155,216,148,224,149,240,149,239,154,245,156,252,160,268,160,249,173,249,185,243,182,236,174,230,184,202,201,205,210,206,219,206,226,205,229,217,236,214,240,214,247"
					href="#" alt="충북" onclick="setArea('43');"class="kor" title="충북">
				<area shape="poly"
					coords="82,174,89,173,87,183,93,175,99,170,93,163,98,163,104,162,107,155,118,159,122,165,126,171,134,173,145,173,153,171,163,179,168,185,161,195,164,203,168,208,167,215,161,219,161,231,172,233,174,235,183,238,187,251,188,255,181,252,172,253,167,242,158,241,147,243,144,238,135,236,128,243,121,251,115,250,114,241,105,238,106,229,107,224,104,213,104,206,98,196,91,195,77,183"
					href="#" alt="충남" onclick="setArea('44');"class="kor" title="충남">
				<area shape="poly"
					coords="227,405,234,400,235,396,252,390,275,385,282,388,283,399,276,407,262,411,247,414,237,413,227,408"
					href="#" alt="제주" onclick="setArea('50');" class="kor" title="제주">
			</map>
	</div>
</div>


<div class="mapSearch">
<div id="s">
<div class="realSearch">
<div id="s1">
		<div class="col-xs-2">
				<select style="width: 100px;" class="form-control" name="kind" id="kind">
					<option value="">전체</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="부산">부산</option>
					<option value="울산">울산</option>
					<option value="광주">광주</option>
					<option value="강원">강원</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="전북">전북</option>
					<option value="전남">전남</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="제주">제주</option>
				</select>
		</div>
</div>

	<form action="festivalList.festival">
<div id="s2">
			<div class="col-xs-4">
				<input style="width: 200px;" class="form-control" type="text" name="search" id="search">
			</div>
</div>
<div id="s3">
			<div class="col-xs-2">
				<input style="width: 100px; font-weight: bolder;" class="btn" type="submit" value="SEARCH">
			</div>
</div>
<c:if test="${not empty admin}">
<div id="s4">
		<div class="col-xs-2">
			<a href="./festivalInsert.jsp" style="width: 80px;" class="form-control">등록하기</a>
		</div>
</div>
</c:if>

	</form>
</div>
</div>

<div id="result">

<c:forEach items="${festivalList }"  varStatus="i"  var="festival">
	
<div id="list">
	<div id="list_photo">
		<a href="festivalView.festival?num=${festival.num}&type=festival"><img style="width: 100%; height: 100%;" alt="" src="../upload/${files[i.index]}"></a>
	</div>
		
	<div id="list_contents">
		<p id="list_contents_1"><a href="festivalView.festival?num=${festival.num}&type=festival">${festival.name }</a></p>
		<p id="list_contents_2">${festival.start_date} ~ ${festival.last_date}</p>
	</div>

</div>
</c:forEach>
				
<div id="pager">           


<div id="pagination">

<c:if test="${pageResult.curBlock > 1}">
	<span class="block"><a href="./festivalList.festival?curPage=${pageResult.startNum-1}&kind=${param.kind}&search=${param.search}">&lt; Prior</a></span>  
</c:if>

<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="y"> <!-- 이거 page를 num으로 바꿔여해 -->  
    <span><a href="./festivalList.festival?curPage=${y}&kind=${param.kind}&search=${param.search}">${y}</a></span>
</c:forEach>  

<c:if test="${pageResult.curBlock < pageResult.totalBlock}">
	<span class="block"><a href="./festivalList.festival?curPage=${pageResult.lastNum+1}">Next &gt;</a></span>  
</c:if>

</div>
</div>
</div>
</div>
</div>	

</section>
	


<c:import url="../temp/footer.jsp"/>

</body>

<script type="text/javascript">



	$(".kor").click(function() {
		var nn = $(this).attr("title");
		var address = "address";
		$.ajax({
			url : "./festivalMap.festival",
			type : "GET",
			data : {
				search : nn,
				kind : address
				
			},
			success : function(data){
				$("#result").html(data);	
				
				$("select[name=kind] option").each(function(){
				    if($(this).val()==nn){
				      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
				    }
				 });
				
			}
			
		})
		
		
	});
	
	$("#kind").change(function() {
		var address = "address";
		var location = $("#kind option:selected").val();
		
		$.ajax({
			url : "./festivalMap.festival",
			type : "GET",
			data : {
				search : location,
				kind : address
				
			},
			success : function(data){
				$("#result").html(data);
				
				$("select[name=kind] option").each(function(){
				    if($(this).val()==location){
				      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
				    }
				 });
				
			}
			
		})
		
	});
	
	$("select[name=kind] option").each(function(){
		var search = '${param.search}';
	    if($(this).val()==search){
	      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	    }
	 });

	
	
	
	</script>
</html>




