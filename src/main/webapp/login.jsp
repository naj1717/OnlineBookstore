<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: url('img/bg7.jpg') no-repeat center center fixed;
	background-size: cover;
}

.login-form {
	margin-top: 8%;
	background-color: rgba(255, 255, 255, 0.95);
	padding: 30px;
	border-radius: 12px;
}
</style>
</head>
<body>
	<div class="container col-md-6 offset-md-3 login-form shadow">
		<h2 class="text-center text-success mb-4">🔐 Login</h2>

		<% String error = (String) request.getAttribute("error"); %>
		<% if (error != null) { %>
		<div class="alert alert-danger text-center"><%= error %></div>
		<% } %>

		<form action="LoginServlet" method="post">
			<div class="mb-3">
				<label class="form-label">Username</label> <input type="text"
					name="username" class="form-control" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Password</label> <input type="password"
					name="password" class="form-control" required>
			</div>

			<button type="submit" class="btn btn-primary w-100">Login</button>
		</form>

		<div class="text-center mt-3">
			Don’t have an account? <a href="register.jsp" class="link-primary">Register</a>
		</div>
	</div>
</body>
</html>


