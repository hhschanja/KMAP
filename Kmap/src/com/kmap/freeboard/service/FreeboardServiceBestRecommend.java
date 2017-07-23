package com.kmap.freeboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.freeboard.FreeboardDAO;
import com.kmap.freeboard.FreeboardDTO;

public class FreeboardServiceBestRecommend implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		List<FreeboardDTO> ar = null;
		
		ar = fdao.bestRecommend();
		
		
		request.setAttribute("best", ar);
		actionForward.setCheck(true);
		actionForward.setPath("BestRecommend.jsp");
		
		
		
		
		
		return actionForward;
	}

}
