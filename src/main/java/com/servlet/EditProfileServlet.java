package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.Userdao;
import com.entities.User;
import com.helper.FactoryProvider;
import com.helper.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("html/text");
		PrintWriter out=response.getWriter();
		try {
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String phone=request.getParameter("user_phone");
			String address=request.getParameter("user_address");
		     HttpSession session=request.getSession();
			User user=	(User) session.getAttribute("current-user");
		  if (user==null) {
			System.out.println("null xa hai");
		}
	       user.setUserName(name);
	      String namsString= user.getUserName();
	      System.out.println(namsString);
			user.setUserName(name);
			user.setUserEmail(email);
			user.setUserPassword(password);
			user.setUserPhone(phone);
			user.setUserAddress(address);
			Userdao udao=new Userdao(FactoryProvider.getFactory());
		   Boolean b=	udao.UpdateUserDetails(user);
			Message m=new Message("Your Profile is  edited successfully", "text-white", "info");
			session.setAttribute("msg",m);
			response.sendRedirect("index.jsp");
	}catch (Exception e) {
	e.printStackTrace();
	}
	}
	
}
