package com.clicktocart.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.clicktocart.entity.Category;
import com.clicktocart.helper.FactoryProvider;

public class CategoryDao {
	SessionFactory sessionFactory = FactoryProvider.getFactory();


	public void addCategory(Category category) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(category);
		
		tx.commit();
		session.close();
	}
	
	public List<Category> listCatergoty(){
		
		Session session = sessionFactory.openSession();
		Query<Category> query = session.createQuery("from Category");
		List<Category> list = query.list();
		
		session.close();
		return list;
	}
	
	public Category getCategoryById(int id) {
		Category category = null;
		try {
			Session session = sessionFactory.openSession();
			category = session.get(Category.class, id);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
}
