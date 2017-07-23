package com.kmap.reply.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;

public class ReplyServiceWriteFestival implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar = null;
		
		int type_num = Integer.parseInt(request.getParameter("type_num"));
		int result = 0;
		try{
			rdto.setType(request.getParameter("type"));
			rdto.setType_num(type_num);
			rdto.setWriter(request.getParameter("writer"));
			rdto.setContents(request.getParameter("contents"));
			result = rdao.write(rdto);
			
			ar = rdao.replyList(rdto);
					
			

		} catch(Exception e){
			e.printStackTrace();
		}
				
		if(result>0) {
			request.setAttribute("reply", ar);
			actionForward.setPath("replyFestival.jsp?num="+type_num);
		}else {
			request.setAttribute("message", "댓글 작성 실패");
			request.setAttribute("path", "festivalView.festival");
			actionForward.setPath("../common/result.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}
	
}
