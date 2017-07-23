package com.kmap.basket.service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.basket.BasketDAO;
import com.kmap.member.MemberDTO;
import com.kmap.sale.SaleDTO;
import com.kmap.ticket.TicketDAO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class BasketServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		List<AdminUploadDTO> uar = new ArrayList<>();
		ArrayList<String> ha = new ArrayList<>();
		ArrayList<String> pType = new ArrayList<>();
		BasketDAO bdao = new BasketDAO();
		
		AlcholDAO alcholDAO = new AlcholDAO();
		
		String member_id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		
		List<SaleDTO> sar = bdao.list(member_id);
		for(int i = 0 ; i < sar.size() ; i ++){
			if(alcholDAO.view(sar.get(i).getType_num())!= null){
				pType.add("alchol");
			}else{
				pType.add("ticket");
			}
			
		}
		
		for(int i=0;i<sar.size();i++){ //글의 개수만큼 포문을 돌리는데
			uar = adminUploadDAO.purchaseList(sar.get(i).getType_num(), "alchol","ticket"); // 하나의 글에 포함되어있는 파일 이름 불러오기
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}
		af.setCheck(true);
		af.setPath("./basketPage.jsp");
		request.setAttribute("basket",sar);
		request.setAttribute("pType",pType);
		request.setAttribute("files", ha);




		return af;
	}

}