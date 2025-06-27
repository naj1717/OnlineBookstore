<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bookstore</title>

<!-- Optional: Custom Styling -->
<style>
body {
	background-image: url('img/bg5.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	color: white;
}

.hero-section {
	padding: 80px 0;
	background-color: rgba(0, 0, 0, 0.6); /* Overlay */
	text-align: center;
	border-radius: 10px;
}

.hero-section h1 {
	font-size: 3rem;
}

.hero-section p {
	font-size: 1.2rem;
}

.btn-group-home {
	margin-top: 30px;
}
</style>
</head>

<body>
	<div class="container mt-5">
		<div class="hero-section">
			<h1>📚 Welcome to Your Skill-based Online Bookstore</h1>
			<p>Discover books tailored to your learning goals and
				professional growth.</p>

			<div class="btn-group-home">
				<a href="addSkill.jsp" class="btn btn-primary btn-lg mx-2">Add
					Skill</a> <a href="ViewBooksServlet"
					class="btn btn-success btn-lg mx-2">View Books</a> <a
					href="cart.jsp" class="btn btn-warning btn-lg mx-2">Go to Cart</a>
			</div>
		</div>
	</div>
</body>
</html>
