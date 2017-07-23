package com.kmap.purchase.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;
import com.kmap.purchase.PurchaseDAO;
import com.kmap.purchase.PurchaseDTO;
import com.kmap.ticket.TicketDAO;


public class PurchaseServiceBuyOne implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		PurchaseDAO purchaseDAO = new PurchaseDAO();
		PurchaseDTO purchaseDTO = new PurchaseDTO();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		TicketDAO ticketDAO = new TicketDAO();
		String type = "alchol";
		int memberPoint = 0;
		try{
		memberPoint = Integer.parseInt(request.getParameter("memberPoint"));
		}catch(Exception e){
			
		}
		boolean result = false;
		try{
		purchaseDTO.setCount(Integer.parseInt(request.getParameter("count")) );
		purchaseDTO.setMember_id(((MemberDTO)request.getSession().getAttribute("member")).getId());
		purchaseDTO.setName(request.getParameter("name"));
		purchaseDTO.setPrice(Integer.parseInt(request.getParameter("price")));
		purchaseDTO.setType_num(Integer.parseInt(request.getParameter("type_num")));
		purchaseDTO.setCharge_type(request.getParameter("charge_type")); 
		purchaseDTO.setAddress_num(Integer.parseInt(request.getParameter("address_num")));
		purchaseDTO.setAddress_main(request.getParameter("address_main"));
		purchaseDTO.setAddress_detail(request.getParameter("address_detail"));
		purchaseDTO.setMember_name(request.getParameter("member_name"));
		type = request.getParameter("type");
		result = true;
		if(purchaseDTO.getCharge_type() == null||purchaseDTO.getCharge_type().equals("")||purchaseDTO.getAddress_num()==0||purchaseDTO.getAddress_main().equals("")||purchaseDTO.getAddress_detail().equals("")||purchaseDTO.getMember_name().equals("")){
			result = false;
		}
		}catch(Exception e){
			
		}
		if(result){
		if(memberPoint==0){
				int b = purchaseDAO.buyOne(purchaseDTO);//purchase_List에 넣기, 리턴 값이 적립 포인트
				memberDAO.point(b, ((MemberDTO)request.getSession().getAttribute("member")).getId(), "+");
				ticketDAO.purchase(purchaseDTO.getType_num(), purchaseDTO.getCount());//갯수빼주기
			
		}else{
			purchaseDAO.buyPointOne(purchaseDTO);//포인트로 계산한 경우 적립 포인트는 0 이라고 purchase_LIst에 입력하는 메소드
			memberDAO.point(memberPoint, ((MemberDTO)request.getSession().getAttribute("member")).getId(), "-");
			ticketDAO.purchase(purchaseDTO.getType_num(), purchaseDTO.getCount());
		}
		}
		
		
		
		if(result){
			memberDTO = memberDAO.reLogin((MemberDTO)request.getSession().getAttribute("member"));
			request.getSession().invalidate();
			request.getSession().setAttribute("member", memberDTO);
			actionForward.setPath("../common/result.jsp");
			actionForward.setCheck(true);
			if(type.equals("alchol")){
				request.setAttribute("path", "../alchol/alcholView.alchol?anum="+purchaseDTO.getType_num());		
				
			}else{
				request.setAttribute("path", "../ticket/ticketView.ticket?tnum="+purchaseDTO.getType_num());
				
			}
			request.setAttribute("message", "구매 완료하였습니다.");
			}else{
				actionForward.setPath("../common/result.jsp");
				actionForward.setCheck(true);
				if(type.equals("alchol")){
					request.setAttribute("path", "../alchol/alcholView.alchol?anum="+purchaseDTO.getType_num());		
					
				}else{
					request.setAttribute("path", "../ticket/ticketView.ticket?tnum="+purchaseDTO.getType_num());
					
				}
				request.setAttribute("message", "배송지정보와 구매방식은 반드시 넣어주세요 ");
			}
		return actionForward;
	}

}
