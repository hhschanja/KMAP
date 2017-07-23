package com.kmap.reply.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;

public class ReplyServiceUpdateFestival implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar = null;
		int result = 0;
		
		try {
			rdto.setNum(Integer.parseInt(request.getParameter("updateNum")));
			rdto.setContents(request.getParameter("updateContents"));
			result = rdao.replyMod(rdto);
			
			rdto.setType(request.getParameter("type"));
			rdto.setType_num(Integer.parseInt(request.getParameter("type_num")));
			ar = rdao.replyList(rdto);
			
		} catch(Exception e){
			e.printStackTrace();
		}
		if(result>0){
			request.setAttribute("reply", ar);
			actionForward.setCheck(true);
			actionForward.setPath("replyFestival.jsp?num"+rdto.getType_num());
		}else {
			request.setAttribute("message", "fail");
			request.setAttribute("path", "festivalList.festival");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		return actionForward;
	}

}
