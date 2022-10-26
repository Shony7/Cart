<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="Common_js_css/common_js_css.jsp"%>
</head>
<body style="background-color: #58c4c3;">
	<%@ include file="Common_js_css/navbar.jsp"%>
	<div class="container w-50 my-4">
		<div class="card px-5">

			<div class="card-body">
				<img
					src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp"
					class="w-100"
					style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
					alt="Sample photo">
				<h3 class="text-center">Sign Up Here</h3>
				<div class="">
					<form class="">
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="userName">Username</label> <input type="text"
									class="form-control" id="userName" placeholder="Username">
							</div>
							<div class="form-group col-md-12">
								<label for="inputEmail">Email</label> <input type="email"
									class="form-control" id="inputEmail" placeholder="Email">
							</div>
							<div class="form-group col-md-12">
								<label for="inputPassword">Password</label> <input
									type="password" class="form-control" id="inputPassword"
									placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress">Address</label> <input type="text"
								class="form-control" id="inputAddress"
								placeholder="1234 Main St">
						</div>
						<div class="form-group">
							<label for="phoneNumber">Phone Number</label> <input type="text"
								class="form-control" id="phoneNumber"
								placeholder="+91 XXXXXXXXX">
						</div>
						<button type="submit" class="btn btn-primary">Register</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>