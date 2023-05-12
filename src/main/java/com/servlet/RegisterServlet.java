package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Session;
import com.entities.User;
import com.helper.FactoryProvider;
import com.helper.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("html/text");
		PrintWriter out=response.getWriter();
		try {
			String name=request.getParameter("u_name");
			String email=request.getParameter("u_email");
			String password=request.getParameter("u_password");
			String phone=request.getParameter("u_phone");
			String address=request.getParameter("u_address");
			

			//creating user object to store data
			User user=new User(name, email, password, phone,"default.jpg", address,"normalUser");
			
			//hibernate factory session 
		     Session hibernatesession=	(Session) FactoryProvider.getFactory().openSession();
		    org.hibernate.Transaction hibernateTransaction=hibernatesession.beginTransaction();
		    int userId=  (Integer) hibernatesession.save(user);
		     hibernateTransaction.commit();
		    hibernatesession.close();
		    out.print("successfully saved");
		    out.print(userId);
		    HttpSession httpsession=request.getSession();
		   
		    return;
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

}

