package com.dao;

import java.util.List;

import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.Category;

public class Categorydao {
	 private SessionFactory factory;

	 public Categorydao(SessionFactory  factory) {
	 	super();
	 	this.factory = factory;
	 }
	 public int saveCategory(Category cat)
	 {

			Session session=this.factory.openSession();
			org.hibernate.Transaction tx=session.beginTransaction();
	      int  catid=(Integer)session.save(cat);
				tx.commit();
	    	 session.close();
	   	 return catid;
	 }
	 public List<Category> getCategories(){
	Session session=	 this.factory.openSession();
	Query<Category> li=	 session.createQuery("from Category");
	  List<Category> list=   li.list();
	  return list;
	 }
	 public Category getcatByid(int cid) {
		 Category c=null;
		 try {
		Session s=	this.factory.openSession();
	     c=s.get(Category.class,cid);
	     s.close();
	     } catch (Exception e) {
			e.printStackTrace();
		}
		 return c;
	 }
	 }
