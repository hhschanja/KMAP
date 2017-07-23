<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach items="${upload}" var="U" varStatus="i">
	file : ${U.oname} <span id="${U.fname}" class="del">X</span><br>
	</c:forEach>
	<input type="hidden" id="${list}" class="uploadList">