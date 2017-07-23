package com.kmap.refund.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;
import com.kmap.refund.RefundDAO;
import com.kmap.refund.RefundDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class RefundServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		RefundDAO refundDAO = new RefundDAO();
		List<RefundDTO> ar = null;
		int curPage = 1;
		String kind = null;
		String search = null;
		
		
		
		try{
			curPage = Integer.parseInt(request.getParameter("curPage"));
			search = request.getParameter("search");
			kind = request.getParameter("kind");
		} catch(Exception e){
			
		}
		if(kind==null){
			kind="handling";
		}else if(kind.equals("")){
			kind="handling";
		}
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		int totalCount = refundDAO.count(rowMaker);
		
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		ar = refundDAO.list(rowMaker);
		
		request.setAttribute("refundList", ar);
		request.setAttribute("pageResult", pageResult);
		
		
		actionForward.setCheck(true);
		actionForward.setPath("refundList.jsp");
		return actionForward;
	}

}
