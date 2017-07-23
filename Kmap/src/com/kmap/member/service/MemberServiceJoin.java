package com.kmap.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceJoin implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return this.join(request, response);
	}
	private ActionForward join(HttpServletRequest request, HttpServletResponse response){
		ActionForward actionForward = new ActionForward();
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		int result = 0;
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setPwq(request.getParameter("pwq"));
		memberDTO.setPwa(request.getParameter("pwa"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setAddress_num(Integer.parseInt(request.getParameter("address_num")));
		memberDTO.setAddress_main(request.getParameter("address_main"));
		memberDTO.setAddress_detail(request.getParameter("address_detail"));
		memberDTO.setPhone_kind(request.getParameter("phone_kind"));
		memberDTO.setPhone_1(request.getParameter("phone_1"));
		memberDTO.setPhone_2(request.getParameter("phone_2"));
		memberDTO.setPhone_3(request.getParameter("phone_3"));
		memberDTO.setEmail_id(request.getParameter("email_id"));
		memberDTO.setEmail_site(request.getParameter("email_site"));
		memberDTO.setBirth_year(request.getParameter("birth_year"));
		memberDTO.setBirth_month(request.getParameter("birth_month"));
		memberDTO.setBirth_day(request.getParameter("birth_day"));
		result = memberDAO.join(memberDTO);
		if(result > 0){
			
			request.setAttribute("message", "환영합니다! "+memberDTO.getName()+"님");
			request.setAttribute("path", "./login.jsp");
			
		}else{
			request.setAttribute("message", "회원가입에 실패하셨습니다.");
			request.setAttribute("path", "../index.jsp");
		}
		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		
		return actionForward;
		
		
	}

}
