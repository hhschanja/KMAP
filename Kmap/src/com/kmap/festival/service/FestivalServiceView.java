package com.kmap.festival.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.festival.FestivalDAO;
import com.kmap.festival.FestivalDTO;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class FestivalServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FestivalDAO festivalDAO = new FestivalDAO();
		FestivalDTO festivalDTO = new FestivalDTO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar = null;
		int num = 0;
		try{
		num = Integer.parseInt(request.getParameter("num"));
		adminUploadDTO = (adminUploadDAO.list(num, "festival")).get(0);
		rdto.setType_num(num);
		rdto.setType(request.getParameter("type"));
		ar = rdao.replyList(rdto);
		}catch(Exception e){
			
		}
		festivalDTO = festivalDAO.view(num);
		if(festivalDTO!=null){
			request.setAttribute("festival", festivalDTO);
			request.setAttribute("upload", adminUploadDTO);
			request.setAttribute("reply", ar);
			actionForward.setCheck(true);
			actionForward.setPath("festivalView.jsp?num="+num+"&type=festival");
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "ERROR");
			request.setAttribute("path", "../index.jsp");
		}
		return actionForward;
	}

}
