package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.Category;
import com.entities.Product;

public class Productdao {
	 private SessionFactory factory;

	 public Productdao(SessionFactory  factory) {
	 	super();
	 	this.factory = factory;
	 }
	 public boolean saveProduct(Product product)
	 { 
		 boolean b=false;
            try {
            	Session session=this.factory.openSession();
            	org.hibernate.Transaction tx=session.beginTransaction();
                session.save(product);
            	tx.commit();
   	    	    session.close();
   	        	 b=true;
			} catch (Exception e) {
				e.printStackTrace();
				b=false;
			}
            return b;
	 }
	 
	 //get all products
	 public List<Product> getProducts(){
			Session session=	 this.factory.openSession();
			Query<Product> li=	 session.createQuery("from Product");
			  List<Product> list=   li.list();
			  return list;
			 }
	 //get prdoct by catid
	 public List<Product> getProducbyId(int cid){
			Session session=	 this.factory.openSession();
			Query<Product> li=	 session.createQuery("from Product as p where p.category.categoryId=:id");
			li.setParameter("id",cid);
			  List<Product> list=   li.list();
			  return list;
			 }
}
