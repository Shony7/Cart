<%@page import="com.clicktocart.entity.User"%>
<%
User user2 = (User)session.getAttribute("currentuser");
if(user2==null){
	session.setAttribute("message", "Invalid User Please Sign in");
	response.sendRedirect("login.jsp");
	return;
}
else{
	
}
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="Common_js_css/common_js_css.jsp" %>
<%@ include file="Common_js_css/navbar.jsp" %>

<meta charset="UTF-8">
<title><%=user2.getUserName()%> page</title>
</head>
<body>

</body>
</html>