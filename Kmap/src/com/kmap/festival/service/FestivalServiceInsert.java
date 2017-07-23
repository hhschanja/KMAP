package com.kmap.festival.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.festival.FestivalDAO;
import com.kmap.festival.FestivalDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FestivalServiceInsert implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FestivalDAO festivalDAO = new FestivalDAO();
		FestivalDTO festivalDTO = new FestivalDTO();
		int result = 0;
		String saveDirectory = request.getServletContext().getRealPath("upload");
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multi = null;
		File fi = new File(saveDirectory);
		if(!fi.exists()){
			fi.mkdirs();
		}
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			festivalDTO = new FestivalDTO();
			festivalDTO.setAddress(multi.getParameter("address"));
			festivalDTO.setContents(multi.getParameter("contents"));
			festivalDTO.setHost(multi.getParameter("host"));
			festivalDTO.setLast_date(Date.valueOf(multi.getParameter("last_date")));
			festivalDTO.setName(multi.getParameter("name"));
			festivalDTO.setPhone(multi.getParameter("phone"));
			festivalDTO.setPrice(Integer.parseInt(multi.getParameter("price")));
			festivalDTO.setStart_date(Date.valueOf(multi.getParameter("start_date")));
			result = festivalDAO.insert(festivalDTO);
			if(result>0){
				AdminFileUploader adminFileUploader = new AdminFileUploader();
				AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
				ArrayList<AdminUploadDTO> ar = adminFileUploader.upload(multi, festivalDAO.currNum(), "festival");
				if(ar.get(0).getFname()!=null){
					for(AdminUploadDTO adminUploadDTO : ar){
						result = result * adminUploadDAO.uploadInsert(adminUploadDTO);
					}
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0){
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "등록되었습니다.");
			request.setAttribute("path", "./festivalList.festival");

		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "ERROR");
			request.setAttribute("path", "../index.jsp");
		}
		return actionForward;
	}

}
