package com.kmap.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;

/**
 * Servlet implementation class PurchaseController
 */
@WebServlet("/PurchaseController")
public class PurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Action> command;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	
command = new HashMap<>();
    	
    	//전체 주소
    	String filePath = config.getServletContext().getRealPath("WEB-INF");
    	System.out.println(filePath);
    	//config = 현재 서블릿의 설정 정보를 가지고 있는 애!! 여기서 다꺼내오면 되는거야
    	
    	//파일 이름 꺼내기
    	String fileName = config.getInitParameter("properties");
    	System.out.println(fileName);
    	
    	//파싱 준비
    	FileInputStream fi = null;
    	Properties prop = new Properties();
    	
    	try {
			fi = new FileInputStream(new File(filePath, fileName)); //파일 경로를 적어줘야하지이이
			prop.load(fi);
			
			Iterator<Object> it = prop.keySet().iterator();
			while(it.hasNext()){
				String key = (String)it.next();
				String value = (String)prop.get(key);
				
				Class c = Class.forName(value);
				Object o = c.newInstance();
				System.out.println(key);
				System.out.println(o);
				command.put(key, (Action)o);
				
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
			try {
				fi.close();  //닫아줘야지
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
    	
    
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRequestURI();
		path = path.substring(request.getServletContext().getContextPath().length()); //이렇게 쓰는걸 권장함 
	
		System.out.println(path); //path가 올바르지 않아서 command를 못해서 null이 뜨는거야
		
		Action action = command.get(path);
		ActionForward af = action.process(request, response);
		System.out.println(action);
		
		if(af.isCheck()){
			RequestDispatcher view = request.getRequestDispatcher(af.getPath());
			view.forward(request, response);
		}else{
			response.sendRedirect(af.getPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
