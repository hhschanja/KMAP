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

public class FestivalServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FestivalDAO festivalDAO = new FestivalDAO();
		FestivalDTO festivalDTO = null;
		int result = 0;
		int result2 = 0;
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
			festivalDTO.setNum(Integer.parseInt(multi.getParameter("num")));
			festivalDTO.setPhone(multi.getParameter("phone"));
			festivalDTO.setPrice(Integer.parseInt(multi.getParameter("price")));
			festivalDTO.setStart_date(Date.valueOf(multi.getParameter("start_date")));
			
			
			result = festivalDAO.update(festivalDTO);
			
			
			
			if(result > 0){
			String fname = multi.getParameter("fname");
			String oname = multi.getParameter("oname");
			AdminFileUploader adminFileUploader = new AdminFileUploader();
			AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
			AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
			AdminUploadDTO pastUpload = new AdminUploadDTO();
			pastUpload.setFname(fname);
			pastUpload.setOname(oname);
			adminUploadDTO=adminFileUploader.upload(multi, festivalDTO.getNum(), "festival").get(0);
			result2 = adminUploadDAO.update(adminUploadDTO, pastUpload);
			if(result2 <=0){
				ArrayList<AdminUploadDTO> ar = adminFileUploader.upload(multi, festivalDTO.getNum(), "festival");
				for(AdminUploadDTO aDTO : ar){
					result2 = adminUploadDAO.uploadInsert(aDTO);					
				}
			}
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "수정되었습니다.");
			request.setAttribute("path", "festivalView.festival?num="+festivalDTO.getNum());
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "실패");
			request.setAttribute("path", "../index.jsp");
		}
		return actionForward;
	}

}
