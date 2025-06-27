<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page session="true"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return; // Important to stop further processing
    }
%>

<!-- Bootstrap CSS and JS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<!-- Include this in your <head> if not already -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
		rel="stylesheet">

	<!-- Bootstrap Icons CDN (for user icon) -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
		rel="stylesheet">

	<!-- Custom Styling -->
	<style>
.profile-outline-btn {
	width: 40px;
	height: 40px;
	border: 2px solid #d63384; /* Dark pink border */
	color: #d63384;
	border-radius: 50%;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
	transition: 0.3s ease;
	font-size: 18px;
}

.profile-outline-btn:hover, .profile-outline-btn:focus,
	.profile-outline-btn:active, .profile-outline-btn:visited {
	background-color: #d63384;
	color: white;
	text-decoration: none;
	border-color: #d63384;
}
</style>

	<!-- Circular Outline Button -->
	<a href="profile.jsp" class="profile-outline-btn"> <i
		class="bi bi-person-fill"></i>
	</a>


	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">📚 Online Bookstore</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="addSkill.jsp">Add
						Skill</a></li>
				<li class="nav-item"><a class="nav-link"
					href="ViewSkillServlet">View Skills</a></li>
				<li class="nav-item"><a class="nav-link"
					href="ViewBooksServlet">View Books</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
			</ul>

			<a href="LogoutServlet" class="btn btn-outline-danger mx-2">🚪
				Logout</a>

		</div>
	</div>
</nav>
