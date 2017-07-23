package com.kmap.alchol.service;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.alchol.AlcholDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class AlcholServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
		AlcholDTO alcholDTO = new AlcholDTO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
		
		int anum = 0;
		try{
			anum = Integer.parseInt(request.getParameter("anum"));
			alcholDTO = (AlcholDTO)alcholDAO.view(anum);
			adminUploadDTO = (adminUploadDAO.list(anum, "alchol")).get(0);
		}catch(Exception e){
			
		}
		request.setAttribute("alchol", alcholDTO);
		request.setAttribute("upload", adminUploadDTO);
		actionForward.setCheck(true);
		actionForward.setPath("alcholUpdateForm.jsp?anum="+anum);
		
		return actionForward;
	}

}
