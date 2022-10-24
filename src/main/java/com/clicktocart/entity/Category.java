package com.clicktocart.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int category_Id;
	private String category_Title;
	private String category_Description;
	@OneToMany(mappedBy = "category")
	private List<Products> products=new ArrayList<>(); 
	
	
	
	public Category(int category_Id, String category_Title, String category_Description, List<Products> products) {
		super();
		this.category_Id = category_Id;
		this.category_Title = category_Title;
		this.category_Description = category_Description;
		this.products = products;
	}
	public Category(int category_Id, String category_Title, String category_Description) {
		this.category_Id = category_Id;
		this.category_Title = category_Title;
		this.category_Description = category_Description;
	}
	public Category( String category_Title, String category_Description) {
		super();
		this.category_Title = category_Title;
		this.category_Description = category_Description;
	}
	public Category() {
		
	}
	
	@Override
	public String toString() {
		return "Category [category_Id=" + category_Id + ", category_Title=" + category_Title + ", category_Description="
				+ category_Description + ", products=" + products + "]";
	}
	public int getCategory_Id() {
		return category_Id;
	}
	public void setCategory_Id(int category_Id) {
		this.category_Id = category_Id;
	}
	public String getCategory_Title() {
		return category_Title;
	}
	public void setCategory_Title(String category_Title) {
		this.category_Title = category_Title;
	}
	public String getCategory_Description() {
		return category_Description;
	}
	public void setCategory_Description(String category_Description) {
		this.category_Description = category_Description;
	}
	public List<Products> getProducts() {
		return products;
	}
	public void setProducts(List<Products> products) {
		this.products = products;
	}
	
	
}
