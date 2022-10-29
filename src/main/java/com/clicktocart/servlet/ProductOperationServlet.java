package com.clicktocart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.clicktocart.dao.CategoryDao;
import com.clicktocart.dao.ProductDao;
import com.clicktocart.entity.Category;
import com.clicktocart.entity.Products;
import com.clicktocart.helper.FactoryProvider;

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
				
				
				//new ProductDao().setProductDetails(product);
				
				
				//Saving the photo of products into folder present in the Project
				// TODO See if this part is right
				// TODO See if mysql driver is in TOMCAT Folder
				//Might need to change when Safa intall this in her system
				System.out.println(request.getRealPath("img"));
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product Details is saved");
				response.sendRedirect("admin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
