package com.kmap.refund.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDTO;
import com.kmap.purchase.PurchaseDAO;
import com.kmap.refund.RefundDAO;
import com.kmap.refund.RefundDTO;

public class RefundServiceInsert implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		RefundDTO refundDTO = new RefundDTO();
		RefundDAO refundDAO = new RefundDAO();
		PurchaseDAO purchaseDAO = new PurchaseDAO();
		try{
			refundDTO.setContents(request.getParameter("contents"));
			refundDTO.setId(((MemberDTO)request.getSession().getAttribute("member")).getId());
			refundDTO.setPurchase_num(Integer.parseInt(request.getParameter("purchase_num")));
			refundDTO.setTitle(request.getParameter("title"));
			refundDTO.setRefund_type(request.getParameter("refund_type_1") + " " +request.getParameter("refund_type_2"));
			refundDTO.setPoint(Integer.parseInt(request.getParameter("point")));
		}catch(Exception e){
			
		}
		
		int result = refundDAO.insert(refundDTO);
		if(result > 0){
			result = purchaseDAO.delete(refundDTO.getPurchase_num(), refundDTO.getId());

			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "환불접수완료");
			request.setAttribute("path", "../purchase/purchaseMyList.purchase");
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "환불접수실패");
			request.setAttribute("path", "../purchase/purchaseMyList.purchase");
		}
		
		return actionForward;
	}

}
