package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;
import com.mysql.jdbc.PreparedStatement;

public class Userdao {
  private SessionFactory factory;

public Userdao(SessionFactory factory) {
	super();
	this.factory = factory;
}
			//get user by email and password
     public User getUserByEmailAndPassword(String email,String password)
           { 
    	 User user=null;
           try {
			    //hql hibernate query langugae
        	   String query="from  User  where userEmail=:e and userPassword=:p";
        	        Session session=   this.factory.openSession();
        	        Query q=   session.createQuery(query);
        	        q.setParameter("e",email);
        	        q.setParameter("p",password);
        	         user=   (User) q.uniqueResult();
        	          session.close();
		   } catch (Exception e) {
			e.printStackTrace();
		}
    	 return user;
    	  }
     public boolean UpdateUserDetails(User user) {
		   boolean f=false;
		   try {
			   Session session=   this.factory.openSession(); 
		      String query="update User set userName=:a, userEmail=:b,userPassword=:c,userPhone=:d,userAddress=:e  where userID=:x";
		      Query query2 = session.createQuery(query);
		      query2.setParameter("a",user.getUserName());
		      query2.setParameter("b",user.getUserEmail());
		      query2.setParameter("c", user.getUserPassword());
		      query2.setParameter("d",user.getUserPhone());
		      query2.setParameter("e",user.getUserAddress());
		      query2.setParameter("x",user.getUserID());
		      Transaction tx=session.beginTransaction();
		      query2.executeUpdate();
		      tx.commit();
		      session.close();
		      f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		   return f;
	   }
}
