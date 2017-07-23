package com.kmap.member.service;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceLogin implements Action {
	
	
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return this.login(request, response);
	}
	private ActionForward login(HttpServletRequest request, HttpServletResponse response){
		ActionForward actionForward = new ActionForward();
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		
		String save = null;
		
		try{
			save = request.getParameter("save");
			if(save!=null){
				Cookie c = new Cookie("saveID", URLEncoder.encode(memberDTO.getId(), "UTF-8"));
				c.setPath("/");
				response.addCookie(c);
			}else {
				Cookie c = new Cookie("saveID", URLEncoder.encode(memberDTO.getId(), "UTF-8"));
				c.setMaxAge(0);
				c.setPath("/");
				response.addCookie(c);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
		memberDTO = memberDAO.login(memberDTO);
		
		if(memberDTO!=null){
			request.getSession().setAttribute("member", memberDTO);
			actionForward.setPath("../index.jsp");
			actionForward.setCheck(false);
			System.out.println("성공했어! 걱정마");
		}else{
			actionForward.setPath("../common/result.jsp");
			actionForward.setCheck(true);
			request.setAttribute("message", "로그인 실패");
			request.setAttribute("path", "./login.jsp");
		}
		return actionForward;
		
		
		
	}

}
