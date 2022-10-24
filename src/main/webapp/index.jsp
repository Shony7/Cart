<%@page import="com.clicktocart.helper.FactoryProvider"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="Common_js_css/common_js_css.jsp"%>

<meta charset="UTF-8">
<title>ClickToCart</title>
</head>
<body>
	<%@ include file="Common_js_css/navbar.jsp"%>
	<h1>Hello World</h1>
	<h1>Creating Session Facotry</h1>
	<%
	out.print(FactoryProvider.getFactory());
	%>
</body>
</html>