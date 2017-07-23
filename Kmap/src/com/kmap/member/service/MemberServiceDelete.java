package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return this.delete(request, response);
	}
	private ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		MemberDAO memberDAO = new MemberDAO();
		int result = 0;
		result = memberDAO.delete(memberDTO.getId());
		
		if(result > 0){
			request.getSession().invalidate();
			request.setAttribute("message", "회원 탈퇴 하셨습니다.");
			request.setAttribute("path", "../index.jsp");
			
		}else{
			
			request.setAttribute("message", "회원 탈퇴에 실패 하셨습니다.");
			request.setAttribute("path", "../index.jsp");
		}
		actionForward.setPath("../common/result.jsp");
		actionForward.setCheck(true);
		return actionForward;
		
	}

}
