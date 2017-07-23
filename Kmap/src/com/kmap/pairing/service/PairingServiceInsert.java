package com.kmap.pairing.service;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.pairing.PairingDAO;
import com.kmap.pairing.PairingDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PairingServiceInsert implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		PairingDAO pairingDAO = new PairingDAO();
		PairingDTO pairingDTO = new PairingDTO();
		AdminUploadDAO adminUploadDAO =  new AdminUploadDAO();
		
		int result = 0;
		
		String saveDirectory = request.getServletContext().getRealPath("upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			pairingDTO.setWriter(multi.getParameter("writer"));
			pairingDTO.setTitle(multi.getParameter("title"));
			pairingDTO.setContents(multi.getParameter("contents"));
			
			result = pairingDAO.write(pairingDTO);
			
			AdminFileUploader adf = new AdminFileUploader();
			ArrayList<AdminUploadDTO> ar = adf.upload(multi, result, "pairing");
			
			for(AdminUploadDTO udto : ar){
				result = adminUploadDAO.uploadInsert(udto);
			}
			
		} catch (IOException e) {
			result = 0;
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "등록되었습니다.");
			request.setAttribute("path", "./pairingList.pairing");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}else{
			request.setAttribute("message", "ERROR");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		
		return actionForward;
	}

}
