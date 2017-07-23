package com.kmap.maker.service;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.maker.MakerDAO;
import com.kmap.maker.MakerDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MakerServiceInsert implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		MakerDAO mdao = new MakerDAO();
		MakerDTO mdto = new MakerDTO();
		AdminUploadDAO udao = new AdminUploadDAO();
		
		int result = 0;
		
		String saveDirectory = request.getServletContext().getRealPath("upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			mdto.setName(multi.getParameter("name"));
			mdto.setPhone(multi.getParameter("phone"));
			mdto.setCeo(multi.getParameter("ceo"));
			mdto.setEstablish(Date.valueOf(multi.getParameter("establish")));
			mdto.setSite(multi.getParameter("site"));
			mdto.setContents(multi.getParameter("contents"));
			mdto.setAddress_num(Integer.parseInt(multi.getParameter("address_num")));
			mdto.setAddress_main(multi.getParameter("address_main"));
			mdto.setAddress_detail(multi.getParameter("address_detail"));
			
			result = mdao.insert(mdto);
			
			AdminFileUploader adf = new AdminFileUploader();
			ArrayList<AdminUploadDTO> ar = adf.upload(multi, result, "maker");
			
			for(AdminUploadDTO udto : ar){
				result = udao.uploadInsert(udto);
			}
			
		} catch (IOException e) {
			result = 0;
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "등록되었습니다.");
			request.setAttribute("path", "./makerList.maker");
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
