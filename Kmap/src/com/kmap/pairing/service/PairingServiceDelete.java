package com.kmap.pairing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.pairing.PairingDAO;
import com.kmap.upload.AdminUploadDAO;

public class PairingServiceDelete implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
ActionForward af = new ActionForward();
		
		PairingDAO pdao = new PairingDAO();
		AdminUploadDAO udao = new AdminUploadDAO();
		
		int result1 = 0;
		int result2 = 0;
		
		try {
			int num = Integer.parseInt(request.getParameter("num"));
		
			result1 = pdao.delete(num);
			result2 = udao.uploadDelete(num,"pairing");
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result1>0 && result2>0){
			request.setAttribute("message", "삭제되었습니다.");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("path", "./pairingList.pairing");
		}else{
			request.setAttribute("message", "실패");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("path", "../index.jsp");
		}
		
		
		return af;
	
	}

}