package com.kmap.purchase.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.basket.BasketDAO;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;
import com.kmap.purchase.PurchaseDAO;
import com.kmap.purchase.PurchaseDTO;


public class PurchaseServiceBuy implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int a = 0;
		PurchaseDAO purchaseDAO = new PurchaseDAO();
		PurchaseDTO purchaseDTO = new PurchaseDTO();
		MemberDAO memberDAO = new MemberDAO();
		BasketDAO basketDAO = new BasketDAO();
		MemberDTO memberDTO = new MemberDTO();
		
		int memberPoint = 0;
		try{
		memberPoint = Integer.parseInt(request.getParameter("memberPoint"));
		}catch(Exception e){
			
		}
		boolean result = false;
		try{
			purchaseDTO.setCharge_type(request.getParameter("charge_type")); 
			purchaseDTO.setAddress_num(Integer.parseInt(request.getParameter("address_num")));
			purchaseDTO.setAddress_main(request.getParameter("address_main"));
			purchaseDTO.setAddress_detail(request.getParameter("address_detail"));
			purchaseDTO.setMember_name(request.getParameter("member_name"));
			result = true;
			if(purchaseDTO.getCharge_type() == null||purchaseDTO.getCharge_type().equals("")||purchaseDTO.getAddress_num()==0||purchaseDTO.getAddress_main().equals("")||purchaseDTO.getAddress_detail().equals("")||purchaseDTO.getMember_name().equals("")){
				result = false;
			}
		}catch(Exception e){
			
		}
		

		while(request.getParameter("a"+a)!=null){ 
			a++;
		}
		
		if(result){
		if(memberPoint == 0){
			for(int i = 0 ; i <a ; i++){
				if(request.getParameter("ck"+i)!=null){
					int b =purchaseDAO.buy(Integer.parseInt(request.getParameter("ck"+i)), purchaseDTO);
					memberDAO.point(b, ((MemberDTO)request.getSession().getAttribute("member")).getId(), "+");
				basketDAO.delete(Integer.parseInt(request.getParameter("ck"+i)), ((MemberDTO)request.getSession().getAttribute("member")).getId());
					
				}

			}
		}
		else{
			for(int i = 0 ; i <a ; i++){
				if(request.getParameter("ck"+i)!=null){
					purchaseDAO.buyPoint(Integer.parseInt(request.getParameter("ck"+i)), purchaseDTO);
					basketDAO.delete(Integer.parseInt(request.getParameter("ck"+i)), ((MemberDTO)request.getSession().getAttribute("member")).getId());
					
				}

			}
			memberDAO.point(memberPoint, ((MemberDTO)request.getSession().getAttribute("member")).getId(), "-");

		}
		}
		
		
		if(result){
			memberDTO = memberDAO.reLogin((MemberDTO)request.getSession().getAttribute("member"));
			request.getSession().invalidate();
			request.getSession().setAttribute("member", memberDTO);
			actionForward.setPath("../common/result.jsp");
		actionForward.setCheck(true);
		request.setAttribute("path", "../basket/basketList.basket");
		request.setAttribute("message", "구매 완료하였습니다.");
		
		}else{
			actionForward.setPath("../common/result.jsp");
			actionForward.setCheck(true);
			request.setAttribute("path", "../purchase/purchaseForm.purchase");
			request.setAttribute("message", "배송지정보와 구매방식은 반드시 넣어주세요 ");
		}


		return actionForward;
	}

}
