package com.servlet;

import java.io.IOException;
import java.util.List;

import com.entities.Product;
import com.helper.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Message m=new Message("Payment Successfull", "text-white", "info");
		session.setAttribute("msg",m);
		response.sendRedirect("index.jsp");
		}

}
