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
	
	<div>
		<form action="LoginServlet" method="post" class="">
			<section class="vh-100" style="background-color: #508bfc;">
				<div class="container py-5 h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-12 col-md-8 col-lg-6 col-xl-5">
							<div class="card shadow-2-strong" style="border-radius: 1rem;">
							<%@include file="Common_js_css/message.jsp"%>
								<div class="card-body p-5">

									<h3 class="mb-5">Sign in</h3>

									<div class="form-outline mb-4">
										<label class="form-label" for="typeEmailX-2">Email</label> <input
											type="email" id="typeEmailX-2" name="user_email"
											class="form-control form-control-lg" />
									</div>

									<div class="form-outline mb-4">
										<label class="form-label" for="typePasswordX-2">Password</label>
										<input type="password" id="typePasswordX-2" name="user_password" 
											class="form-control form-control-lg" />
									</div>
									<button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
	</div>
</body>
</html>