package com.kmap.reply.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;

public class ReplyServiceUpdateFormAlchol implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = null;
		int num = 0;
		try{
			num = Integer.parseInt(request.getParameter("id"));
			
			rdto = rdao.replyView(num);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		if(rdto!=null){
			request.setAttribute("reply", rdto);
			actionForward.setCheck(true);
			actionForward.setPath("replyUpdateForm.jsp?num="+num);
		}else {
			request.setAttribute("message", "no data");
			request.setAttribute("path", "alcholList.alchol");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		
		
		
		return actionForward;
	}

}
