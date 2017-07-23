package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceFindPw implements Action {


	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		try{
		mdto.setId(request.getParameter("id"));
		mdto.setName(request.getParameter("name"));
		mdto.setEmail_id(request.getParameter("email_id"));
		mdto.setEmail_site(request.getParameter("email_site"));
		mdto = mdao.findPw(mdto);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(mdto!=null){
			request.setAttribute("dto", mdto);
			actionForward.setCheck(true);
			actionForward.setPath("./informationCheck.jsp");
		}else {
			request.setAttribute("message", "일치하는 정보가 없습니다.");
			request.setAttribute("path", "./login.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		return actionForward;
	}

}
