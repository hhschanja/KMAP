package com.kmap.question.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.question.QuestionDAO;
import com.kmap.question.QuestionDTO;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.RowMaker;

public class QuestionServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		QuestionDAO qdao = new QuestionDAO();
		QuestionDTO qdto = new QuestionDTO();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar = null;
		
		if(request.getSession()!=null){
		int type_num = Integer.parseInt(request.getParameter("num"));
		
		try{
			
			rdto.setType_num(type_num);
			rdto.setType(request.getParameter("type"));
			qdto = (QuestionDTO) qdao.view(type_num);
			ar = rdao.replyList(rdto);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(qdto!=null){
			request.setAttribute("board", "question");
			request.setAttribute("dto", qdto);
			request.setAttribute("reply", ar);
			actionFoward.setPath("boardView.jsp?num="+type_num);
		}else {
			request.setAttribute("message", "접근 권한이 없습니다.");
			request.setAttribute("path", "questionList.question");
			actionFoward.setPath("../common/result.jsp");
		}
		actionFoward.setCheck(true);
		}else{
			request.setAttribute("message", "회원만 이용 가능한 서비스 입니다.");
			request.setAttribute("path", "questionList.question");
			actionFoward.setPath("../common/result.jsp");
			actionFoward.setCheck(true);
		}
		return actionFoward;
	}

}
