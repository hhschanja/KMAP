<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.admin {
	font-weight: bolder;
	font-size: 3em;
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
    font-family:  sans-serif;
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
	
</style>
<title>관리자 로그인</title>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
<div class="login">
<div class="login_Wrap">
<h1 class="head admin">ADMIN</h1>
<div class="login_Input">
<form action="adminLogin.admin" method="post"  id="frm">
<input type="text" name="id" id="id" class="form-control input" placeholder="아이디">
<input type="password" name="pw" id="pw" class="form-control input" placeholder="비밀번호">
<br>
<input type="submit" value="로그인" id="login_btn" class="form-control">
</form>
<div class="login_footer">
<img alt="" src="../images/common/bar2.png">
</div>
</div>
</div>
</div>
</section>
<c:import url="../temp/footer.jsp"/>
</body>
</html>