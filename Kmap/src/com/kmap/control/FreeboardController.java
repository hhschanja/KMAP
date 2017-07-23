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
 * Servlet implementation class FreeboardController
 */
@WebServlet("/FreeboardController")
public class FreeboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Action> command;      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardController() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init(ServletConfig config) throws ServletException {
    	command = new HashMap<>();
    	String filePath = config.getServletContext().getRealPath("WEB-INF");
    	String fileName = config.getInitParameter("properties");
    	
    	FileInputStream fileInputStream = null;
    	Properties prop = new Properties();
    	
    	try {
			fileInputStream = new FileInputStream(new File(filePath, fileName));
			prop.load(fileInputStream);
			Iterator<Object> it = prop.keySet().iterator();
			while(it.hasNext()){
				String key = (String)it.next();
				String value = (String)prop.get(key);
				Class obj = Class.forName(value);
				Object in = obj.newInstance();
				command.put(key, (Action) in);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRequestURI();
		path = path.substring(request.getContextPath().length());
		Action action = null;
		ActionForward actionForward = null;
		action = command.get(path);
		System.out.println(action);
		actionForward = action.process(request, response);
		if(actionForward.isCheck()){
			RequestDispatcher view = request.getRequestDispatcher(actionForward.getPath());
			view.forward(request, response);
		}else{
			response.sendRedirect(actionForward.getPath());
			
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
