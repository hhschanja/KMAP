<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<form action="memberUpdateFormPw.member" method="post" id="frm">
	<input type="hidden" value="${dto.pwq}" id="pwq" name="pwq">
	<input type="hidden" value="${dto.id}" id="id" name="id">
	질문 |
	<h3> ${dto.pwq} </h3> 
	<p> 답변 |  <input type="text" name="pwa" style="width: 250px;" id="pwa" class="form-control"></p>
	* 회원가입시에 입력했던 답변을 입력해주세요
	<input type="submit" class="form-control" value="확인" id="pw_btn"> 
	</form>
