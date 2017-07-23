<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	<form action="replyUpdate.reply" method="get">
	<input type="hidden" id="updateNum" value="${reply.num}">	
	작성자 : ${reply.writer}
	<input type="text" value="${reply.contents}" id="updateContents">
	작성날짜 : ${reply.reg_date}<br>
	<c:if test="${member.id eq reply.writer }">
	<input type="button" value="OK" id="update" class="form-control" style="width: 120px; text-align: center; float: right;"><br>
	</c:if>
	<c:if test="${admin.id eq reply.writer }">
	<input type="button" value="OK" id="update" class="form-control" style="width: 120px; text-align: center;  float: right;"><br>
	</c:if>
	</form>
	
	
	