package com.kmap.admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.admin.AdminDAO;
import com.kmap.admin.AdminDTO;

public class AdminServiceLogin implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return this.login(request, response);
	}
	private ActionForward login(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AdminDTO adminDTO = new AdminDTO();
		AdminDAO adminDAO = new AdminDAO();
		adminDTO.setId(request.getParameter("id"));
		adminDTO.setPw(request.getParameter("pw"));
		adminDTO = adminDAO.login(adminDTO);
		if(adminDTO!=null){
			request.getSession().setAttribute("admin", adminDTO);
			actionForward.setCheck(false);
			actionForward.setPath("../index.jsp");
			System.out.println("성공했으니 걱정말라 너는 관리자다!");
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "관리자 로그인 실패");
			request.setAttribute("path", "../index.jsp");
			
		}
		return actionForward;
	}

}
