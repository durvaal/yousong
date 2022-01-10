<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>YouSong - Not Found Page</title>
	
		<%@ include file="components/defaultHeadImports.jsp" %>
	
	</head>
	
	<body id="page-top">
	
		<!-- Page Wrapper -->
		<div id="wrapper" class="vh-100">
	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
	
				<!-- Main Content -->
				<div id="content" class="d-flex align-items-center">
	
					<!-- Begin Page Content -->
					<div class="container-fluid">
	
						<!-- 404 Error Text -->
						<div class="text-center">
							<div class="error mx-auto" data-text="404">404</div>
							<p class="lead text-gray-800 mb-5">Page Not Found</p>
							<p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p>
							<a href="${pageContext.request.contextPath}/dashboard">&larr; Back to Dashboard</a>
						</div>
	
					</div>
					<!-- /.container-fluid -->
	
				</div>
				<!-- End of Main Content -->
	
				<!-- Footer -->
				<%@ include file="components/footer.jsp" %>
					<!-- End of Footer -->
	
			</div>
			<!-- End of Content Wrapper -->
	
		</div>
		<!-- End of Page Wrapper -->
	
		<%@ include file="components/defaultBodyImports.jsp" %>
	
	</body>

</html>