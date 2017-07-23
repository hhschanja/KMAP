package com.kmap.refund.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.refund.RefundDAO;
import com.kmap.refund.RefundDTO;

public class RefundServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int num = 0;
		RefundDAO refundDAO = new RefundDAO();
		RefundDTO refundDTO = null;
		try{
			num = Integer.parseInt(request.getParameter("num")); 
			refundDTO= refundDAO.view(num);
		}catch(Exception e) {
			
		}
		if(refundDTO!=null){
			request.setAttribute("refund", refundDTO);
			actionForward.setPath("./refundView.jsp");
			actionForward.setCheck(true);
		}else{
			actionForward.setPath("../common/result.jsp");
			actionForward.setCheck(true);
			request.setAttribute("message", "해당항목이 삭제되었습니다.");
			request.setAttribute("path", "../refund/refundList.refund");
		}
		return actionForward;
	}

}
