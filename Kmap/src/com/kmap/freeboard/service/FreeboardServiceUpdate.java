package com.kmap.freeboard.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.freeboard.FreeboardDAO;
import com.kmap.freeboard.FreeboardDTO;
import com.kmap.upload.FileUploader;
import com.kmap.upload.UploadDAO;
import com.kmap.upload.UploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FreeboardServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		FreeboardDTO fdto = new FreeboardDTO();
		
		UploadDAO udao = new UploadDAO();
		List<UploadDTO> ar = null;
		
		int result = 0; 
		
		
		String saveDirectory = request.getServletContext().getRealPath("upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*10;//10 메가바이트
		String encoding = "UTF-8";
		
		MultipartRequest multi = null;
		File fi = new File(saveDirectory);
		if(!fi.exists()){
			fi.mkdirs();
		}
		
		try{
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			if(multi.getParameter("title").equals("")){
				result=0;
				fdto.setNum(Integer.parseInt(multi.getParameter("num")));
			}else {
			fdto.setNum(Integer.parseInt(multi.getParameter("num")));
			fdto.setKind(multi.getParameter("kind"));
			fdto.setTitle(multi.getParameter("title"));
			fdto.setContents(multi.getParameter("contents"));
			
			result = fdao.update(fdto);
			
			FileUploader fileUploader = new FileUploader();
			ar = fileUploader.fileUpload(multi, fdto.getNum(), "freeboard");
			
			for(UploadDTO uploadDTO : ar){
				result = udao.uploadInsert(uploadDTO);
			}
			
			
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("message", "수정하였습니다." );
		}else {
			request.setAttribute("message", "실패하였습니다. 수정하려는 내용을 확인 해주세요");
		}
		request.setAttribute("path", "freeboardView.freeboard?type=freeboard&num="+fdto.getNum());
		actionForward.setCheck(true);
		actionForward.setPath("../common/result.jsp");
		return actionForward;
	}

}
