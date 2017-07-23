package com.kmap.maker.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.maker.MakerDAO;
import com.kmap.maker.MakerDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class MakerServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward af = new ActionForward();
				
		MakerDAO mdao = new MakerDAO();
		MakerDTO mdto = new MakerDTO();
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> ar = null;
		int num = 0;
		
		try {
			num = Integer.parseInt(request.getParameter("num"));
			mdto = mdao.view(num);
			ar = adao.list(num, "maker");
			
		} catch (Exception e) {
			mdto = null;
		}
		
		if(mdto!=null){
			request.setAttribute("maker", mdto);
			request.setAttribute("files", ar);
			af.setCheck(true);
			af.setPath("./updateForm.jsp");
		}else{
			request.setAttribute("message", "ERROR");
			request.setAttribute("path", "../index.jsp");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
		}

		return af;
	}

}
