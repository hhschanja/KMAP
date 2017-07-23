package com.kmap.freeboard.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kmap.action.Action;
import com.kmap.action.ActionForward;

import com.kmap.freeboard.FreeboardDAO;
import com.kmap.freeboard.FreeboardDTO;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;
import com.kmap.upload.UploadDAO;
import com.kmap.upload.UploadDTO;

public class FreeboardServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		FreeboardDTO fdto = new FreeboardDTO();
		UploadDAO udao = new UploadDAO();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> rar = null;
		List<UploadDTO> ar = null;
		
		int type_num = Integer.parseInt(request.getParameter("num"));
		
		
		try{
			
			rdto.setType_num(type_num);
			rdto.setType(request.getParameter("type"));
			
			fdto = (FreeboardDTO) fdao.view(type_num);
			rar = rdao.replyList(rdto);
			ar = udao.list(type_num, "freeboard");
		} catch (Exception e ){
			e.printStackTrace();
		}
		if(fdto!=null){
			request.setAttribute("board", "freeboard");
			request.setAttribute("boardList", fdto);
			request.setAttribute("files", ar);
			request.setAttribute("reply", rar);
			request.setAttribute("count", ar.size());
			actionForward.setCheck(true);
			actionForward.setPath("./freeboardView.jsp?num="+type_num);
		} else {
			request.setAttribute("message", "접근권한이 없습니다.");
			request.setAttribute("path", "./freeboardList.freeboard");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		
		return actionForward;
	}

}
