<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <nav class="navbar2 navbar-inverse">
	</nav>
<footer>
		<div class="foot_wrap">
			<div>
				<img alt="" src="${pageContext.request.contextPath}/images/common/대동여아이콘.png">
			</div>
			<div class="foot_company">
				<p>Korea-Sool Copyright</p><br>
				<p>서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F  KH 정보교육원 |   TEL. 02) 1544-9970</p>
  				<p>© 2017 [NCS]응용SW엔지니어 및 DB 엔지니어 양성과정 | R 클래스 오후반</p>
			</div>			
			<div class="foot_select">
				<p>|&ensp;세미프로젝트&ensp;|&ensp;5조&ensp; <c:if test="${ empty member and empty admin }">| &ensp; <a href="${pageContext.request.contextPath}/admin/login.jsp">ADMIN</a> </c:if>  <c:if test="${empty member and  not empty admin }">| <a href="${pageContext.request.contextPath}/admin/adminLogout.admin"> &ensp;로그아웃</a>&ensp;| 
				<a href="${pageContext.request.contextPath}/refund/refundList.refund">&ensp;관리자 페이지</a></c:if>&ensp; | </p>			
			</div>
		</div>
	</footer>
    