<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>YouSong - Login</title>
	
		<!-- Custom fonts for this template-->
		<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
		<!-- Custom styles for this template-->
		<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
	
	</head>
	
	<body class="bg-gradient-primary">
		<div class="container">
			<!-- Outer Row -->
			<div class="row justify-content-center align-items-center vh-100">
				<div class="col-xl-10 col-lg-12 col-md-9">
					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
								<div class="col-lg-6">
									<div class="p-5">
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
										</div>
										<form id="loginForm" class="user" method="POST" action="${pageContext.request.contextPath}/login">
											<div class="form-group">
												<input type="email" class="form-control form-control-user" id="userEmail"
													aria-describedby="emailHelp" placeholder="Enter Email Address..." name="userEmail"
													required="required">
											</div>
											<div class="form-group">
												<input type="password" class="form-control form-control-user" id="userPassword"
													placeholder="Password" name="userPassword" required="required">
											</div>
											<a href="javascript:{}" onclick="login()" class="btn btn-primary btn-user btn-block">
												Login
											</a>
											<div id="invalidFormContainer" class="d-none">
												<hr>
												<div class="card mb-4 py-3 border-bottom-danger">
													<div class="card-body text-center">
														Email or password are not filled in correctly.
													</div>
												</div>
											</div>
											<%
												Boolean userNotFound = request.getAttribute("userNotFound") != null ? Boolean.parseBoolean(request.getAttribute("userNotFound").toString()) : false;
											%>
											<div id="userNotFoundContainer" class="<%= (!userNotFound ? "d-none" : "") %>">
												<hr>
												<div class="card mb-4 py-3 border-bottom-danger">
													<div class="card-body text-center">
														User not found. Try again.
													</div>
												</div>
											</div>
											<%
												Boolean sessionExpired = request.getAttribute("sessionExpired") != null ? Boolean.parseBoolean(request.getAttribute("sessionExpired").toString()) : false;
											%>
											<div id="sessionExpiredContainer" class="<%= (!sessionExpired ? "d-none" : "") %>">
												<hr>
												<div class="card mb-4 py-3 border-bottom-danger">
													<div class="card-body text-center">
														Session expired. Try to login again.
													</div>
												</div>
											</div>
										</form>
										<hr>
										<div class="text-center">
											<a class="small" href="register.html">Create an Account!</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Bootstrap core JavaScript-->
		<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
		<!-- Core plugin JavaScript-->
		<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
	
		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
	
		<!-- Custom scripts to validate login form-->
		<script src="${pageContext.request.contextPath}/js/login-form-validation.js"></script>
	</body>

</html>