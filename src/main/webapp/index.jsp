<%@page import="com.clicktocart.entity.Category"%>
<%@page import="com.clicktocart.dao.CategoryDao"%>
<%@page import="com.clicktocart.entity.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.clicktocart.dao.ProductDao"%>
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
	<!-- Navigation bar which you seeing with all the Register , Home , Login Options the below line is responsible for that -->
	<%@ include file="Common_js_css/navbar.jsp"%>

	<div class="container m-2">
		<%
		ProductDao productdao = new ProductDao();
		List<Products> list = productdao.getAllProducts();
		%>
		<div class="row">


			<div class="col-md-2 mt-2">
				<!-- 				Show Category -->

				<%
				CategoryDao catdao = new CategoryDao();
				List<Category> catList = catdao.listCatergoty();
				%>
				<div class="list-group">
					<div class="card-header custom-bg">Categories</div>
					<%
					for (Category cat : catList) {
					%>
					<a href="#" class="list-group-item list-group-item-action"><%=cat.getCategory_Title()%></a>
					<%
					}
					%>
				</div>
			</div>

			<!-- 			Displaying each Products -->
			<div class="col-md-10 mt-2">
				<small> Total no of Products <%=list.size()%></small>

				<div class="row">

					<%
						for(Products products:list){
					%>	
						
					<div class="col-md-4 mt-2">
						<div class="card" style="width: 18rem;">
							<img class="card-img-top w-75" src="img/products/<%=products.getpPic()%>" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title"><%=products.getpName() %></h5>
								<p class="card-text"><%=products.getpDescription()%></p>
								<p class="card-text">&#8377;<%=products.getpPrice()%></p>
								
							</div>
							<div class="card-footer">
							<button type="button" class="btn btn-primary">Add to Cart</button>
							</div>
						</div>
					</div>
					<% } %>
				</div>



			</div>
		</div>
	</div>

</body>
</html>