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

public class AlcholServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
		AlcholDTO alcholDTO = null;
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
		try{
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			alcholDTO = new AlcholDTO();
			alcholDTO.setCapacity(Integer.parseInt(multi.getParameter("capacity")));
			alcholDTO.setContents(multi.getParameter("contents"));
			alcholDTO.setCount(Integer.parseInt(multi.getParameter("count")));
			alcholDTO.setDegree(Integer.parseInt(multi.getParameter("degree")));
			alcholDTO.setKind(multi.getParameter("kind"));
			alcholDTO.setMade_date(Date.valueOf(multi.getParameter("made_date")));
			alcholDTO.setMaker_num(Integer.parseInt(multi.getParameter("maker_num")));
			alcholDTO.setMaterial(multi.getParameter("material"));
			alcholDTO.setName(multi.getParameter("name"));
			alcholDTO.setPrice(Integer.parseInt(multi.getParameter("price")));
			alcholDTO.setAnum(Integer.parseInt(multi.getParameter("anum")));
			alcholDTO.setNum(Integer.parseInt(multi.getParameter("anum")));
			result = alcholDAO.update(alcholDTO);
			
			if(result > 0){
			String fname = multi.getParameter("fname");
			String oname = multi.getParameter("oname");
			AdminFileUploader adminFileUploader = new AdminFileUploader();
			AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
			AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
			AdminUploadDTO pastUpload = new AdminUploadDTO();
			pastUpload.setFname(fname);
			pastUpload.setOname(oname);

			adminUploadDTO=adminFileUploader.upload(multi, alcholDTO.getAnum(), "alchol").get(0);
			
			result2 =adminUploadDAO.update(adminUploadDTO, pastUpload);
			if(result2<=0){
				ArrayList<AdminUploadDTO> ar = adminFileUploader.upload(multi, alcholDTO.getAnum(), "alchol");
				for(AdminUploadDTO aDTO : ar){
					result2 = adminUploadDAO.uploadInsert(aDTO);					
				}
			}
			}
			

		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		if(result>0){
			request.setAttribute("message", "수정하였습니다.");
		}else{
			request.setAttribute("message", "실패하였습니다.");
		}

		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		request.setAttribute("path", "alcholView.alchol?anum="+alcholDTO.getAnum());

		return actionForward;
	}

}
