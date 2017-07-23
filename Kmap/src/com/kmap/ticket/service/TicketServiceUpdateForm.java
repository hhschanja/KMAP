package com.kmap.ticket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.alchol.AlcholDTO;
import com.kmap.ticket.TicketDAO;
import com.kmap.ticket.TicketDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class TicketServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		TicketDTO ticketDTO = new TicketDTO();
		TicketDAO ticketDAO = new TicketDAO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
		int tnum = 0;
		try{
			tnum = Integer.parseInt(request.getParameter("tnum"));
			ticketDTO = (TicketDTO)ticketDAO.view(tnum);
			adminUploadDTO = (adminUploadDAO.list(tnum, "ticket")).get(0);
		}catch(Exception e){
			
		}
		request.setAttribute("ticket", ticketDTO);
		actionForward.setCheck(true);
		actionForward.setPath("ticketUpdateForm.jsp?tnum="+tnum);
		request.setAttribute("upload", adminUploadDTO);
		
		return actionForward;
	}

}
