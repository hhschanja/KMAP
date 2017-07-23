<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">
section {
	width: 60%;
	margin: 0 auto;
	height: 500px;
}
.find_box{
	width : 80%;
	margin: 0 auto;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
	<h1>비밀번호 찾기</h1>
	<img alt="" src="../images/common/bar.png">
	<div class="find_box">
	<form action="memberUpdatePw.member" method="post" id="frm">
	<input type="hidden" value="${dto.id}" id="id" name="id">
	* 새로운 비밀번호를 입력해 주세요.  비밀번호는 최소 8자 이상, 대소문자는 최소 1자 이상 포함되어야 합니다.<br>
	<hr>
	비밀번호 | <input type="password" name="pw" id="pw" class="form-control">
	비밀번호 확인 | <input type="password" name="pw_check" id="pw_check" class="form-control"><br>
	<input type="button" class="form-control" value="확인" id="updatePw_btn"> 
	</form>
	</div>
</section>
<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
	$("#updatePw_btn").click(function() {
		var pw = $("#pw").val();
		var pwc = $("#pw_check").val();
		
		if(pw == pwc){
			frm.submit();			
		}else {
			alert("입력하신 비밀번호가 일치하지 않습니다.");
		}
	});
</script>
</body>
</html>