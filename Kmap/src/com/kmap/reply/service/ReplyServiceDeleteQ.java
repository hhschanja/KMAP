package com.kmap.reply.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;

public class ReplyServiceDeleteQ implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar =null;
		int result = 0;
		int type_num = Integer.parseInt(request.getParameter("type_num"));
		
		try{
			rdto.setNum(Integer.parseInt(request.getParameter("id")));
			rdto.setType(request.getParameter("type"));
			rdto.setType_num(type_num);
			
			result = rdao.replyDelete(rdto.getNum());
			
			ar = rdao.replyList(rdto);

			for(int i=0;i<ar.size();i++){
				System.out.println("댓글정보");
				System.out.println(ar.get(i).getWriter());
				System.out.println(ar.get(i).getContents());
				System.out.println(ar.get(i).getReg_date());
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			request.setAttribute("reply", ar);
			actionForward.setCheck(true);
			actionForward.setPath("replyQ.jsp?num="+type_num);
		}else {
			request.setAttribute("message", "삭제실패");
			request.setAttribute("path", "questionView.question");
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
		}
		
		
		return actionForward;
	}

}
