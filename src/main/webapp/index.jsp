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
		String cat_id = request.getParameter("category");
		List<Products> list = productdao.getAllProducts();
		int catid = 0;
		if (cat_id != null && cat_id.trim().equals("all")) {
			list = productdao.getAllProducts();
		} else if (cat_id != null) {
			catid = Integer.parseInt(cat_id);
			list = productdao.getProductsByCatId(catid);
		}
		%>
		<div class="row">


			<div class="col-md-2 mt-2">
				<!-- 				Show Category -->

				<%
				CategoryDao catdao = new CategoryDao();
				List<Category> catList = catdao.listCatergoty();
				%>
				<div class="list-group">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active">All
						Categories</a>
					<%
					for (Category cat : catList) {
					%>
					<a href="index.jsp?category=<%=cat.getCategory_Id()%>"
						class="list-group-item list-group-item-action"><%=cat.getCategory_Title()%></a>
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
					for (Products products : list) {

						//Calculate Price after discount
						double discount = products.getpPrice() - (products.getpPrice() * (products.getpDiscount() * 0.01));
					%>

					<div class="col-md-3 mt-2 h-75">
						<div class="card w-100 product-card" style="width: 18rem;">

							<img class="card-img-top"
								src="img/products/<%=products.getpPic()%>" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title"><%=products.getpName()%></h5>
								<p class="card-text mb-1"><%=products.getpDescription()%></p>

								<p class="mt-1 mb-1">
									&#8377;<%=discount%></p>
								<p class="card-text text-secondary discount-label">
									<%=products.getpDiscount() + "% off of " + products.getpPrice()%></p>
							</div>
							<div class="card-footer text-center ">
								<button type="button" class="btn btn-primary"
									onclick="add_to_cart(<%=products.getpId()%>, '<%=products.getpName()%>', <%=products.getpPrice()%>)">Add
									to Cart</button>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>



			</div>
		</div>
	</div>

</body>
</html>