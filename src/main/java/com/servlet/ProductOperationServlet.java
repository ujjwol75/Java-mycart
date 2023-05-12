package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import com.dao.Categorydao;
import com.dao.Productdao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;
import com.helper.Message;
import com.helper.picupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("html/text");
		PrintWriter out=response.getWriter();
			String op=	request.getParameter("operation");
			if (op.trim().equals("addcategory")) {
				//fetchjng data
			    String catTitle= request.getParameter("catTitle");
			    String catDesc=  request.getParameter("catDescription");
			    Category category=new Category();
			    category.setCategoryTitle(catTitle);
			    category.setCategoryDescription(catDesc);
			    
			    //saving data in category
			    Categorydao catdao=new Categorydao(FactoryProvider.getFactory());
			 int catid=  catdao.saveCategory(category);
			 out.println(catid+"category saved");
			 Message m=new Message("category added successfully","","catmsg ");
			 HttpSession session=request.getSession();
			 session.setAttribute("msg",m);
			 response.sendRedirect("admin.jsp");
			 }
			else if (op.trim().equals("addproduct")) {
				//fetching data for product
				
				String proName=request.getParameter("proTitle");
				String proDescrip=request.getParameter("proDescription");
				int proPrice=Integer.parseInt(request.getParameter("proPrice"));
				int proDiscount=Integer.parseInt(request.getParameter("proDiscount"));
				int proQuantity=Integer.parseInt(request.getParameter("proQuantity"));
			 	int catID=Integer.parseInt(request.getParameter("catID"));
			 	Part part=request.getPart("pPic");
			 	 String filp=part.getSubmittedFileName();
			 	Product p=new Product();
			 	p.setProductName(proName);
			 	p.setProductDescription(proDescrip);
			 	p.setProductPrice(proPrice);
			 	p.setProductDiscount(proDiscount);
			 	p.setProductQuantity(proQuantity);
			 	p.setProductPic(filp);
			 
			 	//get category by id	
			 	Categorydao c=new Categorydao(FactoryProvider.getFactory());
			    Category cat=	c.getcatByid(catID);
			    //set category
			    p.setCategory(cat);
			        Productdao pdao=new Productdao(FactoryProvider.getFactory());
			     Boolean b= pdao.saveProduct(p);
			     //picture  upload
//			     find path to upload in specific folder named img/products
			     String path= request.getRealPath("img") +File.separator+"products"+File.separator+filp; 
			     System.out.println(path);
			     //uploading code
			    FileInputStream is=(FileInputStream) part.getInputStream();
			    picupload pic=new picupload();
		     	pic.uploadfile(is, path);
	  
				if (b==true) {
					 Message m=new Message("Product added successfully","","padd ");
					 HttpSession session=request.getSession();
					 session.setAttribute("msg",m);
					 response.sendRedirect("admin.jsp");
					 return;
				}
				else {
					 Message m=new Message("Product added failed","","perror");
					 HttpSession session=request.getSession();
					 session.setAttribute("msg",m);
					 response.sendRedirect("admin.jsp");
				}
				
			}
				
			}

}
