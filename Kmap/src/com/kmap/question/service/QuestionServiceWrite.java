package com.kmap.question.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.question.QuestionDAO;
import com.kmap.question.QuestionDTO;

public class QuestionServiceWrite implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		QuestionDTO qdto = new QuestionDTO();
		QuestionDAO qdao = new QuestionDAO();
		
		
		qdto.setWriter(request.getParameter("writer"));
		qdto.setTitle(request.getParameter("title"));
		qdto.setContents(request.getParameter("contents"));
		qdto.setPhone_kind(request.getParameter("phone_kind"));
		qdto.setPhone_1(request.getParameter("phone_1"));
		qdto.setPhone_2(request.getParameter("phone_2"));
		qdto.setPhone_3(request.getParameter("phone_3"));
		
		System.out.println("이거: "+qdto.getWriter());
		int result = qdao.write(qdto);
		
		if(result>0){
			actionFoward.setCheck(false);
			actionFoward.setPath("questionList.question");
		}else {
			request.setAttribute("message", "게시글 작성에 실패하였습니다.");
			request.setAttribute("path", "queqstionList.question");
			actionFoward.setCheck(true);
			actionFoward.setPath("../common/result.jsp");
		}
		
		return actionFoward;
	}

}
