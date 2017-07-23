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
<title>회원정보 수정</title>
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
width: 180px;
height: 50px;
margin: 0 auto;
font-size: 2.0em;
margin-top: 10px;
font-weight: bolder;
text-align: center;
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
margin-top: 70px;
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
width: 70px;
height: 20px;
margin: 15px auto;
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
회원정보 변경
</div>

</article>
<form name="frm" id="frm" action="./memberUpdate.member" method="post">
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
<input class="tb_input_size pil" type="text" placeholder="영문,숫자만 가능합니다" name="id" id="id" value="${member.id}" readonly="readonly">
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
<select class="tb_input_size pil" name="pwq">
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
<input class="tb_input_size pil" type="text" name="pwa" id="pwa" placeholder="답변을 입력하세요" value="${member.pwa}">
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">이름:</div>
</td>

<td class="tb2">
<div class="tb_input">
<input class="tb_input_size pil" type="text" name="name" id="name" value="${member.name}">
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
<input type="text" class="tb_input_size1" id="sample6_postcode" placeholder="우편번호" name="address_num" readonly="readonly" value="${member.address_num}">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" class="tb_input_size2" id="sample6_address" placeholder="주소" name="address_main" readonly="readonly" value="${member.address_main}">
<c:choose>
<c:when test="${member.address_num==null}">
<input type="text" class="tb_input_size3" id="sample6_address2" placeholder="상세주소" name="address_detail" value="">
</c:when>
<c:otherwise>
<input type="text" class="tb_input_size3" id="sample6_address2" placeholder="상세주소" name="address_detail" value="${member.address_detail}">
</c:otherwise>
</c:choose>

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
<input style="height: 16px;" class="tb_phone pil" type="text" name="phone_2" id="phone_2" value="${member.phone_2}">-<input style="height: 16px;" class="tb_phone" type="text" name="phone_3" id="phone_3" value="${member.phone_3}">
</div>
</td>
</tr>

<tr>
<td class="tb1">
<div class="tb_size">이메일:</div>
</td>

<td class="tb2">
<div class="tb_input">
<input class="tb_email" type="text" name="email_id" id="email_id" value="${member.email_id}">@
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

<div class="login_button">
<div class="login_button_1">
<div class="finish" onclick="go()">수정하기</div>
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
	var pw = $('#pw').val();
	var pwck = $('#pwck').val();
	var pwa = $('#pwa').val();
	var name = $('#name').val();
	var phone_2 = $('#phone_2').val();
	var phone_3 = $('#phone_3').val();
	var address = $('#sample6_postcode').val();
	var email = $('#email_id').val();
	var totalAgree = document.getElementById("totalAgree");
	
	if(pw=="" || pwck=="" ||  pwa=="" || name=="" || phone_2=="" || phone_3=="" || email=="" || checkPw==false){
		check = false;
		
		if(pw==""){
			alert("비밀번호를 입력하세요");
		}
		else if(pwck==""){
			alert("비밀번호를 확인하세요");
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
		else if(checkPw==false){
			alert("비밀번호를 확인하세요");
		}
		
		
	}else{
		check = true;
	}
		if(check && checkPw){
			$('#frm').submit();
		}else{
			
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


//이전의 select 정보 표시하는 스크립트

	 $("select[name=phone_kind] option").each(function(){
	    if($(this).val()=="${member.phone_kind}"){
	      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	    }
	 });
	  
	 $("select[name=phone_1] option").each(function(){
		    if($(this).val()=="${member.phone_1}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	 
	 $("select[name=birth_year] option").each(function(){
		    if($(this).val()=="${member.birth_year}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	 
	 $("select[name=birth_month] option").each(function(){
		    if($(this).val()=="${member.birth_month}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	 
	 $("select[name=birth_day] option").each(function(){
		    if($(this).val()=="${member.birth_day}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	 
	 $("select[name=pwq] option").each(function(){
		    if($(this).val()=="${member.pwq}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	  



</script>
</html>