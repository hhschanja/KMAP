package com.kmap.pairing.service;

import java.util.List;

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

public class PairingServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();

		PairingDAO pdao = new PairingDAO();
		PairingDTO pdto = new PairingDTO();
		
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> newAr = null;
		List<AdminUploadDTO> pastAr = null;
		int result = 0;

		MultipartRequest multi = null;
		String saveDirectory = request.getServletContext().getRealPath("upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		int num =0;

		try {
			
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

			num = Integer.parseInt(multi.getParameter("num"));
			String title = multi.getParameter("title");
			String contents = multi.getParameter("contents");
			
			pdto.setNum(num);
			pdto.setTitle(title);
			pdto.setContents(contents);
			
			result = pdao.update(pdto); //글들만 먼저 업데이트하고
			
			if(result>0){
				AdminFileUploader adf = new AdminFileUploader(); 
				newAr = adf.upload(multi, num, "pairing"); // 새로 바꿀 파일이름들을 빼내오고

				pastAr = adao.list(num, "pairing"); //기존에 올라와있는 놈들 불러오기

				for(int i=0;i<pastAr.size();i++){

					result =adao.update(newAr.get(i),pastAr.get(i));

				}
			}

		} catch (Exception e) {
			result=0;
		}

		if(result>0){
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("message", "수정되었습니다");
			request.setAttribute("path","./pairingView.pairing?num="+num);
		}else{
			af.setCheck(true);
			af.setPath("../common/result.jsp");
			request.setAttribute("message", "ERROR");
			request.setAttribute("path","../index.jsp");
		}

		return af;
	}

}