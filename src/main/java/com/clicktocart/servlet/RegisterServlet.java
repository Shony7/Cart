package com.clicktocart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.clicktocart.entity.User;
import com.clicktocart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			String userName;
			String userEmail;
			String userPassword;
			String userPhone;
			String userAddress;
			userName = request.getParameter("user_name");
			userEmail = request.getParameter("user_email");
			userPassword = request.getParameter("user_password");
			userPhone = request.getParameter("user_phone");
			userAddress = request.getParameter("user_address");

			// Storing the User Information into Database after registering using
			// register.jsp page
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			hibernateSession.persist(user);
			tx.commit();
			hibernateSession.clear();

			// Showing message to user after succesful registration using "message.jsp" page
			session = request.getSession();
			session.setAttribute("message", "Registration succesful");

			// Redirecting the page to Register Page with the Above message stored in
			// HttpSession
			// HttpSession stores the information we passed for samll period of time
			response.sendRedirect("register.jsp");
			return;
		} catch (Exception e) {
			//handle exception when username or mail is same
			session = request.getSession();
			session.setAttribute("message", "Registration failed username or email already exists");
			response.sendRedirect("register.jsp");
		}

	}

}
