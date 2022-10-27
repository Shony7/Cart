<%@page import="com.clicktocart.entity.User"%>
<%
User user = (User) session.getAttribute("currentuser");
if (user == null) {
	session.setAttribute("message", "Invalid user please sign in or register");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You dont have the access to visit admin page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<%@ include file="Common_js_css/common_js_css.jsp"%>
	<%@ include file="Common_js_css/navbar.jsp"%>

</body>
</html>