package com.CoodeTeam.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.CoodeTeam.JavaBean.UserBean;;
public class UserServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
					HttpServletResponse response) throws ServletException,IOException{
		doGet(request,response);
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method = (String)request.getParameter("method");
		
		if(method == null){
			PrintWriter out=response.getWriter();
			out.println("invalid request");
		}else if(method.equals("login")){
			Login(request,response);
		}else if(method.equals("logout")){
			Logout(request,response);
		}else if(method.equals("register")){
			Register(request,response);
		}else if(method.equals("checkuser")){
			CheckUser(request,response);
		}else if(method.equals("adminlogin")){
			AdminLogin(request,response);
		}else if(method.equals("creatQuestionaire")){
			creatQuestionaire(request,response);
		}else if(method.equals("insertData")){
			insertData(request,response);
		}
	}
	
	private void AdminLogin(HttpServletRequest request,
			HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username == null||password == null){
			try {
				response.sendRedirect("admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		UserBean userBeann= new UserBean();
		
		boolean isAdmin = userBeann.admin(username, password);
		
		HttpSession session = request.getSession();
		if(isAdmin){
			
			session.setAttribute("username", username);
			session.setAttribute("userAuthority", 2);
			session.removeAttribute("loginfailed");
			
			try {
				response.sendRedirect("tse.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			try {
				
			    session.setAttribute("loginfailed", "loginfailed");
			    
				response.sendRedirect("admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
	}
	protected void Login(HttpServletRequest request,
			HttpServletResponse response){
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username == null||password == null){
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		UserBean userBeann= new UserBean();
		int isValid = userBeann.valid(username, password);
		
		HttpSession session = request.getSession();
		if(isValid!=0){
			
			session.setAttribute("username", username);
			session.setAttribute("UserID", isValid);
			session.removeAttribute("loginfailed");
			session.setAttribute("userAuthority", 1);
			String ip = request.getRemoteAddr();
			session.setAttribute("ip", ip);
			try {
				response.sendRedirect("index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			try {
				
			    session.setAttribute("loginfailed", "loginfailed");
			    
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
	}
	protected void Logout(HttpServletRequest request,
			HttpServletResponse response){
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void Register(HttpServletRequest request,
			HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String sex =request.getParameter("sex");
		String age =request.getParameter("age");
		String address = request.getParameter("address");
		if(username == null||password==null||password2==null||!password.equals(password2)){
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		UserBean userBean = new UserBean();
		boolean isExist = userBean.isExist(username);
		if(!isExist){
			userBean.add(username, password2, sex, age, address);
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
	}
	protected  void CheckUser(HttpServletRequest request,
			HttpServletResponse response){
		String user = request.getParameter("user"); 
		UserBean userBean = new UserBean();
		boolean isExist = userBean.isExist(user);
		if(isExist){
			System.out.print("true");
		}
		else{
			System.out.print("false");
		}
	}
	protected void creatQuestionaire(HttpServletRequest request,HttpServletResponse response){
		String title = request.getParameter("title");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");
		HttpSession session = request.getSession();
		int userid=(Integer) session.getAttribute("UserID");
		//String username;
		System.out.println(title);
		if(title == ""){
			try {
				response.sendRedirect("CreatQuestionaire.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }else{
	    	UserBean userbean = new UserBean();
		    try {
		    //	HttpSession session = request.getSession();
		    	//username = (String)session.getAttribute("");
		    	System.out.println(userid);
		    	userbean.addQuestionaire(title,subject,description,userid);
			    response.sendRedirect("que.jsp");
		    } catch (IOException e) {
			   // TODO Auto-generated catch block
		    	e.printStackTrace();
		      }
	    }
	}protected void insertData(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{

		String [] strArray = new String [100];
		String [] ans = new String [100];
		String [] type = new String [100];
		
		for ( int kk = 0;kk<100 ;kk++)
			ans[kk] = "";
					
		int i = 1;
		for(int t = 1;t<=100;t++){
			if(request.getParameter("A"+t) != null){
				strArray[i] =new String( request.getParameter("A"+t).getBytes("ISO8859_1"),"UTF-8");
				type[i] = "单选";
				int option = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i] +"["+option+"]"+new String(request.getParameter(t+"-"+m).getBytes("ISO8859_1"),"UTF-8");
						option++;
					}
				}
				i++;
			}
			else if(request.getParameter("B"+t) != null){
				strArray[i] = new String(request.getParameter("B"+t).getBytes("ISO8859_1"),"UTF-8");
				type[i] = "多选";
				int op = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i] +"["+op+"]"+new String(request.getParameter(t+"-"+m).getBytes("ISO8859_1"),"UTF-8");
						op++;
					}
				}
				i++;
			}
			else if(request.getParameter("C"+t) != null){
				strArray[i] = new String(request.getParameter("C"+t).getBytes("ISO8859_1"),"UTF-8");
				type[i] = "判断";
				i++;
			}
			else if(request.getParameter("D"+t) != null){
				strArray[i] = new String(request.getParameter("D"+t).getBytes("ISO8859_1"),"UTF-8");
				type[i] = "问答";
				i++;
			}
		}

		for(int count =1 ;count<i;count++){
			System.out.println(strArray[count]);
			System.out.println(ans[count]);
		}
		
		
	    HttpSession session = request.getSession();
	   int userid=(Integer) session.getAttribute("UserID");

		try {
			
			UserBean userbean = new UserBean();
			int queid  = userbean.getid(userid);
			System.out.println(queid);
	    	userbean.additem(i-1,strArray,ans,type,queid);
	    	response.sendRedirect("MyQA.jsp");
	    	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
	}

}
