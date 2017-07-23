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
import com.kmap.util.RowMaker;

public class PairingServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		PairingDAO pairingDAO = new PairingDAO();
		PairingDTO pairingDTO = null;
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		List<AdminUploadDTO> uar = null;

		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			pairingDTO = pairingDAO.view(num);
			uar = adminUploadDAO.list(num, "pairing");
			
		} catch(Exception e){
			pairingDTO = null;
			e.printStackTrace();
		}
		
		if(pairingDTO!=null){
			request.setAttribute("pairing", pairingDTO);
			request.setAttribute("files", uar);
			actionForward.setCheck(true);
			actionForward.setPath("./pairingView.jsp");
		}else{
			request.setAttribute("message", "ERROR");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		return actionForward;
	}

}
