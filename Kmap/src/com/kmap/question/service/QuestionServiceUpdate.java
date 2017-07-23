package com.kmap.question.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.question.QuestionDAO;
import com.kmap.question.QuestionDTO;

public class QuestionServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		QuestionDAO qdao = new QuestionDAO();
		QuestionDTO qdto = new QuestionDTO();
		int result = 0;
		
		try{
			if(request.getParameter("title").equals("")){
				result = 0;
				qdto.setNum(Integer.parseInt(request.getParameter("num")));
			}else {
			qdto.setNum(Integer.parseInt(request.getParameter("num")));
			qdto.setWriter(request.getParameter("writer"));
			qdto.setTitle(request.getParameter("title"));
			qdto.setContents(request.getParameter("contents"));
			qdto.setPhone_kind(request.getParameter("phone_kind"));
			qdto.setPhone_1(request.getParameter("phone_1"));
			qdto.setPhone_2(request.getParameter("phone_2"));
			qdto.setPhone_3(request.getParameter("phone_3"));
			result = qdao.update(qdto);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "수정하였습니다.");
			
		}else {
			request.setAttribute("message", "실패하였습니다. 수정하려는 내용을 다시 확인해주세요");
			
		}
		
		request.setAttribute("path", "questionView.question?type=question&num="+qdto.getNum());
		actionFoward.setCheck(true);
		actionFoward.setPath("../common/result.jsp");
		
		
		return actionFoward;
	}

}
