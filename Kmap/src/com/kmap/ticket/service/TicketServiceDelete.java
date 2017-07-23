package com.kmap.ticket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.ticket.TicketDAO;
import com.kmap.upload.AdminUploadDAO;

public class TicketServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		TicketDAO ticketDAO = new TicketDAO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		int tnum = 0;
		String fname = null;
		int result = 0;
		
		try{
			tnum = Integer.parseInt(request.getParameter("tnum"));
			fname = request.getParameter("fname");
			result = ticketDAO.delete(tnum);
			if(!(fname.equals(""))){
				result = result * adminUploadDAO.uploadDelete(fname);
			}
		}catch(Exception e){
			
		}
		if(result > 0){
			 actionForward.setCheck(false);
			 actionForward.setPath("ticketList.ticket");
			 
		 }
		else{
			 actionForward.setCheck(true);
			 actionForward.setPath("../common/result.jsp");
			 request.setAttribute("message", "실패");
			 request.setAttribute("path", "./ticketList.ticket");
		 }
		
		return actionForward;
	}

}
