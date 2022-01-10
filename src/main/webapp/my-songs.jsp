<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="br.com.ufrn.model.SongModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>YouSong - Saved Songs</title>
	
		<%@ include file="components/defaultHeadImports.jsp" %>
	
		<link href="${pageContext.request.contextPath}/css/song.css" rel="stylesheet">
	
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
						<h1 class="h3 mb-0 text-gray-800">My Songs</h1>
					</div>
							
					<!-- Content Row -->      
					<div class="row">  
						<div class="col-xl-12 col-md-12 mb-12 pb-2">
							<!-- Information -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Information</h6>
								</div>
								<div class="card-body">
									<p>Below you can select to play, favorite or delete you song.</p>
								</div>
							</div>
						</div>
	
						<!-- Songs -->	
						<div class="col-xl-12 col-md-12 mb-12">
							<div class="card shadow">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Songs</h6>
								</div>
								<div class="card-body p-2">
									<div class="row row-eq-height">
										<%
											ArrayList<SongModel> songs = (ArrayList<SongModel>) request.getAttribute("songs");
																			
											if (songs == null || songs.size() <= 0) {
										%>
												<div class="col-xl-12 col-md-12 mb-12 text-center p-2">
													<span>There are no songs available, try save a new song.</span>
												</div>
										<%
											} else {
										%>
										<%
											JSONParser jsonParser = new JSONParser();
											for (SongModel song : songs) {
												JSONObject songObject = (JSONObject) jsonParser.parse(song.getSong());
												JSONObject albumObject = (JSONObject) songObject.get("album");
												JSONObject artistObject = (JSONObject) songObject.get("artist");
										%>
													<div class="col-xl-3 col-md-6 mb-4">
														<div class="card shadow <%= song.getFavorite().equals(true) ? "border border-warning" : "" %>">
															<div class="card-header py-0 px-0">
																<img class="img-fluid" src="<%= albumObject.get("cover_big") %>">
															</div>
															<div class="card-bottom text-center py-3">
																<span class="font-weight-bold text-primary" title="Artist name">
																	<img class="img-fluid song-picture" src="<%= artistObject.get("picture") %>">
																	<%= artistObject.get("name") %>
																</span>
																<p class="pt-2 mb-0" title="Song name"><%= songObject.get("title") %></p>
																<div class="container-audio p-2">
																	<audio controls>
																		<source src="<%= songObject.get("preview") %>" type="audio/mp3">
																		Your browser does not support the audio element.
																	</audio>
																</div>
																<div class="row">
																	<div class="col-xl-6 col-md-6 text-right">
																		<form id="favoriteSongForm<%= song.getId() %>" method="POST" action="api/v1/songs/favorite?songId=<%= song.getId() %>">
																			<a href="javascript:{}" onclick="document.forms['favoriteSongForm<%= song.getId() %>'].submit();" class="d-sm-inline-block btn btn-sm btn-warning shadow-sm" title="Favorite">
																				<i class="fas fa-star fa-sm text-white-100"></i>
																			</a>
																		</form>
																	</div>
																	<div class="col-xl-6 col-md-6 text-left">
																		<a href="javascript:{}" onclick="selectSongToDelete(<%= song.getId() %>);" class="d-sm-inline-block btn btn-sm btn-danger shadow-sm" title="Delete">
																			<i class="fas fa-trash-alt fa-sm text-white-100"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
										<%
												}
											}
										%>
									</div>
								</div>
							</div>
						</div>
						<!-- End Songs -->
					</div>
					<!-- End Content Row -->
					
					<!-- Delete  User Modal -->
					<div class="modal fade" id="deleteSongModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Delete song</h5>
									<button class="close" type="button" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">Select "Delete" below if you are ready to delete current song.
									<form id="deleteSongForm" method="POST" action="${pageContext.request.contextPath}/api/v1/songs/delete">
										<input type="text" class="d-none" id="songId" name="songId">
										<div class="form-group text-center pt-2">
											<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
											<a class="btn btn-primary" href="javascript:{}" onclick="document.forms['deleteSongForm'].submit();">Delete</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Main Content -->
	
			</div>
			<!-- End of Main Content -->
	
			<!-- Footer -->
			<%@ include file="components/footer.jsp" %>
			<!-- End of Footer -->
	
			<!-- Scroll to Top Button-->
			<%@ include file="components/scrollTopButton.jsp" %>
			<!-- End Scroll to Top Button-->
	
			<!-- Logout Modal-->
			<%@ include file="components/logoutModal.jsp" %>
			<!-- End Modal-->
	
		</div>
		<!-- End Page Wrapper -->
	
		<%@ include file="components/defaultBodyImports.jsp" %>

		<script src="${pageContext.request.contextPath}/js/my-song.utils.js"></script>
		<script src="${pageContext.request.contextPath}/js/my-songs-form-validation.js"></script>
	
	</body>

</html>