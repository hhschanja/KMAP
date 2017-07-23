package com.kmap.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.notice.NoticeDAO;
import com.kmap.notice.NoticeDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class NoticeServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		NoticeDAO ndao = new NoticeDAO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		BoardDTO bdto = null;
		List<AdminUploadDTO> ar = null;
		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			bdto = ndao.view(num);
			System.out.println(num);
			ar = adminUploadDAO.list(num, "notice");
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(bdto!=null){
			request.setAttribute("board", "notice");
			request.setAttribute("dto", bdto);
			request.setAttribute("files", ar);
			request.setAttribute("list", ar.size());
			
			actionFoward.setPath("boardView.jsp");
		}else {
			request.setAttribute("message", "접근권한이 없습니다.");
			request.setAttribute("path", "noticeList.notice");
			actionFoward.setPath("../common/result.jsp");
		}
		actionFoward.setCheck(true);
		return actionFoward;
	}

}
