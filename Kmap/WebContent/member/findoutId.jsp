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
	height : 500px;
	margin: 0 auto;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>

<section>
	<h1>아이디 찾기 결과</h1>
	<div id="findout_id">
		* 찾으신 아이디의 결과는 다음과 같습니다.
		<h2>${dto.id}</h2>
		
	</div>
</section>

<c:import url="../temp/footer.jsp"/>
</body>
</html>