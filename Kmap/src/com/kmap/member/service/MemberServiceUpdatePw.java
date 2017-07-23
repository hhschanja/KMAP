package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceUpdatePw implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		int result = 0;
		try{
		String pw = request.getParameter("pw");
		String id = request.getParameter("id");		
		result = mdao.updatPw(id, pw);
		
		} catch(Exception e){
			e.printStackTrace();		
		}
		if(result>0){
			request.setAttribute("message", "비밀번호가 성공적으로 변경 되었습니다. 변경된 비밀번호로 다시 로그인 해주세요");
		}else {
			request.setAttribute("message", "비밀번호 변경에 실패하였습니다.");
		}
		request.setAttribute("path", "../index.jsp" );
		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		
		
		return  actionForward;
	}

}
