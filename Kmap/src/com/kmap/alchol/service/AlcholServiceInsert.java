package com.kmap.alchol.service;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.alchol.AlcholDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AlcholServiceInsert implements Action {
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
		AlcholDTO alcholDTO = null;
		int result = 0;
		String saveDirectory = request.getServletContext().getRealPath("upload");
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multi = null;
		File fi = new File(saveDirectory);
		if(!fi.exists()){
			fi.mkdirs();
		}
		try{
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			alcholDTO = new AlcholDTO();
			alcholDTO.setCapacity(Integer.parseInt(multi.getParameter("capacity")));
			alcholDTO.setContents(multi.getParameter("contents"));
			alcholDTO.setCount(Integer.parseInt(multi.getParameter("count")));
			alcholDTO.setDegree(Integer.parseInt(multi.getParameter("degree")));
			alcholDTO.setKind(multi.getParameter("kind"));
			System.out.println(multi.getParameter("kind"));
			alcholDTO.setMade_date(Date.valueOf(multi.getParameter("made_date")));
			alcholDTO.setMaker_num(Integer.parseInt(multi.getParameter("maker_num")));
			alcholDTO.setMaterial(multi.getParameter("material"));
			alcholDTO.setName(multi.getParameter("name"));
			alcholDTO.setPrice(Integer.parseInt(multi.getParameter("price")));		
			result = alcholDAO.insert(alcholDTO);


			if(result>0){
			AdminFileUploader adminFileUploader = new AdminFileUploader();
			AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
			ArrayList<AdminUploadDTO> ar = adminFileUploader.upload(multi, alcholDAO.currNum(), "alchol");
			if(ar.get(0).getFname()!=null){
				for(AdminUploadDTO adminUploadDTO : ar){
					result = result * adminUploadDAO.uploadInsert(adminUploadDTO);
				}
			}
			}


		}catch(Exception e){
			e.printStackTrace();

		}

		if(result > 0){
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "등록되었습니다.");
			request.setAttribute("path", "alcholList.alchol");

		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "실패하였습니다.");
			request.setAttribute("path", "alcholList.alchol");
		}

		return actionForward;
	}
}
