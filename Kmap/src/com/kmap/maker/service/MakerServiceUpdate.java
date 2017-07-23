package com.kmap.maker.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.maker.MakerDAO;
import com.kmap.maker.MakerDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MakerServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {

		ActionForward af = new ActionForward();

		MakerDAO mdao = new MakerDAO();
		MakerDTO mdto = new MakerDTO();
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> newAr = null;
		List<AdminUploadDTO> pastAr = null;
		int result = 0;
		int result2= 0;

		MultipartRequest multi = null;
		String saveDirectory = request.getServletContext().getRealPath("upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		int num =0;

		try {

			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

			num = Integer.parseInt(multi.getParameter("num"));
			String name = multi.getParameter("name");
			String phone = multi.getParameter("phone");
			String ceo = multi.getParameter("ceo");
			Date establish = Date.valueOf(multi.getParameter("establish"));
			String site = multi.getParameter("site");
			String contents = multi.getParameter("contents");
			int address_num = Integer.parseInt(multi.getParameter("address_num"));
			String address_main = multi.getParameter("address_main");
			String address_detail = multi.getParameter("address_detail");

			mdto.setNum(num);
			mdto.setName(name);
			mdto.setPhone(phone);
			mdto.setCeo(ceo);
			mdto.setEstablish(establish);
			mdto.setSite(site);
			mdto.setContents(contents);
			mdto.setAddress_num(address_num);
			mdto.setAddress_main(address_main);
			mdto.setAddress_detail(address_detail);

			result = mdao.update(mdto); //글들만 먼저 업데이트하고
			
			
			if(result > 0){
				String fname = multi.getParameter("fname");
				String oname = multi.getParameter("oname");
				AdminFileUploader adminFileUploader = new AdminFileUploader();
				AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
				AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
				AdminUploadDTO pastUpload = new AdminUploadDTO();
				pastUpload.setFname(fname);
				pastUpload.setOname(oname);

				adminUploadDTO=adminFileUploader.upload(multi, mdto.getNum(), "maker").get(0);
				
				result2 =adminUploadDAO.update(adminUploadDTO, pastUpload);
				System.out.println("999999:"+result2);
				
				if(result2<=0){
					ArrayList<AdminUploadDTO> ar = adminFileUploader.upload(multi, mdto.getNum(), "maker");
					for(AdminUploadDTO aDTO : ar){
						result2 = adminUploadDAO.uploadInsert(aDTO);					
					}
				}
				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(result>0){
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("message", "수정되었습니다.");
			request.setAttribute("path","./makerView.maker?num="+num);
		}else{
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("message", "ERROR");
			request.setAttribute("path","../index.jsp");
		}

		return af;
	}

}