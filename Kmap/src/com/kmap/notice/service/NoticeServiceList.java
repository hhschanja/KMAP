package com.kmap.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.notice.NoticeDAO;
import com.kmap.notice.NoticeDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;
import com.kmap.action.Action;

public class NoticeServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		NoticeDAO ndao = new NoticeDAO();
		List<BoardDTO> ar = null;
		
		int curPage = 1;
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		try{
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch(Exception e){
			
		}
		if(kind==null){
			kind="title";
		}else if(kind.equals("")){
			kind="title";
		}
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		int totalCount = ndao.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		
		ar = ndao.list(rowMaker);
		
		
		request.setAttribute("boardList", ar);
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("board", "notice");
		
		actionFoward.setCheck(true);
		actionFoward.setPath("boardList.jsp");
		
		return actionFoward;
	}

}
