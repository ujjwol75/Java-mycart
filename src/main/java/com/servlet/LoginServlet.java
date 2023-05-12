package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.Userdao;
import com.entities.User;
import com.helper.FactoryProvider;
import com.helper.Message;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.setContentType("html/text");	
       PrintWriter out=response.getWriter();
       
       //fetch data from login.jsp
     String email=   request.getParameter("email");
     String password=  request.getParameter("password");
     	
   //authenticate user  
     Userdao udao=new Userdao(FactoryProvider.getFactory());
     User u= udao.getUserByEmailAndPassword(email, password);
 	HttpSession s=request.getSession();
      if (u==null) {
		Message m=new Message("Invalid details!!Login failed", "text-white", "danger");
		s.setAttribute("msg",m);
		response.sendRedirect("Login.jsp");
		return;
      }else {
    	  //login 
    	 s.setAttribute("current-user",u);
        //for admin-user
    	 if (u.getUserType().equals("adminUser")) {
			response.sendRedirect("admin.jsp");
		}//for normal user
    	 else if (u.getUserType().equals("normalUser")) {
			response.sendRedirect("index.jsp");
		}
    	 else {
    		 Message m=new Message("we havnot identified user-type", "text-white", "warning");
    			s.setAttribute("msg",m);
    			response.sendRedirect("Login.jsp");
		}
	}
	}
}
