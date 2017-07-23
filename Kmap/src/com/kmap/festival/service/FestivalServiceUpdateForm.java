package com.kmap.festival.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.festival.FestivalDAO;
import com.kmap.festival.FestivalDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class FestivalServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FestivalDAO festivalDAO = new FestivalDAO();
		FestivalDTO festivalDTO = new FestivalDTO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
		int num = 0;
		try{
		num = Integer.parseInt(request.getParameter("num"));
		festivalDTO = festivalDAO.view(num);
		adminUploadDTO = (adminUploadDAO.list(num, "festival")).get(0);
		}catch(Exception e){
			
		}
		
		request.setAttribute("festival", festivalDTO);
		request.setAttribute("upload", adminUploadDTO);
		actionForward.setCheck(true);
		actionForward.setPath("festivalUpdateForm.jsp?num="+num);
		
		return actionForward;
	}

}
