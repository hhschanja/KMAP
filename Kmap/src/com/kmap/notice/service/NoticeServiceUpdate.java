package com.kmap.notice.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.notice.NoticeDAO;
import com.kmap.notice.NoticeDTO;
import com.kmap.upload.AdminFileUploader;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeServiceUpdate implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		NoticeDAO ndao = new NoticeDAO();
		NoticeDTO ndto = new NoticeDTO();
		AdminUploadDAO audao = new AdminUploadDAO();
		List<AdminUploadDTO >ar = null;
		
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
				ndto.setNum(Integer.parseInt(multi.getParameter("num")));
			}else {
			ndto.setNum(Integer.parseInt(multi.getParameter("num")));
			ndto.setTitle(multi.getParameter("title"));
			ndto.setContents(multi.getParameter("contents"));
			
			result = ndao.update(ndto);
			
			AdminFileUploader adminFileUploader = new AdminFileUploader();
			ar = adminFileUploader.upload(multi, ndto.getNum(), "notice");
			
			for(AdminUploadDTO adminUploadDTO : ar){
				result = audao.uploadInsert(adminUploadDTO);
			}
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		
		if(result>0){
			request.setAttribute("message", "수정하였습니다.");
			
		}else {
			request.setAttribute("message", "실패하였습니다. 수정하려는 내용을 다시 확인해 주세요");

		}
		request.setAttribute("path", "noticeView.notice?num="+ndto.getNum()+"&type=notice");
		actionFoward.setCheck(true);
		actionFoward.setPath("../common/result.jsp");
		return actionFoward;
	}

}
