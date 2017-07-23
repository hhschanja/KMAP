package com.kmap.alchol.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.alchol.AlcholDTO;
import com.kmap.reply.ReplyDAO;
import com.kmap.reply.ReplyDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;

public class AlcholServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
		AlcholDTO alcholDTO = new AlcholDTO();
		AdminUploadDAO adminUploadDAO = new AdminUploadDAO();
		AdminUploadDTO adminUploadDTO = new AdminUploadDTO();
		ReplyDAO rdao = new ReplyDAO();
		ReplyDTO rdto = new ReplyDTO();
		List<ReplyDTO> ar = null;
		int anum = 0;
		String atype = null;
		try{
			anum = Integer.parseInt(request.getParameter("anum"));
			adminUploadDTO = (adminUploadDAO.list(anum, "alchol")).get(0);
			atype = request.getParameter("atype");
			rdto.setType_num(anum);
			rdto.setType(request.getParameter("type"));
			ar = rdao.replyList(rdto);
		}catch(Exception e){
			
		}
		alcholDTO = (AlcholDTO)alcholDAO.view(anum);
		if(alcholDTO!=null){
			request.setAttribute("alchol", alcholDTO);
			request.setAttribute("upload", adminUploadDTO);
			request.setAttribute("reply", ar);
			actionForward.setCheck(true);
			actionForward.setPath("alcholView.jsp?anum="+anum);
			if(atype != null){
				request.setAttribute("atype", atype);
				
			}
		}else{
			actionForward.setCheck(true);
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "실패");
			request.setAttribute("path", "../index.jsp");
		}
		
		return actionForward;
	}

}
