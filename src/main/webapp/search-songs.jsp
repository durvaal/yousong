<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>YouSong - Search Songs</title>
	
		<%@ include file="components/defaultHeadImports.jsp" %>
	
		<link href="${pageContext.request.contextPath}/css/search.css" rel="stylesheet">
	
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
					<div id="search-song" class="container-fluid">
		
						<!-- Page Heading -->
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">Search Songs</h1>
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
										<p>Below you can select radio and then save your favorite songs.</p>
									</div>
								</div>
							</div>
			
							<!-- Radios -->
							<div class="col-xl-12 col-md-12 mb-12 pb-2">
								<div class="card shadow">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Radios</h6>
									</div>
									<div class="card-body p-2">
										<div class="row">
											<div class="col-xl-12 col-md-12 mb-12" v-if="loadingRadio">
												<div class="d-flex justify-content-center">
													<div class="spinner-grow text-primary" role="status">
														<span class="sr-only">Loading...</span>
													</div>
												</div>
											</div>
											<div class="col-xl-2 col-md-2 mb-2" v-for="(radio, index) in radios" :key="index" v-else>
												<div class="card shadow">
													<div class="card-header">
														<h6 class="m-0 font-weight-bold text-primary">{{radio.title}}</h6>
													</div>
													<div class="card-header py-0 px-0">
														<img class="img-fluid" :src="radio.picture_big">
													</div>
													<div class="card-bottom text-center py-3">
														<a @click="seeSongs(radio)" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
															<i class="fas fa-search fa-sm text-white-100"></i> See Songs
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Radios -->
						</div>
						<!-- End Content Row -->
			
						<!-- Modal -->
						<div class="modal fade" id="seeSongsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div id="toastValidation" class="toast text-white" role="alert" aria-live="assertive" aria-atomic="true" data-delay="3000" v-bind:class="{'bg-success': validation.success, 'bg-danger': !validation.success}">
						  		<div class="toast-header">
						    		<strong class="mr-auto">{{validation.success ? 'Uhu' : 'Ops'}}</strong>
						    		<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
						      			<span aria-hidden="true">&times;</span>
						    		</button>
						  		</div>
						  		<div class="toast-body">{{validation.message}}</div>
							</div>
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Radio: {{selectedRadio.title}}</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-xl-12 col-md-12 mb-12">
												<!-- Radios -->
												<div class="card shadow">
													<div class="card-header py-3">
														<h6 class="m-0 font-weight-bold text-primary">Songs</h6>
													</div>
													<div class="card-body p-2">
														<div class="row row-eq-height">
															<div class="col-xl-12 col-md-12 mb-12" v-if="loadingSong">
																<div class="d-flex justify-content-center">
																	<div class="spinner-grow text-primary" role="status">
																		<span class="sr-only">Loading...</span>
																	</div>
																</div>
															</div>
															<div class="col-xl-3 col-md-6 mb-4" v-for="(song, index) in songs" :key="index" v-else>
																<div class="card shadow">
																	<div class="card-header py-0 px-0">
																		<img class="img-fluid" :src="song.album.cover_big">
																	</div>
																	<div class="card-bottom text-center py-3">
																		<span class="font-weight-bold text-primary" title="Artist name">
																			<img class="img-fluid song-picture" :src="song.artist.picture">
																			{{song.artist.name}}
																		</span>
																		<p class="pt-2 mb-0" title="Song name">{{song.title}}</p>
																		<div class="container-audio p-2">
																			<audio controls>
																				<source :src="song.preview" type="audio/mp3">
																				Your browser does not support the audio element.
																			</audio>
																		</div>
																		<form id="createSongForm">
																			<input id="songId" type="text" class="d-none" name="songId">
																			<input id="songObject" type="text" class="d-none" name="songObject">
																			<a href="javascript:{}" v-if="!loadingSaveSong" @click="saveSong(song)" class="d-sm-inline-block btn btn-sm btn-success shadow-sm">
																				<i class="fas fa-save fa-sm text-white-100"></i> Save Song
																			</a>
																			<div class="d-flex justify-content-center" v-else>
																				<div class="spinner-grow text-primary" role="status">
																					<span class="sr-only">Loading...</span>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
															<div class="col-xl-12 col-md-12 mb-12 text-center p-2" v-if="songs.length <= 0 && !loadingSong">
																<span>There are no songs available, try another radio.</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer justify-content-center">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<!-- End Modal -->
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
			<!-- End of Page Wrapper -->
	
		</div>
		<!-- End Page Wrapper -->
	
		<%@ include file="components/defaultBodyImports.jsp" %>
		
		<!-- Core Vue JavaScript-->
		<script src="${pageContext.request.contextPath}/vendor/vue/vue.js"></script>
		<script src="${pageContext.request.contextPath}/js/search-song.vue.js"></script>
		<script src="${pageContext.request.contextPath}/js/search-song.utils.js"></script>
	
	</body>

</html>