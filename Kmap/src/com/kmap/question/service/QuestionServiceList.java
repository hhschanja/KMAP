package com.kmap.question.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.question.QuestionDAO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class QuestionServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("qnaList");
		ActionForward actionFoward = new ActionForward();
		QuestionDAO qdao = new QuestionDAO();
		List<BoardDTO> ar = null;
		
		int curPage = 1;
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		try{
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e){
			e.printStackTrace();
		} 
		if(kind==null){
			kind="title";
		}else if(kind.equals("")){
			kind="title";
		}
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		int totalCount = qdao.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		
		ar = qdao.list(rowMaker);
		
		request.setAttribute("boardList", ar);
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("board", "question");
		
		actionFoward.setCheck(true);
		actionFoward.setPath("boardList.jsp");
		
		
		
		
		return actionFoward;
	}

}
