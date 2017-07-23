package com.kmap.freeboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.freeboard.FreeboardDAO;

public class FreeboardServiceRecommend implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		int result = 0;
		int num = 0;
		try{
			num = Integer.parseInt(request.getParameter("num"));
			result = fdao.recomCount(num);
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "추천하셨습니다.");
		}else {
			request.setAttribute("message", "추천에 실패 하였습니다.");
		}
		request.setAttribute("path", "freeboardView.freeboard?num="+num);
		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		return actionForward;
	}

}
