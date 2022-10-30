package com.clicktocart.servlet;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.clicktocart.dao.CategoryDao;
import com.clicktocart.dao.ProductDao;
import com.clicktocart.entity.Category;
import com.clicktocart.entity.Products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Fetching category data
			System.out.println("Entered the addcat");
			if (request.getParameter("operations").trim().equals("addCategory")) {
				//Getting all the input values from the Add Category for in the Admin page
				String cattitle = request.getParameter("catTitle");
				String catdesc = request.getParameter("catDesc");
				
				Category category = new Category(cattitle, catdesc);
				new CategoryDao().addCategory(category);
				
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("message", "Attributes Added");
				response.sendRedirect("admin.jsp");
			}
			else if(request.getParameter("operations").trim().equals("addProduct")) {
				//Getting all the input values from the Add Products for in the Admin page
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("prodDesc");
				int pPrice= Integer.parseInt(request.getParameter("prodPrice"));
				int pDiscount =Integer.parseInt(request.getParameter("prodDiscount"));
				int pQuantity =Integer.parseInt(request.getParameter("prodQuantity"));
				int pCat =Integer.parseInt(request.getParameter("prodCat"));
				Part part = request.getPart("pPic");
				
				//Creating new Product object and saving the values
				Products product = new Products();
				product.setpDescription(pDesc);
				product.setpDiscount(pDiscount);
				product.setpName(pName);
				product.setpPrice(pPrice);
				product.setpQuantity(pQuantity);
				//Just saving the name of the photo
				product.setpPic(part.getSubmittedFileName());
				//getting the category object and saving it in products
				product.setCategory(new CategoryDao().getCategoryById(pCat));
				
				//Saving PRoduct details in the database using DAO layer(Using DAO functions)
				new ProductDao().setProductDetails(product);
				
				
				//Saving the photo of products into folder present in the Project
				// TODO See if this part is right
				// TODO See if mysql driver is in TOMCAT Folder
				// TODO Might need to change when Safa intall this in her system
				//Path to Upload
				String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
				
				
				//Saving the photo to path
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
				//Reading the data
				byte[] data = new byte[is.available()];
				is.read(data);
				
				//writing the data
				fos.write(data);
				fos.close();
				is.close();
				
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product Details is saved");
				response.sendRedirect("admin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
