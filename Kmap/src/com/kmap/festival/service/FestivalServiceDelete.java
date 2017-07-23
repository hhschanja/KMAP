package com.kmap.festival.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.festival.FestivalDAO;
import com.kmap.upload.AdminUploadDAO;

public class FestivalServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FestivalDAO festivalDAO = new FestivalDAO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		int num = 0;
		String fname = null;
		int result = 0;
		try{
		num = Integer.parseInt(request.getParameter("num"));
		fname = request.getParameter("fname");
		result = festivalDAO.delete(num);
		if(!(fname.equals(""))){
			result = result * adminUploadDAO.uploadDelete(fname);
			}
		}catch(Exception e){
			
		}
		if(result > 0){
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "삭제되었습니다.");
			request.setAttribute("path", "./festivalList.festival");
			
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			 request.setAttribute("message", "ERROR");
			 request.setAttribute("path", "../index.jsp");
		}
		return actionForward;
	}

}
