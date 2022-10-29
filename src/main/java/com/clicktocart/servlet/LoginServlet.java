package com.clicktocart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.clicktocart.dao.userDao;
import com.clicktocart.entity.User;
import com.clicktocart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//getting the username and password logged in login page
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		
		//Authentication
		User user = new userDao(FactoryProvider.getFactory()).getUserByEmailAndPassword(email, password);
		
		HttpSession httpsession = request.getSession();
		System.out.println(user);
		if(user == null) {
			httpsession.setAttribute("message", "Invalid User");
			response.sendRedirect("login.jsp");
		}
		else {
			//Admin User
			
			
			
			
			//Normal user
			httpsession.setAttribute("currentuser", user);
			if(user.getUserType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}

			else if(user.getUserType().equals("normal")) {
				response.sendRedirect("user.jsp");
			}
			else {
				PrintWriter out=response.getWriter();
				out.print("<h1>We couldnt identified the User Type</h1>");
			}
		}
	}

}
