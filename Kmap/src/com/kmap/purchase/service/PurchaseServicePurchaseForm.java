package com.kmap.purchase.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;

import com.kmap.basket.BasketDAO;
import com.kmap.member.MemberDTO;

import com.kmap.sale.SaleDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class PurchaseServicePurchaseForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		BasketDAO bdao = new BasketDAO();
		String member_id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
		List<SaleDTO> sar = null;
		try{		
		sar = bdao.list(member_id); //장바구니 가져오기
		}catch(Exception e){
			
		}
		ArrayList<String> ha = new ArrayList<>();//이미지 가져오기 용
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		List<AdminUploadDTO> uar = null;
		if(sar !=null){
		for(int i=0;i<sar.size();i++){ //글의 개수만큼 포문을 돌리는데
			uar = adminUploadDAO.list(sar.get(i).getType_num(), ""); // 하나의 글에 포함되어있는 파일 이름 불러오기
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}
		}
		if(sar==null){
			af.setCheck(false);
			af.setPath("../index.jsp");
	
		}else{
			af.setCheck(true);
			af.setPath("./purchaseForm.jsp");
			request.setAttribute("basket", sar);
			request.setAttribute("files", ha);
			
		}
		
		
		return af;
	}

}
