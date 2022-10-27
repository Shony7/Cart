package com.clicktocart.dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.clicktocart.entity.User;

public class userDao {
	private SessionFactory sessionFactory;
	private User user=null;
	public userDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	//Getting user details by using username and password provided in login.jsp
	public User getUserByEmailAndPassword(String email, String password) {
		try {
			String query= "from User where userEmail=: e and userPassword=: p";
			Session session = this.sessionFactory.openSession();
			Query<Object> q= session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user = (User)q.uniqueResult();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
