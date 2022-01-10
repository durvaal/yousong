<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>YouSong - Dashboard</title>
	
		<%@ include file="components/defaultHeadImports.jsp" %>
	
	</head>
	
	<body id="page-top">
	
		<!-- Check Session Expires -->
		<%@ include file="components/checkSession.jsp" %>
	
		<!-- Page Wrapper -->
		<div id="wrapper">
	
			<!-- Sidebar -->
			<%@ include file="components/sidebar.jsp" %>
			<!-- End of Sidebar -->
	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
	
				<!-- Main Content -->
				<div id="content">
	
					<!-- Topbar -->
					<%@ include file="components/topBar.jsp" %>
					<!-- End of Topbar -->
	
					<!-- Begin Page Content -->
					<div class="container-fluid">
	
						<!-- Page Heading -->
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
						</div>
						<!-- End Page Heading -->
	
						<!-- Content Row -->
						<div class="row">
							<div class="col-xl-12 col-md-12 mb-12 pb-2">
								<!-- Information -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Information</h6>
									</div>
									<div class="card-body">
										<p>Below you will see a total of saved songs and favorite songs.</p>
									</div>
								</div>
							</div>
	
							<div class="col-xl-6 col-md-6 mb-6">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													Saved Songs
												</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><%= request.getAttribute("savedCount") %></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-save fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
	
							<div class="col-xl-6 col-md-6 mb-6">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-success text-uppercase mb-1">
													Favorite Songs</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><%= request.getAttribute("favoriteCount") %></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-star fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End Content Row -->
	
					</div>
					<!-- End Page Content -->
	
				</div>
				<!-- End of Main Content -->
	
				<!-- Footer -->
				<%@ include file="components/footer.jsp" %>
				<!-- End of Footer -->
	
			</div>
			<!-- End of Content Wrapper -->
	
			<!-- Scroll to Top Button-->
			<%@ include file="components/scrollTopButton.jsp" %>
	
			<!-- Logout Modal-->
			<%@ include file="components/logoutModal.jsp" %>
		</div>
		<!-- End of Page Wrapper -->
	
		<%@ include file="components/defaultBodyImports.jsp" %>
	
	</body>

</html>