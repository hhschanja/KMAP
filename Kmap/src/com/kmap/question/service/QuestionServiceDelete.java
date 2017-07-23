package com.kmap.question.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.question.QuestionDAO;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;

public class QuestionServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		QuestionDAO qdao = new QuestionDAO();
		ReplyDAO rdao = new ReplyDAO();
		int result = 0;
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			rdao.replyDelete(num);
			result = qdao.delete(num);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "삭제하였습니다.");
		}else {
			request.setAttribute("message", "실패하였습니다.");
		}
		request.setAttribute("path", "questionList.question");
		actionFoward.setCheck(true);
		actionFoward.setPath("../common/result.jsp");
		return actionFoward;
	}

}
