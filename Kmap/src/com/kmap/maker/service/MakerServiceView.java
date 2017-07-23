package com.kmap.maker.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.alchol.AlcholDAO;
import com.kmap.alchol.AlcholDTO;
import com.kmap.maker.MakerDAO;
import com.kmap.maker.MakerDTO;
import com.kmap.product.ProductDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.RowMaker;

public class MakerServiceView implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward af = new ActionForward();
		AlcholDAO alcholDAO = new AlcholDAO();
		List<AdminUploadDTO> uar = null;
		ArrayList<String> ha = new ArrayList<>();
		PageMaker pageMaker = new PageMaker(1);
		RowMaker rowMaker = null;
		int totalCount = 0;
		
		
		MakerDAO mdao = new MakerDAO();
		MakerDTO mdto = null;
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> ar = null;
		
		
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			mdto = mdao.view(num);
			ar = adao.list(num, "maker");
			rowMaker = pageMaker.getRowMaker("maker_num", String.valueOf(num));
			totalCount = alcholDAO.count(rowMaker);
			
		} catch (Exception e) {
			mdto = null;
			ar=null;
		}
		List<ProductDTO> aar = alcholDAO.list(rowMaker);
		for(int i=0;i<aar.size();i++){ //글의 개수만큼 포문을 돌리는데
			uar = adao.list(aar.get(i).getNum(), "alchol"); // 하나의 글에 포함되어있는 파일 이름 불러오기
			
			for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
				String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
				ha.add(ah); //계속 그냥 추가......
			}
			
		}
		
		if(mdto!=null){
			request.setAttribute("maker", mdto);
			request.setAttribute("files", ar);
			request.setAttribute("alchol", aar);
			request.setAttribute("files2", ha);
			af.setCheck(true);
			af.setPath("./View.jsp");
			
		}else{
			request.setAttribute("message", "실패");
			request.setAttribute("path", "../index.jsp");
			af.setCheck(true);
			af.setPath("../common/result.jsp");
		}
		return af;
	}

}
