package com.kmap.reply.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.RowMaker;

public class ReplyServiceWriteQ implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar = null;
		int result = 0;
		int type_num = Integer.parseInt(request.getParameter("type_num"));
		
		try{
			rdto.setType(request.getParameter("type"));
			rdto.setType_num(type_num);
			rdto.setWriter(request.getParameter("writer"));
			rdto.setContents(request.getParameter("contents"));
			
			System.out.println("댓글정보");
			System.out.println(rdto.getContents());
			System.out.println(rdto.getType());
			System.out.println(rdto.getType_num());
			System.out.println(rdto.getWriter());
			result = rdao.write(rdto);
			
			ar = rdao.replyList(rdto);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("reply", ar);
			actionForward.setCheck(true);
			actionForward.setPath("replyQ.jsp?num="+type_num);
		}else {
			request.setAttribute("message", "댓글 실패");
			request.setAttribute("path", "questionView.question");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		return actionForward;
	}

}
