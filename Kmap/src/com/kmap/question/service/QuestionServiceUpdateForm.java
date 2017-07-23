package com.kmap.question.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.question.QuestionDAO;
import com.kmap.question.QuestionDTO;

public class QuestionServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		QuestionDAO qdao = new QuestionDAO();
		BoardDTO bdto = null;
		QuestionDTO qdto = (QuestionDTO)bdto;
		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			bdto = qdao.view(num);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(bdto!=null){
			request.setAttribute("board", "question");
			request.setAttribute("dto", bdto);
			actionFoward.setPath("boardUpdateForm.jsp");
		}else {
			request.setAttribute("message", "No data");
			request.setAttribute("path", "questionList.question");
			actionFoward.setPath("../common/result.jsp");
		}
		actionFoward.setCheck(true);
		
		
		return actionFoward;
	}

}
