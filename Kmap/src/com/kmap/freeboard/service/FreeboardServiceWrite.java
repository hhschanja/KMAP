package com.kmap.freeboard.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.freeboard.FreeboardDAO;
import com.kmap.freeboard.FreeboardDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.upload.FileUploader;
import com.kmap.upload.UploadDAO;
import com.kmap.upload.UploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FreeboardServiceWrite implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("freeboardWrite");
		ActionForward actionForward = new ActionForward();
		UploadDAO udao = new UploadDAO();
		FreeboardDAO fdao = new FreeboardDAO();
		FreeboardDTO fdto = new FreeboardDTO();
		
		int result = 0;
		
		String saveDirectory = request.getServletContext().getRealPath("upload");
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multi = null;
		File fi = new File(saveDirectory);
		
		if(!fi.exists()){
			fi.mkdirs();
		}
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			
			fdto.setKind(multi.getParameter("kind"));
			fdto.setWriter(multi.getParameter("writer"));
			fdto.setTitle(multi.getParameter("title"));
			fdto.setContents(multi.getParameter("contents"));
			
			result = fdao.write(fdto);
			
			FileUploader fileUploader = new FileUploader();
			List<UploadDTO> ar = fileUploader.fileUpload(multi, result, "freeboard");
			for(UploadDTO uploadDTO : ar){
				result = udao.uploadInsert(uploadDTO);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			actionForward.setCheck(false);
			actionForward.setPath("./freeboardList.freeboard");
		}else {
			request.setAttribute("message", "게시글 작성에 실패 하였습니다.");
			request.setAttribute("path", "./freeboardList.freeboard");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		
		
		
		return actionForward;
	}

}
