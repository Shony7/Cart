package com.clicktocart.dao;

import java.util.List;

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
	
	public List<Products> getAllProducts(){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		List<Products> products = session.createQuery("From Products").list();
		System.out.println(products.size());
		return products;
	}
}
