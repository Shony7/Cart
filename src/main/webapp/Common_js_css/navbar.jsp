<%@page import="com.clicktocart.entity.User"%>
<%
User user1 = (User) session.getAttribute("currentuser");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common_js_css.jsp"%>
<%@ include file="common_modal.jsp"%>
<meta charset="UTF-8">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-info text-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">ClickToCart</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Category </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
				</ul>

				<%
				if (user1 == null) {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="mx-5"><a class="nav-link" href="" data-toggle="modal" data-target="#cart"><img
							src="img/cart-shopping-solid.png" class="" style="width: 22px"></img><span
							class="cart-item" style="font-weight: bold;">(4)</span></a></li>
					<li class="mx-5"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class=""><a class="nav-link" href="register.jsp">Register</a></li>
				</ul>
				<%
				} else {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="mx-5"><a class="nav-link" href="#"><%=user1.getUserName()%></a></li>
					<li class=""><a class="nav-link" href="LogoutServlet">Logout</a></li>
				</ul>
				<%
				}
				%>



			</div>
		</div>
	</nav>
</body>
</html>