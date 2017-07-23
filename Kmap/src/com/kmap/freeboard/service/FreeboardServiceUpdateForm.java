package com.kmap.freeboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.board.BoardDTO;
import com.kmap.freeboard.FreeboardDAO;
import com.kmap.freeboard.FreeboardDTO;

import com.kmap.upload.UploadDAO;
import com.kmap.upload.UploadDTO;

public class FreeboardServiceUpdateForm implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		FreeboardDAO fdao = new FreeboardDAO();
		FreeboardDTO fdto = new FreeboardDTO();
		UploadDAO udao = new  UploadDAO();
		List<UploadDTO> ar = null;
		int num=0;
		try{
			num = Integer.parseInt(request.getParameter("num"));
			fdto = (FreeboardDTO) fdao.view(num);
			ar = udao.list(num, "freeboard");
		} catch (Exception e ){
			e.printStackTrace();
		}
		if(fdto!=null){
			request.setAttribute("board", "freeboard");
			request.setAttribute("boardList", fdto);
			request.setAttribute("upload", ar);
			actionForward.setCheck(true);
			actionForward.setPath("freeboardUpdateForm.jsp");
		} else {
			request.setAttribute("message", "데이터가 없습니다.");
			request.setAttribute("path", "freeboardList.freeboard");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		
		
		return actionForward;
	}

}
