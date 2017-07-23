<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">
section {
	width: 60%;
	margin: 0 auto;
	height: 500px;
	
}
.find_box{
	width: 80%;
	margin: 0 auto;
	padding-top: 20px;
    padding-bottom: 30px;
}
#btn {
	width :150px;
	margin-top: 20px;
 	margin-left: 200px;
}

</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>

<section>
	<h1>아이디 찾기</h1>
	<div class="find_box">
	<table>
	<tr>
		<td>
			이름 | 
		</td>
		<td>
			<input type="text" name="name" id="name" class="form-control" style="width : 150px; display: inline;">
		</td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr>
		<td>
			이메일 |
		</td>
		<td>
			 <input type="text" style="width : 100px; display: inline;" id="email_id" name="email_id" class="form-control"> @ <input type="text" style="width : 130px; display: inline;" id="email_site" name="email_site" class="form-control">
		</td>
	</tr>
	</table>
	<input type="button" class="form-control" value="확인" id="btn"> 
	<img alt="" src="../images/common/bar2.png">

	</div>
	
	<div id="find_id">
	</div>
</section>
<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
	$("#btn").click(function() {
		var name= $("#name").val();
		var email_id = $("#email_id").val();
		var email_site = $("#email_site").val();
		
		$.ajax({
			url : "memberFindId.member",
			type : "POST",
			data : {
				name : name,
				email_id : email_id,
				email_site : email_site
			},
			success : function(data) {
				$("#find_id").html(data);
			}
		});
		alert("해당 이메일로 인증번호를 방송하였습니다. 인증번호를 입력해주세요");
	});
	
	$("#find_id").on("click", "#email_btn", function() {
		var authNum = $("#authNum").val();
		var authNum_check = $("#authNum_check").val();
		
		if(authNum==authNum_check){
			alert("인증되었습니다.");
			$("#frm").submit();
		}else {
			alert("인증 번호가 올바르지 않습니다.");
		} 
	});
	
</script>
</body>
</html>