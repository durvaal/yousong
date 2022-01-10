<%@page import="br.com.ufrn.model.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>YouSong - Users</title>
	
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
							<h1 class="h3 mb-0 text-gray-800">Users</h1>
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
										<p>Below you can view, edit or delete users.</p>
										<p>To edit, just click on the field, change and click save.</p>
									</div>
								</div>
							</div>
	
							<div class="col-xl-12 col-md-12 mb-12 pb-2">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered" id="dataTableUser" width="100%" cellspacing="0">
												<thead>
													<tr>
														<th>Name</th>
														<th>Email</th>
														<th class="text-center">Edit</th>
														<th class="text-center">Delete</th>
													</tr>
												</thead>
												<tfoot>
													<tr>
														<th>Name</th>
														<th>Email</th>
														<th class="text-center">Edit</th>
														<th class="text-center">Delete</th>
													</tr>
												</tfoot>
												<tbody>
												<%
													ArrayList<UserModel> users = (ArrayList<UserModel>) request.getAttribute("users");
																					
													if (users == null || users.size() <= 0) {
												%>
														<div class="col-xl-12 col-md-12 mb-12 text-center p-2">
															<span>There are no users available, try register a new users.</span>
														</div>
												<%
													} else {
														for (UserModel user : users) {
												%>
													<tr>
														<td><%= user.getName() %></td>
														<td><%= user.getEmail() %></td>
														<td align="center">
															<a href="javascript:{}" onclick="selectUserToEdit(<%= user.getId() %>, '<%= user.getName() %>')" class="d-sm-inline-block btn btn-sm btn-primary shadow-sm" title="Edit">
																<i class="fas fa-pencil-alt fa-sm text-white-100"></i>
															</a>
														</td>
														<td align="center">
															<a href="javascript:{}" onclick="selectUserToDelete(<%= user.getId() %>);" class="d-sm-inline-block btn btn-sm btn-danger shadow-sm" title="Delete">
																<i class="fas fa-trash-alt fa-sm text-white-100"></i>
															</a>
														</td>
													</tr>
												<%
														}
													} 
												%>
												</tbody>
											</table>
										</div>
									</div>
                    			</div>
							</div>
						</div>
						<!-- End Content Row -->
						
						<!-- Edit User Modal -->
						<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Edit user</h5>
										<button class="close" type="button" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">Select "Save" below if you are ready to save current user.
										<form id="editUserForm" method="POST" action="${pageContext.request.contextPath}/api/v1/users/update">
											<input type="text" class="d-none" id="userId" name="userId">
											<div class="form-group">
												<input type="text" class="form-control form-control-user" id="userName" placeholder="Name"
													name="userName" required="required">
											</div>
											<div class="form-group text-center">
												<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
												<a class="btn btn-primary" href="javascript:{}" onclick="editUserForm();">Save</a>
											</div>
											<div id="invalidFormContainer" class="d-none">
												<hr>
												<div class="card mb-4 py-3 border-bottom-danger">
													<div class="card-body text-center">
														Fields are not filled in correctly.
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- Delete  User Modal -->
						<div class="modal fade" id="deleteUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Delete user</h5>
										<button class="close" type="button" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">Select "Delete" below if you are ready to delete current user.
										<form id="deleteUserForm" method="POST" action="${pageContext.request.contextPath}/api/v1/users/delete">
											<input type="text" class="d-none" id="userId" name="userId">
											<div class="form-group text-center pt-2">
												<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
												<a class="btn btn-primary" href="javascript:{}" onclick="document.forms['deleteUserForm'].submit();">Delete</a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
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

		<script src="${pageContext.request.contextPath}/js/users-form-validation.js"></script>
	
	</body>

</html>