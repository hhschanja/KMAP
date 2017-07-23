package com.kmap.ticket.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.maker.MakerDAO;
import com.kmap.maker.MakerDTO;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;
import com.kmap.ticket.TicketDAO;
import com.kmap.ticket.TicketDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class TicketServiceView implements Action {
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = new TicketDTO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
		MakerDTO makerDTO = new MakerDTO();
		MakerDAO makerDAO = new MakerDAO();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO >ar = null;
		
		int tnum = 0;

		try{
			tnum = Integer.parseInt(request.getParameter("tnum"));
			adminUploadDTO = (adminUploadDAO.list(tnum, "ticket")).get(0);
			ticketDTO = (TicketDTO)ticketDAO.view(tnum);
			makerDTO = makerDAO.view(ticketDTO.getMaker_num());
			
			rdto.setType_num(tnum);
			rdto.setType(request.getParameter("type"));
			
			ar = rdao.replyList(rdto);
			
		}catch(Exception e){

		}
		if(ticketDTO!=null){
			request.setAttribute("ticket", ticketDTO);
			request.setAttribute("upload", adminUploadDTO);
			request.setAttribute("maker", makerDTO);
			request.setAttribute("reply", ar);
			actionForward.setCheck(true);
			actionForward.setPath("ticketView.jsp?tnum="+tnum+"&type=ticket");
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "실패");
			request.setAttribute("path", "../index.jsp");
		}

		return actionForward;
	}
}
