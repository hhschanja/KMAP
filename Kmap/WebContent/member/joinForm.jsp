<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/css/basic.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script><!-- 제이쿼리 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 우편번호검색 -->
<title>대동여주도 회원가입</title>
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">

section {
	width: 60%;
	height : 100%;
	margin: 0 auto;
}
.join{
width:300px;
height: 70px;
margin: auto auto;
border-bottom: 2px solid #727272;
border-top: 2px solid #727272;
overflow: hidden;
margin-bottom: 50px;
}
.join_text{
width: 120px;
height: 50px;
margin: 0 auto;
font-size: 2.6em;
margin-top: 10px;
font-weight: bolder;
font-style: inherit;
}

.tb{
width: 700px;
height: 260px;
margin: 0 auto;
}

.tb_up{
height: 20px;
font-size: 1.2em;
font-style: normal;
font-weight: bold;
border-bottom: 3px solid #727272;
}

.tb_size{
width: 150px;
margin-left: 10px;
}

.tb1{
width: 150px;
height: 50px;
font-size: 1.0em;
color: rgb(47, 47, 30);
border-top: 1px solid rgba(93, 93, 60,0.3);
background-color: rgba(128,128,128,0.3);
}

.tb2{
width: 450px;
height: 50px;
border-top: 1px solid rgba(93, 93, 60,0.3);
}

.tb_input{
margin-left: 20px;
font-size: 0.8em;
}

.tb_input_1{
margin-top: 20px;
margin-left: 20px;
font-size: 0.8em;
}

.tb_select{

margin-left: 20px;
font-size: 0.8em;
padding: 10px 0;

}

.tb_input_size{
width:250px;
}

.tb_input_size1{
width:60px;
margin-top: 10px;
}

.tb_input_size2{
width:250px;
margin-top: 10px;
}
.tb_input_size3{
width:250px;
margin-top: 10px;
margin-bottom: 20px;
}
.tb_button{
font-size: 0.7em;
width:80px;
margin-top: 10px;
}

.form-control{
display: inline;
font-size: 1.0em;
}

.tb_phone{
width: 50px;
}

.tb_email{
width: 90px;
}

.tb1_2{
width: 150px;
height: 30px;
font-size: 1.0em;
color: rgb(47, 47, 30);
border-top: 1px solid rgba(93, 93, 60,0.3);
background-color: rgba(128,128,128,0.3);
border-bottom: 3px solid #727272;
}

.tb2_2{
width: 450px;
height: 30px;
border-top: 1px solid rgba(93, 93, 60,0.3);
border-bottom: 3px solid #727272;
}

.art{
width: 600px;
height: 50px;
margin: 0 auto;
overflow: hidden;
margin-top: 50px;
}

.add{
height: 20px;
margin-top: 30px;
font-size: 0.8em;
font-style: normal;
font-weight: bold;
}

.tb_2{
width: 600px;
height: 100px;
margin: 0 auto;
border-top: 3px solid #727272;
}

.art_title1{
width: 800px;
height: 30px;
font-weight: bold;
margin: 0 auto;
margin-top: 80px;
margin-bottom: 0px;
font-size: 1.0em;
border-bottom: 3px solid #727272;
}

.art_title2{
width: 800px;
height: 30px;
font-weight: bold;
margin: 0 auto;
margin-top: 30px;
margin-bottom: 0px;
font-size: 1.0em;
border-bottom: 3px solid #727272;
}

.art_wrap1{
width: 800px;
height: 200px;
background-color: rgb(217, 217, 217);
margin: 0 auto;
overflow: hidden;
margin-top: 0px;
}

.art_wrap2{
width: 800px;
height: 200px;
background-color: rgb(217, 217, 217);
margin: 0 auto;
overflow: hidden;
margin-top: 0px;
}

.art_memo{
width: 740px;
height: 150px;
margin-left: 30px;
margin-top:20px;
}

.art_memo_scrol{
width: 740px;
height: 150px;
font-family: 맑은 고딕;
font-size: 0.9em;
background-color: rgb(242, 242, 242);
border: 1px solid #727272;
overflow: auto;
}

.art_agree{
width: 100%;
height: 30px;
}

.art_float_1{
float:right;
font-size: 0.8em;
margin-right: 20px;
}

.art_float_2{
margin-top: 3px;
float:right;
font-size: 0.9em;
font-weight: bold;
}

.art_float_3{
margin-top:10px;
height: 15px;
display: inline-block;
margin-right: 20px;
}

#check_size{
width: 13px;
height: 13px;
margin-left: 5px;
display: inline;
}

.login_button{
width:410px;
height:50px;
margin: 0 auto;
margin-bottom: 50px;
}

.login_button_1{
width:200px;
height:50px;
background-color: #404040;
float: left;

}

.login_button_2{
width:200px;
height:50px;
margin-left: 10px;
background-color: #404040;
float: left;
}

.finish{
width: 100px;
height: 20px;
margin: 15px 50px;
color: white;
font-size: 1.2em;
}

.finish:HOVER{
cursor: pointer;
}

.finish a{
color: white;
}

.end{
width: 50px;
height: 20px;
margin: 15px 70px;

}

.end a{
color: white;
font-size: 1.2em;
}

.end:HOVER{
cursor: pointer;
}

.total_agree{
width: 800px;
height: 20px;
margin: 0 auto;
margin-bottom: 50px;
text-align: right;
}

.fault{
width: 250px;
height: 20px;
color: red;
}
.suc{
color: green;
}

#demo{
float: left;
margin-bottom: 10px;
}

#demo2{
float: left;
}

#demo3{
float: left;
}

</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>

<section>
<article class="join">
<div class="join_text">
J O I N
</div>

</article>

<form name="frm" id="frm" action="memberJoin.member" method="post">
<table class="tb">

<tr>
<td colspan="2" class="tb_up">기본정보</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">아이디:</div>
</td>

<td class="tb2">
<div class="tb_input_1">
<input class="tb_input_size pil" type="text" placeholder="영문,숫자만 가능합니다" name="id" id="id">
<input style="width: 65px; height: 25px;" type="button" class="form-control" value="중복확인" id="btnId"> <!-- 타입버튼으로 해줘야지 그냥버튼이랑submit은 폼안에있으면 무조건이잖아 -->
<input type="hidden" value="no" name="idck" id="idck">
<div class="fault"></div>
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">비밀번호:</div>
</td>

<td class="tb2">
<div class="tb_input_1">
<input class="tb_input_size pil check" style="font-family: sans-serif;" type="password" name="pw" id="pw" placeholder="대소문자,숫자,특수문자를 사용하세요">
<div class="fault"></div>
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">비밀번호 확인:</div>
</td>

<td class="tb2">
<div class="tb_input_1">
<input class="tb_input_size pil check" style="font-family: sans-serif;" type="password" id="pwck" placeholder="한 번 더 입력하세요">
<div class="fault"></div>
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">비밀번호 확인 질문:</div>
</td>

<td class="tb2">
<div class="tb_input">
<select class="tb_input_size pil" name="pwq" id="pwq">
<option>가장 기억에 남는 장소는?</option>
<option>학창시절 존경하던 선생님은?</option>
<option>가장 처음 여행해 본 곳은?</option>
<option>당신의 좌우명은?</option>
<option>당신이 다니던 초등학교는?</option>
<option>가장 처음으로 받아본 선물은?</option>
</select>
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">비밀번호 확인 답변:</div>
</td>

<td class="tb2">
<div class="tb_input">
<input class="tb_input_size pil" type="text" name="pwa" id="pwa" placeholder="답변을 입력하세요">
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">이름:</div>
</td>

<td class="tb2">
<div class="tb_input">
<input class="tb_input_size pil" type="text" name="name" id="name">
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">주소:</div>
</td>

<td class="tb2">
<div class="tb_input">

<div>
<input type="text" class="tb_input_size1" id="sample6_postcode" placeholder="우편번호" name="address_num" readonly="readonly">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" class="tb_input_size2" id="sample6_address" placeholder="주소" name="address_main" readonly="readonly">
<input type="text" class="tb_input_size3" id="sample6_address2" placeholder="상세주소" name="address_detail">
</div>

</div>




</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">휴대전화:</div>
</td>

<td class="tb2">
<div class="tb_input">
<select name="phone_kind">
<option value="KT">KT</option>
<option value="SKT">SKT</option>
<option value="LGT">LGT</option>
</select>
<select name="phone_1">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="018">018</option>
	<option value="019">019</option>
</select>-
<input style="height: 16px;" class="tb_phone pil" type="text" name="phone_2" id="phone_2">-<input style="height: 16px;" class="tb_phone" type="text" name="phone_3" id="phone_3">
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">이메일:</div>
</td>

<td class="tb2">
<div class="tb_input">
<input class="tb_email" type="text" name="email_id" id="email_id">@
<select name="email_site">
<option value="hanmail.net">hanmail.net</option>
<option value="naver.com">naver.com</option>
<option value="empal.com">empal.com</option>
<option value="nate.com">nate.com</option>
<option value="google.com">google.com</option>
</select>
</div>
</td>
</tr>
<tr>

<td class="tb1_2"><div class="tb_size">생년월일:</div></td>
<td class="tb2_2">
<div class="tb_select">
<div id="demo">

</div>
<div id="demo3">
	<select name="birth_month">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	</select>월
</div>
<div id="demo2">

</div>
</div>


</tr>

</table>



<article class="art_title1">
<div class="art_title_1">
[이용약관 동의]
</div>
</article>

<section class="art_wrap1">

<article class="art_memo">
<div class="art_memo_scrol">
제1조(목적)<br>
이 약관은 스펠링(Spelling) 회사(전자상거래 사업자)가 운영하는 스펠링(Spelling)  사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다.<br>
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br>
 <br>
제2조(정의)<br>
①“몰” 이란 스펠링(Spelling)  회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
 <br>
②“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
 <br>
③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
 <br>
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br>
 <br>
제3조 (약관등의 명시와 설명 및 개정) <br>
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호,전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 스펠링(Spelling) 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
 <br>
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회,배송책임,환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
 <br>
③ “몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
 <br>
④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.<br>
다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
 <br>
⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
 <br>
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.<br>
 <br>
제4조(서비스의 제공 및 변경) <br>
① “몰”은 다음과 같은 업무를 수행합니다.<br>
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
2. 구매계약이 체결된 재화 또는 용역의 배송<br>
3. 기타 “몰”이 정하는 업무<br>
 <br>
②“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>
 <br>
③“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>
 <br>
④전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
 <br>
제5조(서비스의 중단) <br>
① “몰”은 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
 <br>
②“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
 <br>
③사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br>
 <br>
제6조(회원가입) <br>
① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
 
② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.

1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.

2. 등록 내용에 허위, 기재누락, 오기가 있는 경우

3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
 
③ 회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
 
④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.
 
제7조(회원 탈퇴 및 자격 상실 등) 
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
 
② 회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.

1. 가입 신청시에 허위 내용을 등록한 경우

2. “몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우

3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우

4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
 
③ “몰”이 회원 자격을 제한?정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
 
④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
 
제8조(회원에 대한 통지)
① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
 
② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
 
제9조(구매신청)
“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.

1. 재화등의 검색 및 선택
2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료,설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
6. 결제방법의 선택
 
제10조 (계약의 성립)
① “몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.

1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우
 
② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
 
③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을 포함하여야 합니다.
 
제11조(지급방법)
“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.

1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 온라인무통장입금
4. 전자화폐에 의한 결제
5. 수령시 대금지급
6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 
8. 기타 전자적 지급 방법에 의한 대금 지급 등
 
제12조(수신확인통지,구매신청 변경 및 취소)
① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
</div>
</article>

<article class="art_agree">

<div class="art_float_1">

<div class="art_float_3">
이용약관에 동의하십니까?
</div>
<div class="art_float_2">
동의함<div id="check_size"><input type="checkbox" name="agree" onclick="go2()"></div>
</div>

</div>

</article>

</section>

<article class="art_title2">
<div class="art_title2">
[개인정보 수집 및 이용 동의]
</div>
</article>

<section class="art_wrap2">

<article class="art_memo">
<div class="art_memo_scrol">
 '스펠링'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br>
회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br><br>
■ 수집하는 개인정보 항목<br>
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 주민등록번호 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록<br>
ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식<br><br>
■ 개인정보의 수집 및 이용목적<br>
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송<br>
ο 회원 관리<br>
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용<br>
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br>
■ 개인정보의 보유 및 이용기간<br>
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.<br>
■ 개인정보의 파기절차 및 방법<br>
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br>
ο 파기절차<br>
회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.
별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
ο 파기방법
- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
■ 개인정보 제공
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
- 이용자들이 사전에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
■ 수집한 개인정보의 위탁
회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.
■ 이용자 및 법정대리인의 권리와 그 행사방법
이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니 다.
이용자 혹은 만 14세 미만 아동의 개인정보 조회?수정을 위해서는 ‘개인정보변 경’(또는 ‘회원정보수정’ 등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭 하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조 치하겠습니다.
귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까 지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
oo는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “oo 가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
</div>
</article>

<article class="art_agree">

<div class="art_float_1">

<div class="art_float_3">
개인정보 수집 및 이용에 동의하십니까?
</div>
<div class="art_float_2">
동의함
<div id="check_size"><input style="margin-top: 5px;" type="checkbox" name="agree" onclick="go2()"></div>
</div>
</div>
</article>
</section>

<div class="total_agree">
전체동의<div id="check_size"><input type="checkbox" id="totalAgree"></div>
</div>

<div class="login_button">
<div class="login_button_1">
<div class="finish" onclick="go()">회원가입하기</div>
</div>
<div class="login_button_2">
<div class="end"><a href="../index.jsp">나가기</a></div>
</div>
</div>
</form>
</section>

	
<c:import url="../temp/footer.jsp"/>
</body>
<script type="text/javascript">

var d = new Date();
var demo = document.getElementById("demo");
var year = '<select name="birth_year">';

	for(var i=1910;i<=d.getFullYear()-20;i++){
		year = year + '<option value="'+i+'">'+i+"</option>";
	}
demo.innerHTML = year + "</select>년";


var demo2 = document.getElementById("demo2");
var day = '<select name="birth_day">';

	for(var j=1;j<=31;j++){
		day = day + '<option value="'+j+'">'+j+"</option>";
	}
demo2.innerHTML = day + "</select>일";


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}


var agree = document.getElementsByName("agree");
var fault = document.getElementsByClassName("fault");

var check = false;
var checkPw = false;
var checkId = false;

function go() {
	var id = $('#id').val();
	var idck = $('#idck').val();
	var pw = $('#pw').val();
	var pwck = $('#pwck').val();
	var pwa = $('#pwa').val();
	var name = $('#name').val();
	var phone_2 = $('#phone_2').val();
	var phone_3 = $('#phone_3').val();
	var address = $('#sample6_postcode').val();
	var email = $('#email_id').val();
	var totalAgree = document.getElementById("totalAgree");
	
	if(id=="" || idck=="no" || pw=="" ||  pwa=="" || name=="" || phone_2=="" || phone_3=="" || email=="" || totalAgree.checked==false || checkPw==false){
		check = false;
		
		if(id==""){
			alert("아이디를 입력하세요");
		}
		else if(idck=="no"){
			alert("중복확인을 해주세요");
		}
		else if(pw==""){
			alert("비밀번호를 입력하세요");
		}
		else if(pwa==""){
			alert("질문의 답을 입력하세요");
		}
		else if(name==""){
			alert("이름을 입력하세요");
		}
		else if(address==""){
			alert("주소를 입력하세요");
		}
		else if(phone_2==""){
			alert("핸드폰 번호를 입력하세요");
		}
		else if(phone_3==""){
			alert("핸드폰 번호를 입력하세요");
		}
		else if(email==""){
			alert("이메일을 입력하세요");
		}
		else if(totalAgree.checked==false){
			alert("약관에 동의하세요");
		}
		else if(checkPw==false){
			alert("비밀번호를 확인하세요");
		}
		
		
	}else{
		check = true;
	}
		if(check && checkPw && idck=="yes"){
			$('#frm').submit();
		}else{
			
		}
	
	}

totalAgree.addEventListener("click", function() {
	for(var i=0;i<agree.length;i++){
		agree[i].checked = totalAgree.checked;
	}
});

function go2() {
		if(agree[0].checked && agree[1].checked){
			totalAgree.checked = true;
		}else{
			totalAgree.checked = false;
		}
}


$('#pwck').blur(function() {
	
	var pw = $('#pw').val();
	var pwck = $('#pwck').val();
	
	if(pw==pwck){
		fault[2].innerHTML = '<div class="suc">비밀번호가 일치합니다</div>';
		checkPw = true;
	}else if(pw=="" || pwck==""){
		fault[2].innerHTML = "<div>비밀번호를 입력하세요</div>";
		checkPw = false;
	}else{
		fault[2].innerHTML = '<div>비밀번호가 일치하지 않습니다.</div>';
		checkPw = false;
	}
	
});

$('#pw').change(function() {
	
	var pw = $('#pw').val();
	var pwck = $('#pwck').val();
	
	if(pw==pwck){
		fault[2].innerHTML = '<div class="suc">비밀번호가 일치합니다</div>';
		checkPw = true;
	}else if(pw=="" || pwck==""){
		fault[2].innerHTML = "<div>비밀번호를 입력하세요</div>";
		checkPw = false;
	}else{
		fault[2].innerHTML = '<div>비밀번호가 일치하지 않습니다.</div>';
		checkPw = false;
	}	
	
});
	
	

$('#pw').blur(function() {
	
	var pw = $('#pw').val();
	var pwck = $('#pwck').val();
	
	var a = /[a-z]/;
	var b = /[0-9]/;
	var c = /[A-Z]/;
	
	if(a.test(pw)==false || b.test(pw)==false || c.test(pw)==false || pw.length<8){
		fault[1].innerHTML = '<div>8자리 이상,대소문자,숫자 조합</div>';
		checkPw=false;
	}else{
		fault[1].innerHTML = '<div class="suc">사용하실 수 있습니다</div>';
		
		if(checkPw==false){
			if(pw==pwck){
				fault[2].innerHTML = '<div class="suc">비밀번호가 일치합니다</div>';
				checkPw = true;
			}else if(pw=="" || pwck==""){
				fault[2].innerHTML = "<div>비밀번호를 입력하세요</div>";
				checkPw = false;
			}else{
				fault[2].innerHTML = '<div>비밀번호가 일치하지 않습니다.</div>';
				checkPw = false;
			}
		}
		
	}

});


$('#btnId').click(function() {
	var id = $('#id').val();
	
	if(id==""){
		alert("아이디를 입력하세요");
	}else{
		window.open('./memberIdcheck.member?id='+id, "idcheck", "width=450, height=300, top=200, left=200");		
	}

});

$('#id').change(function() {
	$('#idck').val("no");
});


</script>
</html>