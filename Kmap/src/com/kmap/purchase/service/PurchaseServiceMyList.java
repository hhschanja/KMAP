package com.kmap.purchase.service;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.member.MemberDTO;
import com.kmap.purchase.PurchaseDAO;
import com.kmap.sale.SaleDTO;
import com.kmap.upload.AdminUploadDAO;
import com.kmap.upload.AdminUploadDTO;
import com.kmap.util.PageMaker;
import com.kmap.util.PageResult;
import com.kmap.util.RowMaker;
public class PurchaseServiceMyList implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		PurchaseDAO pdao = new PurchaseDAO();
		List<SaleDTO> par = new ArrayList<>();
		AdminUploadDAO adao = new AdminUploadDAO();
		List<AdminUploadDTO> uar = new ArrayList<>();
		ArrayList<String> ha = new ArrayList<>();
		
			String member_id = ((MemberDTO)request.getSession().getAttribute("member")).getId();
			
		
			int curPage = 1;
			String kind = null;
			String search = null;
			
			try{
				curPage = Integer.parseInt(request.getParameter("curPage"));
				search = request.getParameter("search");
				kind = request.getParameter("kind");
			} catch(Exception e){
				e.printStackTrace();
			}	
			System.out.println(kind+kind+kind);
			if(kind==null){
				kind="title";
			}else if(kind.equals("")){
				kind="title";
			}
			
			PageMaker pageMaker = new PageMaker(curPage);
			RowMaker rowMaker = pageMaker.getRowMaker(kind, search);
			
			int totalCount = pdao.count(member_id);
			PageResult pageResult = pageMaker.getMakePage(totalCount);
			
			par = pdao.myList(rowMaker, member_id);
			
			
			for(int i=0;i<par.size();i++){ //글의 개수만큼 포문을 돌리는데
				uar = adao.purchaseList(par.get(i).getType_num(),"alchol","ticket"); // 하나의 글에 포함되어있는 파일 이름 불러오기
				
				for(int j=0; j<uar.size();j++){ //하나의 글이 가지고 있는 파일갯수만큼 
					String ah = uar.get(j).getFname(); //그 파일 이름을 추가하고
					ha.add(ah); //계속 그냥 추가......
				}
				
			}

		if(par!=null){
			af.setCheck(true);
			af.setPath("../member/memberView.jsp");
			request.setAttribute("purchaseList", par);
			request.setAttribute("board", "purchase");
			request.setAttribute("files", ha);
			request.setAttribute("pageResult", pageResult);
		}
		
		
		return af;
	}

}