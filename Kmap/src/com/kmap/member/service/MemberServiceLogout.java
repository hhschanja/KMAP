package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;

public class MemberServiceLogout implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return this.logout(request, response);
	}
	private ActionForward logout(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		request.getSession().invalidate();
		System.out.println("로그아웃했어! 걱정마");
		actionForward.setPath("../index.jsp");
		actionForward.setCheck(false);
		return actionForward;
		
		
	}
}
