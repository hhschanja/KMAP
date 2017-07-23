package com.kmap.refund.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.refund.RefundDAO;

public class RefundServiceMod implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		RefundDAO refundDAO = new RefundDAO();
		MemberDAO memberDAO = new MemberDAO();
		int num = 0;
		String handling = null;
		int result = 0;
		
		String id = null;
		int point = 0;
		try{
			num = Integer.parseInt(request.getParameter("num"));
			handling = request.getParameter("handling");
			result = refundDAO.update(num, handling);
			
			id = request.getParameter("id");
			point = Integer.parseInt(request.getParameter("point"));
			
		}catch(Exception e){
			
		}
		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		if(result > 0){
			if(id != null && point != 0 && handling.equals("환불완료")){
				memberDAO.point(Integer.parseInt(request.getParameter("point")), id, "-");
			}
			request.setAttribute("message", "접수상태 변경 완료");
			request.setAttribute("path", "../refund/refundList.refund");
			
		}else{
			
			request.setAttribute("message", "접수상태 변경 실패");
			request.setAttribute("path", "../refund/refundList.refund");
		}
		
		return actionForward;
	}

}
