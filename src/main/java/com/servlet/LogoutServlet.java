package com.servlet;

import java.io.IOException;
import com.helper.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=	request.getSession();
	session.removeAttribute("current-user");
	Message m=new Message("Logout successful!!", "text-white", "info");
	session.setAttribute("msg",m);
	response.sendRedirect("Login.jsp");
	
	}

}
