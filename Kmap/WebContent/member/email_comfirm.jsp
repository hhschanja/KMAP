<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<form action="memberIdView.member" method="post" id="frm">
    		<input type="hidden" value="${authNum}" id="authNum">
    		<p>인증번호 | <input type="text" name="authnum" id="authNum_check">
    		<input type="button" class="btn btn-info" value="확인" id="email_btn"></p>
    		<input type="hidden" value="${dto.name}" name="check_name">
    		<input type="hidden" value="${dto.email_id}" name="check_email_id">
    		<input type="hidden" value="${dto.email_site}" name="check_email_site">
	</form>
    