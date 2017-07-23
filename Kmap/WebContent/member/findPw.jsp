<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.form-control {
	width : 150px;
}
#btn {
	float: right;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>

<section>
	<h1>비밀번호 찾기</h1>
	<div class="find_box">
	<table>
	<tr>
		<td>
			아이디 
		</td>
		<td>
		 	| 		
		</td>
		<td>
			<input type="text" id="id" name="id" class="form-control" style="display: inline;">
		</td>
		
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr>
		<td>
		이  름 
		</td>
		<td>
		 | 
		</td>
		<td> 
			<input type="text" id="name" name="name" class="form-control" style="display: inline;">
		</td>
		
	</tr>
	<tr>
		<td><br></td>
	</tr>	
	<tr>
		<td>
			이메일 
		</td>
		<td>
			| 
		</td>
		<td>
			<input type="text" style="width : 100px; display: inline;" name="email_id" id="email_id" class="form-control"> @ <input type="text" style="width : 130px; display: inline;" name="email_site" id="email_site" class="form-control">
		</td>	
	</tr>
	<tr>
		<td><br></td>
	</tr>
	</table>
	<img alt="" src="../images/common/bar.png">
	<input type="button" class="form-control" value="확인" id="btn"> 
	</div>
</section>
<c:import url="../temp/footer.jsp"/>
<script type="text/javascript">
	$("#btn").click(function() {
	var id = $("#id").val();
	var name = $("#name").val();
	var email_id = $("#email_id").val();
	var email_site = $("#email_site").val();
	$.ajax({
		url : "memberFindPw.member",
		type : "POST",
		data : {
			id : id,
			name : name,
			email_id : email_id,
			email_site : email_site
		},
		success : function(data) {
			$(".find_box").html(data);
		}
	})
	});
	
	

</script>
</body>
</html>