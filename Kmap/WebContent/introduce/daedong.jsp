<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대동여주도</title>
<c:import url="../temp/bootStrap.jsp"/>
<style type="text/css">
body {
	background-image: url("../images/common/reply.jpg");
	background-repeat: repeat;
}
section {
	width: 90%;
	height : 500px;
	margin-left: 7%;
	
}
#boardWrap > img {
width : 100%;
margin : 0 auto;
}
	
</style>
</head>
<body>
<c:import url="../temp/header.jsp"/>
<section>
<div id="boardWrap">
<img alt="" src="../images/introduce/기업소개.PNG">
</div>
</section>



<c:import url="../temp/footer.jsp"/>

</body>
</html>