package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceIdcheck implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionForward af = new ActionForward();
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		String id = request.getParameter("id");
		
		mdto = mdao.view(id);
		
		if(mdto != null){
			af.setCheck(true);
			af.setPath("./idcheck.jsp");
			request.setAttribute("id", id);
			request.setAttribute("status", 1);
		}else{
			af.setCheck(true);
			af.setPath("./idcheck.jsp");
			request.setAttribute("id", id);
			request.setAttribute("status", 0);
		}
		
		
		
		return af;
	}

}