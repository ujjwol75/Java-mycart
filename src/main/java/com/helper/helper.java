package com.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class helper {
public static Map<String,Long> getcounts(SessionFactory factory) {
  Session	sesssionn=factory.openSession();
  String q1="select count(*)from User";
  String q2="select count(*)from Product";
 Query qu1= sesssionn.createQuery(q1);
 Query qu2= sesssionn.createQuery(q2);
Long usercount =(Long)qu1.list().get(0);
Long productcount =(Long)qu2.list().get(0);
Map<String,Long> map=new HashMap<String, Long>();
map.put("usercount",usercount);
map.put("productcount", productcount);
sesssionn.close();
return map;
}
}
