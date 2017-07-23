package com.kmap.freeboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.freeboard.FreeboardDAO;
import com.kmap.member.MemberDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class FreeboardServiceMyList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		List<BoardDTO> ar = null;
		
		String member_id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		
		int curPage = 1;
		String kind = null;
		String search = null;
		
		try{
			curPage = Integer.parseInt(request.getParameter("curPage"));
			search = request.getParameter("search");
			kind = request.getParameter("kind");
		} catch(Exception e){
			e.printStackTrace();
		}	
		System.out.println(kind+kind+kind);
		if(kind==null){
			kind="title";
		}else if(kind.equals("")){
			kind="title";
		}
		
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		
		int totalCount = fdao.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		
		ar = fdao.myList(rowMaker, member_id);
		
		request.setAttribute("boardList", ar);
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("board", "freeboard");
		
		actionForward.setCheck(true);
		actionForward.setPath("../member/memberView.jsp");
		
		
		return actionForward;
	}

}