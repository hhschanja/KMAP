package com.kmap.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.notice.NoticeDAO;

public class NoticeServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		NoticeDAO ndao = new NoticeDAO();
		int result = 0;
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			result = ndao.delete(num);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(result>0){
			request.setAttribute("message", "삭제하였습니다.");
		}else {
			request.setAttribute("message", "실패하였습니다.");
		}
		request.setAttribute("path", "noticeList.notice");
		actionFoward.setCheck(true);
		actionFoward.setPath("../common/result.jsp");
		return actionFoward;
	}

}
