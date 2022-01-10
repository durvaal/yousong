<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="UTF-8">

	</head>

	<body>

		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/dashboard">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-headphones"></i>
				</div>
				<div class="sidebar-brand-text mx-3">YouSong</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link" href="${pageContext.request.contextPath}/dashboard">
					<i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Dashboard</span>
				</a>
				<a class="nav-link" href="search-songs.jsp">
					<i class="fas fa-fw fa-search"></i>
					<span>Search Songs</span>
				</a>
				<a class="nav-link" href="${pageContext.request.contextPath}/my-songs">
					<i class="fas fa-fw fa-music"></i>
					<span>My Songs</span>
				</a>
				<a class="nav-link" href="${pageContext.request.contextPath}/users">
					<i class="fas fa-fw fa-user-alt"></i>
					<span>Users</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

			<!-- Sidebar Message -->
			<div class="sidebar-card d-none d-lg-flex">
				<p class="text-center mb-2">We hope we are enjoying the experience with <strong>YouSong</strong>.</p>
			</div>

		</ul>

	</body>

</html>