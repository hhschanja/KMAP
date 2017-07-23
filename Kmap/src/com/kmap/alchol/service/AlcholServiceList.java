package com.kmap.alchol.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;

import com.kmap.product.ProductDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class AlcholServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
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
		if(kind == null){
			kind = "name";
		}

		search = request.getParameter("search");


		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		int totalCount = alcholDAO.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		ar = alcholDAO.list(rowMaker);
		for(int i=0;i<ar.size();i++){ //글의 개수만큼 포문을 돌리는데
			AdminUploadDTO adto = new AdminUploadDTO();
			uar = adminUploadDAO.list(ar.get(i).getNum(), "alchol"); // 하나의 글에 포함되어있는 파일 이름 불러오기
			
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}
		

		request.setAttribute("alcholList", ar);
		request.setAttribute("files", ha);
		request.setAttribute("pageResult", pageResult);
		actionForward.setCheck(true);
		actionForward.setPath("alcholList.jsp");
		return actionForward;
	}

}
