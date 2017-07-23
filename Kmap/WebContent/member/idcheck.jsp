<%@page import="com.kmap.member.MemberDAO"%>
<%@page import="com.kmap.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script><!-- 제이쿼리 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootStrap.jsp"/>
<title>중복검사</title>
<style type="text/css">

.form-control{
width: 200px;

}
h2 {
	text-align : center;
	width : 90%;
	margin: 0 auto;
	margin-top: 20%;
}
#btn3{
	visibility: hidden;
}
.form-control {
	display: inline;
}
#frm{
	width: 80%;
	margin: 0 auto;
}

</style>
</head>
<body>
<section>
<h2>중복확인</h2>
<br>
<form id="frm" name="frm" action="./memberIdcheck.member">
아이디 | <input type="text" id="id" name="id" value="${id}" class="form-control" style="width:120px;" >
<input type="button" id="btn" value="중복확인" class="form-control" style="width:80px; text-align: center;">
<input type="button" id="btn3" value="사용하기" class="form-control" style="width:80px; text-align: center;">

<div id="ment">

</div>

</form>
</section>
</body>
<script type="text/javascript">

	
	var openId = opener.frm.id;
	var openIdck = opener.frm.idck;
	var btn3 = document.getElementById("btn3");
	
	$('#btn3').click(function() { //사용하기 버튼 눌렀을때
		var id = $('#id').val();
		if(id==""){
			alert("아이디를 입력해주세요");
		}else{
			openId.value = id;
			openIdck.value = 'yes';
			self.close();	
		}
	});
	
	$('#id').change(function() {
		btn3.style.visibility="hidden";
		$('#ment').html('중복확인을 해주세요');
	});
	
	$('#btn').click(function() { //아이디가 중복이어서 다시 또 중복확인 할 때
		$("#frm").submit();
	});
	
	var result = ${status==1};
	if(result){
		$('#ment').html('이미 사용중인 아이디입니다.');
	}else{
		$('#ment').html('사용 가능한 아이디입니다.');
		btn3.style.visibility="visible";
	}

	
</script>

</html>