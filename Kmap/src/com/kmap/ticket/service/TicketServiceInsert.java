package com.kmap.ticket.service;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.ticket.TicketDAO;
import com.kmap.ticket.TicketDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TicketServiceInsert implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = null;
		int result = 0;
		String saveDirectory = request.getServletContext().getRealPath("upload");
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multi = null;
		File fi = new File(saveDirectory);
		if(!fi.exists()){
			fi.mkdirs();
		}
		try{
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			ticketDTO = new TicketDTO();
			ticketDTO.setContents(multi.getParameter("contents"));
			ticketDTO.setCount(Integer.parseInt(multi.getParameter("count")));
			ticketDTO.setLast_month(Date.valueOf(multi.getParameter("last_month")) );
			ticketDTO.setMaker_num(Integer.parseInt(multi.getParameter("maker_num")));
			ticketDTO.setName(multi.getParameter("name"));
			ticketDTO.setPrice(Integer.parseInt(multi.getParameter("price")));
			ticketDTO.setRequired_time(Integer.parseInt(multi.getParameter("required_time")));
			ticketDTO.setStart_month( Date.valueOf(multi.getParameter("start_month")) );
			result = ticketDAO.insert(ticketDTO);

			if(result>0){
			AdminFileUploader adminFileUploader = new AdminFileUploader();
			AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
			ArrayList<AdminUploadDTO> ar = adminFileUploader.upload(multi, ticketDAO.currNum(), "ticket");
			if(ar.get(0).getFname()!=null){
				for(AdminUploadDTO adminUploadDTO : ar){
					adminUploadDAO.uploadInsert(adminUploadDTO);
				}
			}
			}
		}catch(Exception e){
			e.printStackTrace();

		}
		if(result > 0){
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "등록하였습니다.");
			request.setAttribute("path", "ticketList.ticket");

		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "실패하였습니다.");
			request.setAttribute("path", "ticketList.ticket");
		}





		return actionForward;
	}

}
