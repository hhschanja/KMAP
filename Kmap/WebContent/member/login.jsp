<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Cookie [] cookies = request.getCookies();
	String did = "";
	
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("saveID")){
			did = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
section {
	width:  60%;
	margin: 0 auto;
	height: 600px;
}
.login {
	max-width: 540px;
    margin: 4em auto 0;
    font-size: 1.4em;
}
.login_Wrap{
	width : 80%;
	margin: 0 auto;
}
.head {
	text-align: center;
}
.login_Input{
	padding-top: 20px;
    padding-bottom: 30px;
}
.input{
	height: 50px;
	width : 100%;
    margin-top: 10px;
    transition: width 1.2s;
    font-family: sans-serif;
}
#login_btn {
	display: block;
    width: 100%;
    height: 55px;
    padding-left: 0;
    padding-right: 0;
}
.login_footer {
	width: 80%;
	margin-left: 8%;
}
.login_forget{
	width:  100%;
	height: 50px;
}
.login_forget > a{
	float : right;
	margin-left : 5%;
	text-decoration: none;
	color: black;
}	
</style>
<title>대동여주도 로그인</title>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
<div class="login">
<div class="login_Wrap">
<h1 class="head">로그인</h1>
<div class="login_Input">
<form action="memberLogin.member" method="post"  id="frm">
<input type="text" name="id" id="id" class="form-control input" placeholder="아이디" value="<%=did%>">
<input type="checkbox" id="saveid" name="idChk"><span>아이디저장</span>
<input type="password" name="pw" id="pw" class="form-control input" placeholder="비밀번호">
<br>
<input type="button" value="로그인" id="login_btn" class="form-control">
</form>
<div class="login_footer">
<img alt="" src="../images/common/bar2.png">
</div>
<div class="login_forget">
<a href="./findPw.jsp">비밀번호 찾기</a>
<a href="./findId.jsp">아이디찾기</a>
<a href="./joinForm.jsp">회원가입</a>
</div>
</div>
</div>
</div>
</section>
<c:import url="../temp/footer.jsp"/>
</body>
<script type="text/javascript">


$("#login_btn").click(function() {

	var id = $("#id").val();
	var pw = $("#pw").val();
	
	if(id=="" || pw==""){
		if(id==""){
			alert("아이디를 입력하세요");
		}
		else if(pw==""){
			alert("비밀번호를 입력하세요");
		}
		
	}else{
		
		$('#frm').submit();
		
	}
	
});


</script>
</html>