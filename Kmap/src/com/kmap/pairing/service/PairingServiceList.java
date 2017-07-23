package com.kmap.pairing.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.pairing.PairingDAO;
import com.kmap.pairing.PairingDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class PairingServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		PairingDAO paringDAO = new PairingDAO();
		List<PairingDTO> par = new ArrayList<>();
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> uar = new ArrayList<>();
		ArrayList<String> ha = new ArrayList<>();
		
		int curPage = 1;
		
		try{
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch(Exception e){
			e.printStackTrace();
		}
		
		int perPage = 9;
		
		try{
			perPage = Integer.parseInt(request.getParameter("perPage"));
		} catch(Exception e){
			e.printStackTrace();
		}	

		String kind = null;
		kind = request.getParameter("kind");
		
		if(kind==null){
			kind="title";
		}else if(kind.equals("")){
			kind="title";
		}
		
		String search = null;
		search = request.getParameter("search");
		
		PageMaker pageMaker = new PageMaker(perPage, curPage);
		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		
		int totalCount = paringDAO.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		
		par = paringDAO.list(rowMaker);
		
		
		for(int i=0;i<par.size();i++){ //글의 개수만큼 포문을 돌리는데
			uar = adao.list(par.get(i).getNum(), "pairing"); // 하나의 글에 포함되어있는 파일 이름 불러오기
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}
		
		request.setAttribute("pairing", par);
		request.setAttribute("files", ha);
		request.setAttribute("size", ha.size());
		request.setAttribute("pageResult", pageResult);
		
		actionForward.setCheck(true);
		actionForward.setPath("pairingList.jsp");
		
		return actionForward;
	}

}