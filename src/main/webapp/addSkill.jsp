<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
    if(session.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
    }
%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Skill</title>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap 5 JS Bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Optional custom style -->
<style>
body {
	background: url('img/bg3.jpg') no-repeat center center fixed;
	background-size: cover;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.skill-form-container {
	margin-top: 8%;
}

.card {
	background-color: rgba(255, 255, 255, 0.95);
	border-radius: 12px;
}
</style>
</head>

<body>
	<div class="container skill-form-container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card shadow p-4">
					<h3 class="text-center text-primary mb-4">Enter Your Skill</h3>
					<form action="AddSkillServlet" method="post">
						<div class="mb-3">
							<label for="skill" class="form-label">Skill</label> <input
								type="text" name="skill" id="skill" class="form-control"
								placeholder="e.g. Java, Web Design" required>
						</div>
						<button type="submit" class="btn btn-success w-100">Suggest
							Books</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
