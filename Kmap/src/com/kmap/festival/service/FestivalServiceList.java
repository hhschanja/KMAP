 package com.kmap.festival.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.festival.FestivalDAO;
import com.kmap.festival.FestivalDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class FestivalServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FestivalDAO festivalDAO = new FestivalDAO();
		List<FestivalDTO> ar = null;
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
		int perPage = 3;
		try{
			perPage = Integer.parseInt(request.getParameter("perPage"));
		}catch(Exception e){

		}
		
		
		kind = request.getParameter("kind");
		if(kind == null){
			kind = "name";
		}
		if(kind == ""){
			kind = "name";
		}
		
		PageMaker pageMaker = new PageMaker(perPage, curPage);
		search = request.getParameter("search");
		RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
		int totalCount = festivalDAO.count(rowMaker);
		PageResult pageResult = pageMaker.getMakePage(totalCount);
		ar = festivalDAO.list(rowMaker);
		for(int i = 0 ; i < ar.size(); i ++){
			uar = adminUploadDAO.list(ar.get(i).getNum(), "festival");
			for(int j = 0 ; j < uar.size() ; j ++){
				String ah = uar.get(j).getFname();
				ha.add(ah);
			}
		}
		request.setAttribute("festivalList", ar);
		request.setAttribute("files", ha);
		request.setAttribute("pageResult", pageResult);
		actionForward.setCheck(true);
		actionForward.setPath("festivalList.jsp");
		return actionForward;
	}

}
