package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceUpdateFormPw implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		try {
			mdto.setId(request.getParameter("id"));
			mdto.setPwq(request.getParameter("pwq"));
			mdto.setPwa(request.getParameter("pwa"));		
			mdto = mdao.updateFormPw(mdto);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(mdto!=null){
			request.setAttribute("dto", mdto);
			actionForward.setPath("./updateFormPw.jsp");
		}else {
			request.setAttribute("message", "비밀번호 질문에 대한 답변이 틀렸습니다.");
			request.setAttribute("path", "../login.jsp");
			actionForward.setPath("../common/result.jsp");
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
