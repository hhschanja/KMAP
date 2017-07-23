package com.kmap.notice.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.action.Action;
import com.kmap.board.BoardDTO;
import com.kmap.notice.NoticeDAO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.ws.api.server.EndpointAwareCodec;

public class NoticeServiceWrite implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("write");
		ActionForward actionFoward = new ActionForward();
		NoticeDAO ndao = new NoticeDAO();
		BoardDTO bdto = new BoardDTO();
		AdminUploadDAO adao = new AdminUploadDAO();
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
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			bdto.setWriter(multi.getParameter("writer"));
			bdto.setTitle(multi.getParameter("title"));
			bdto.setContents(multi.getParameter("contents"));
		
			result = ndao.write(bdto);	//1			
			
			AdminFileUploader adminFileUploader = new AdminFileUploader();
			List<AdminUploadDTO> ar = adminFileUploader.upload(multi, result, "notice");
			for(AdminUploadDTO adminUploadDTO : ar){
				result = adao.uploadInsert(adminUploadDTO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		if(result>0){
			actionFoward.setCheck(false);
			actionFoward.setPath("./noticeList.notice");
		} else {
			request.setAttribute("message", "게시글 작성에 실패하였습니다.");
			request.setAttribute("path", "./noticeList.notice");
			actionFoward.setCheck(true);
			actionFoward.setPath("../common/result.jsp");
		}
		
		
		
		
		return actionFoward;
	}

}
