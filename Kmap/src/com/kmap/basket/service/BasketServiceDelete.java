package com.kmap.basket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.basket.BasketDAO;
import com.kmap.member.MemberDTO;

public class BasketServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = 0;
		BasketDAO basketDAO = new BasketDAO();
		try{
		num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			
		}
		basketDAO.delete(num, ((MemberDTO)request.getSession().getAttribute("member")).getId());
		actionForward.setCheck(true);
		actionForward.setPath("basketList.basket");
		
		return actionForward;
	}

}
