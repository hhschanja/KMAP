package com.kmap.member.service;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDTO;
import com.kmap.purchase.PurchaseDAO;
import com.kmap.sale.SaleDTO;
public class MemberServiceMypage implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		PurchaseDAO pdao = new PurchaseDAO();
		List<SaleDTO> par = new ArrayList<>();
			
			String id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
			par = pdao.list(id);
		
		if(par!=null){
			request.setAttribute("purchaseList", par);
			af.setCheck(true);
			af.setPath("./mypage.jsp");
			
		}
		
		
		return af;
	}

}