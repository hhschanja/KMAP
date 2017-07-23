package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceIdView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		try{
			mdto.setName(request.getParameter("check_name"));
			mdto.setEmail_id(request.getParameter("check_email_id"));
			mdto.setEmail_site(request.getParameter("check_email_site"));
			
			mdto = mdao.idView(mdto);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(mdto!=null){
			request.setAttribute("dto", mdto);
			actionForward.setPath("findoutId.jsp");
		}else {
			request.setAttribute("message", "아이디 찾기에 실패하였습니다.");
			request.setAttribute("path", "../index.jsp");
			actionForward.setPath("../common/result.jsp");			
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
