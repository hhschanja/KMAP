package com.kmap.alchol.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.upload.AdminUploadDAO;


public class AlcholServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		int anum = 0;
		String fname = null;
		int result = 0;
		
		try{
			anum = Integer.parseInt(request.getParameter("anum"));
			fname = request.getParameter("fname");
			result = alcholDAO.delete(anum);
			if(!(fname.equals(""))){
			result = result * adminUploadDAO.uploadDelete(fname);
			}
		}catch(Exception e){
			
		}
		if(result > 0){
			actionForward.setCheck(false);
			 actionForward.setPath("alcholList.alchol");
		}else{
			actionForward.setCheck(true);
			 actionForward.setPath("../common/result.jsp");
			 request.setAttribute("message", "실패");
			 request.setAttribute("path", "../index.jsp");
			
		}
		return actionForward;
	}

}
