package com.kmap.ticket.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.product.ProductDTO;
import com.kmap.ticket.TicketDAO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;


public class TicketServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		TicketDAO ticketDAO = new TicketDAO();
		List<ProductDTO> ar = null;
		List<AdminUploadDTO> uar = null;
		ArrayList<String> ha = new ArrayList<>();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		int curPage = 1;
		String kind = null;
		String search = null;

		try{
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){

		}
		PageMaker pageMaker = new PageMaker(curPage);
		
		kind = request.getParameter("kind");
		
		if(kind == null ){
			kind = "name";
		}

		search = request.getParameter("search");

		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);

		int totalCount = ticketDAO.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		ar = ticketDAO.list(rowMaker);
		for(int i=0;i<ar.size();i++){ //글의 개수만큼 포문을 돌리는데
			uar = adminUploadDAO.list(ar.get(i).getNum(), "ticket"); // 하나의 글에 포함되어있는 파일 이름 불러오기
			
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}

		request.setAttribute("ticketList", ar);
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("files", ha);
		actionForward.setCheck(true);
		actionForward.setPath("ticketList.jsp");

		return actionForward;
	}

}
