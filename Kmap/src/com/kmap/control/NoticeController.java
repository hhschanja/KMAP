package com.kmap.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
 * Servlet implementation class BoardController
 */
@WebServlet("/BoardController")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HashMap<String, Action>  command;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init(ServletConfig config) throws ServletException {
    	command = new HashMap<>();
    	
    	String filepath = config.getServletContext().getRealPath("WEB-INF");
    	System.out.println(filepath);
    	String filename = config.getInitParameter("properties");
    	System.out.println(filename);
    	
    	FileInputStream fi = null;
    	Properties prop = new Properties();
    	
    	try {
			fi = new FileInputStream(new File(filepath, filename));
			prop.load(fi);
			Iterator<Object> it = prop.keySet().iterator();
			while(it.hasNext()){
				String key = (String)it.next();
				String value = (String)prop.get(key);
				Class obj = Class.forName(value);
				Object ins = obj.newInstance();
				command.put(key, (Action)ins);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fi.close();
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
		
		path = path.substring(request.getServletContext().getContextPath().length());
		Action action = null;
		ActionForward actionFoward = null;
		
		action = command.get(path);
		
		actionFoward = action.process(request, response);
		
		if(actionFoward.isCheck()){
			RequestDispatcher view = request.getRequestDispatcher(actionFoward.getPath());
			view.forward(request, response);
		}else {
			response.sendRedirect(actionFoward.getPath());
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
