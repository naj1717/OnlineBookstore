
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: url('img/bg4.jpg') no-repeat center center fixed;
	background-size: cover;
}

.register-form {
	margin-top: 8%;
	background-color: rgba(255, 255, 255, 0.95);
	padding: 30px;
	border-radius: 12px;
}
</style>
</head>
<body>
	<div class="container col-md-6 offset-md-3 register-form shadow">
		<h2 class="text-center text-primary mb-4">📝 Register</h2>
		<form action="RegisterServlet" method="post">
			<div class="mb-3">
				<label class="form-label">Full Name</label> <input type="text"
					name="name" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Email Address</label> <input type="email"
					name="email" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Username</label> <input type="text"
					name="username" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Password</label> <input type="password"
					name="password" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-success w-100">Register</button>
		</form>

		<div class="text-center mt-3">
			Already have an account? <a href="login.jsp" class="link-primary">Login</a>
		</div>
	</div>
</body>
</html>
