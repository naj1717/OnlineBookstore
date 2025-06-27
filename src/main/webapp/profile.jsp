<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
    }

    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>👤 User Profile</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image: url('img/bg2.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.profile-card {
	background-color: rgba(255, 255, 255, 0.95);
	padding: 30px;
	border-radius: 15px;
	margin-top: 7%;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
}

.profile-label {
	font-weight: bold;
	color: #333;
}
</style>
</head>
<body>
	<div class="container d-flex justify-content-center">
		<div class="col-md-6 profile-card">
			<h2 class="text-center text-primary mb-4">👤 User Profile</h2>
			<hr>
			<p class="profile-label">Name:</p>
			<p><%= name != null ? name : "Not Available" %></p>

			<p class="profile-label">Email:</p>
			<p><%= email != null ? email : "Not Available" %></p>

			<p class="profile-label">Username:</p>
			<p><%= username != null ? username : "Not Available" %></p>

			<div class="text-center mt-4">
				<a href="index.jsp" class="btn btn-outline-primary me-2">🏠 Home</a>
				<a href="LogoutServlet" class="btn btn-outline-danger">🚪 Logout</a>
			</div>
		</div>
	</div>
</body>
</html>

