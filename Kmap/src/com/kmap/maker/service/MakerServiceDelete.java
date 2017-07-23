package com.kmap.maker.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.maker.MakerDAO;
import com.kmap.upload.AdminUploadDAO;

public class MakerServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		
		MakerDAO mdao = new MakerDAO();
		AdminUploadDAO udao = new AdminUploadDAO();
		
		int result = 0;
		
		try {
			int num = Integer.parseInt(request.getParameter("num"));
		
			result = mdao.delete(num);
			result = udao.uploadDelete(num,"maker");
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result>0){
			request.setAttribute("message", "삭제되었습니다");
			request.setAttribute("path", "./makerList.maker");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			
		}else{
			request.setAttribute("message", "ERROR");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("path", "../index.jsp");
		}

		
		return af;
	}

}
