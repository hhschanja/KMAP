package com.kmap.pairing.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.pairing.PairingDAO;
import com.kmap.pairing.PairingDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class PairingServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		PairingDAO pairingDAO = new PairingDAO();
		PairingDTO pairingDTO = new PairingDTO();
		List<AdminUploadDTO> ar = null;
		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			pairingDTO = pairingDAO.view(num);
					
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(pairingDTO!=null){
			request.setAttribute("pairing", pairingDTO);
			request.setAttribute("files", ar);
			actionForward.setCheck(true);
			actionForward.setPath("./pairingUpdateForm.jsp");
		}else {
			request.setAttribute("message", "ERROR");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		return actionForward;
	}

}
