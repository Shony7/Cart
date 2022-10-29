package com.clicktocart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.clicktocart.entity.Products;
import com.clicktocart.helper.FactoryProvider;

public class ProductDao {
	private SessionFactory sessionFactory = FactoryProvider.getFactory();
	
	
	public void setProductDetails(Products products) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(products);
		tx.commit();
		session.close();
	}
}
