package com.kmap.basket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.basket.BasketDAO;
import com.kmap.member.MemberDTO;
import com.kmap.sale.SaleDTO;
import com.kmap.ticket.TicketDAO;

public class BasketServiceInsert implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		
		BasketDAO bdao = new BasketDAO();
		int result = 0;
		TicketDAO ticketDAO = new TicketDAO();
		String type = "alchol";
		int type_num = 0;
		try {
			String name = request.getParameter("name");
			type_num = Integer.parseInt(request.getParameter("type_num"));
			int count = Integer.parseInt(request.getParameter("count"));
			int price = Integer.parseInt(request.getParameter("price"));
			type = request.getParameter("type");
			SaleDTO sdto = new SaleDTO();
			
			sdto.setType_num(type_num);
			sdto.setName(name);
			sdto.setCount(count);
			sdto.setPrice(price);
			String member_id = ((MemberDTO)(request.getSession().getAttribute("member"))).getId();
			
			
			result = bdao.insert(sdto,member_id);
			if(result>0){
				ticketDAO.purchase(sdto.getType_num(), sdto.getCount());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result>0){
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("message", "장바구니 담기 성공");
			if(type.equals("alchol")){
				request.setAttribute("path", "../alchol/alcholView.alchol?anum="+type_num);		
				
			}else{
				request.setAttribute("path", "../ticket/ticketView.ticket?tnum="+type_num);
				
			}
		}else{
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("message", "장바구니 담기 실패");
			if(type.equals("alchol")){
				request.setAttribute("path", "../alchol/alcholView.alchol?anum="+type_num);		
				
			}else{
				request.setAttribute("path", "../ticket/ticketView.ticket?tnum="+type_num);
				
			}
		}
		
		return af;
	}

}
