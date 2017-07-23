package com.kmap.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.notice.NoticeDAO;
import com.kmap.notice.NoticeDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;


public class NoticeServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		NoticeDAO ndao = new NoticeDAO();
		AdminUploadDAO audao = new AdminUploadDAO();
		BoardDTO bdto = null;
		List<AdminUploadDTO> ar = null;
		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			bdto = ndao.view(num);
			ar = audao.list(num, "notice");
		} catch (Exception e){
			e.printStackTrace();
		}
		
		if(bdto!=null){
			request.setAttribute("board", "notice");
			request.setAttribute("dto", bdto);
			request.setAttribute("upload", ar);
			actionFoward.setPath("boardUpdateForm.jsp");
		}else {
			request.setAttribute("message", "데이터가 없습니다.");
			request.setAttribute("path", "noticeList.notice");
			actionFoward.setPath("../common/result.jsp");
		}
		actionFoward.setCheck(true);
		
		return actionFoward;
	}

}
