package com.kmap.maker.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.maker.MakerDAO;
import com.kmap.maker.MakerDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;

public class MakerServiceList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		
		MakerDAO mdao = new MakerDAO();
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> uar = null;
		ArrayList<String> ha = new ArrayList<>();
		
		int perPage = 5;
		try {
			perPage = Integer.parseInt(request.getParameter("perPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String kind = "name";
			kind = request.getParameter("kind");
			
		if(kind == null){
			kind = "name";
		}
		
			// TODO: handle exception
		
		
		String search = request.getParameter("search");
		
		PageMaker pm = new PageMaker(perPage, curPage);
		RowMaker rm = pm.getRowMaker(kind, search);
		List<MakerDTO> mar = mdao.list(rm);
		int totalCount = mdao.count(rm);
		PageResult pr = pm.getMakePage(totalCount);

		
		for(int i=0;i<mar.size();i++){ //글의 개수만큼 포문을 돌리는데
			AdminUploadDTO adto = new AdminUploadDTO();
			uar = adao.list(mar.get(i).getNum(), "maker"); // 하나의 글에 포함되어있는 파일 이름 불러오기
			
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}
		
			af.setCheck(true);
			af.setPath("./list.jsp");
			request.setAttribute("list", mar);
			request.setAttribute("files", ha);
			request.setAttribute("pageResult", pr);

		return af;
	}

}