<%@page import="com.clicktocart.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.clicktocart.dao.CategoryDao"%>
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
<link rel="stylesheet" href="custom.css">
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<%@ include file="Common_js_css/common_js_css.jsp"%>
	<%@ include file="Common_js_css/navbar.jsp"%>
	<%@ include file="Common_js_css/message.jsp"%>

	<div class="container admin-page w-75">
		<div class="row mt-5">
			<div class="col-md-4">
				<!-- First box -->
				<div class="card text-center">
					<div class="container">
						<img class="img-fluid w-25 rounded-circle" alt=""
							src="img/users.png">
					</div>
					<h1 class="text-uppercase text-muted">Name</h1>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-center">
					<div class="container">
						<img class="img-fluid w-25 rounded-circle" alt=""
							src="img/list.png">
					</div>
					<h1 class="text-uppercase text-muted">Category</h1>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-center">
					<div class="container">
						<img class="img-fluid w-25 rounded-circle" alt=""
							src="img/products.png">
					</div>
					<h1 class="text-uppercase text-muted">Products</h1>
				</div>
			</div>
		</div>
		<div class="container w-75">
			<div class="row mt-5">
				<div class="col-md-6">
					<!-- First box -->
					<div class="card text-center" data-toggle="modal"
						data-target="#add-product">
						<div class="container">
							<img class="img-fluid w-25 rounded-circle" alt=""
								src="img/plus.png">
						</div>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card text-center" data-toggle="modal"
						data-target="#add-category">
						<div class="container">
							<img class="img-fluid w-25 rounded-circle" alt=""
								src="img/keys.png">
						</div>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	Add Category modal -->
	<!-- Button trigger modal -->
	<!-- Button trigger modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-category" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<div class="form-group">
							<label for="">Category Title</label> <input type="text"
								class="form-control" id="catTitle" aria-describedby="catTitle"
								name="catTitle" placeholder="Title">
						</div>
						<div class="form-group">
							<label for="">Category Description</label> <input type="text"
								class="form-control" name="catDesc" id="catDesc"
								placeholder="Description">
						</div>
						<!-- 						Letting Servelt Know which form is comming -->
						<input type="hidden" name="operations" value="addCategory">
						<button type="submit" class="btn btn-primary">Save
							Category</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Add Category modal -->



	<!-- 	Add product modal -->
	<div class="modal fade" id="add-product" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" action="ProductOperationServlet" enctype="multipart/form-data">
						<div class="form-group">
							<label for="">Product Name</label> <input type="text"
								class="form-control" id="pName" aria-describedby="pName"
								name="pName" placeholder="Name"> <small id="catTitle"
								class="form-text text-muted">Enter the Name of Product</small>
						</div>
						<div class="form-group">
							<label for="">Product Description</label> <input type="text"
								class="form-control" style="height:150px" name="prodDesc" id="prodDesc"
								placeholder="Description">
						</div>
						<div class="form-group">
							<label for="">Price</label> <input type="text"
								class="form-control" name="prodPrice" id="prodPrice"
								placeholder="Price">
						</div>
						<div class="form-group">
							<label for="">Discount</label> <input type="number"
								class="form-control" name="prodDiscount" id="prodDiscount"
								placeholder="Product Discount">
						</div>
						<div class="form-group">
							<label for="">Product Quantity</label> <input type="number"
								class="form-control" name="prodQuantity" id="prodQuantity"
								placeholder="No of Quantity">
						</div>

						<%
						CategoryDao catdao = new CategoryDao();
						List<Category> list = catdao.listCatergoty();
						%>

						<div class="form-group">
							<select name="prodCat">
								<%
								for (Category c : list) {
								%>
								<option value=<%=c.getCategory_Id()%>><%=c.getCategory_Title()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group" style="">
							<label>Choose the Product Image</label><br> <input
								type="file" class="" name="pPic" id="inputGroupFile01">
						</div>
						<!-- 						Letting Servelt Know which form is comming -->
						<input type="hidden" name="operations" value="addProduct">
						<button type="submit" class="btn btn-primary mt-5">Save
							Product Details</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	End of Add Product Model -->
</body>
</html>