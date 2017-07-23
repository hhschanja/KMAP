package com.kmap.freeboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.freeboard.FreeboardDAO;
import com.kmap.reply.ReplyDAO;
import com.kmap.upload.UploadDAO;

public class FreeboardServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		ReplyDAO rdao = new ReplyDAO();
		UploadDAO udao = new UploadDAO();
		int result = 0;
		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			String board_type = request.getParameter("board_type");
			System.out.println("num"+num);
			System.out.println("dfafdsafasdfasdfdsaf");
			udao.uploadDelete(num, board_type);
			rdao.replyDelete(num);
			result = fdao.delete(num);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "삭제하였습니다.");
		}else {
			request.setAttribute("message", "실패하였습니다.");
		}
		request.setAttribute("path", "freeboardList.freeboard");
		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		
		
		
		return actionForward;
	}

}
