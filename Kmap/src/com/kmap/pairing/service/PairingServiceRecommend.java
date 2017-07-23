package com.kmap.pairing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.pairing.PairingDAO;

public class PairingServiceRecommend implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		
		PairingDAO pdao = new PairingDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = pdao.recomCount(num);
		
		if(result>0){
			request.setAttribute("message", "추천 감사합니다.");
			request.setAttribute("path", "./pairingView.pairing?num="+num);
			af.setCheck(true);
			af.setPath("../common/result.jsp");
		}else{
			request.setAttribute("message", "이미 추천하셨습니다");
			request.setAttribute("path", "../pairingList.pairing");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
		}
		
		
		return af;
	}

}
