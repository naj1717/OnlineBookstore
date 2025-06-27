<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page session="true"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skill-Based Book Suggestions</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: url('img/bg3.jpg') no-repeat center center fixed;
	background-size: cover;
}

.container {
	background-color: rgba(255, 255, 255, 0.95);
	margin-top: 5%;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center text-primary mb-4">📚 Books Suggested
			Based on Your Skill</h2>

		<%
        List<String[]> bookList = (List<String[]>) request.getAttribute("bookList");
        if(bookList != null && !bookList.isEmpty()){
    %>
		<form action="BuyBookServlet" method="post">
			<table class="table table-bordered table-hover table-striped">
				<thead class="table-dark">
					<tr>
						<th>Select</th>
						<th>Title</th>
						<th>Author</th>
						<th>Price ₹</th>
						<th>Category</th>
					</tr>
				</thead>
				<tbody>
					<% for(String[] book : bookList) { %>
					<tr>
						<td><input type="checkbox" name="bookIds"
							value="<%= book[4] %>"></td>
						<td><%= book[0] %></td>
						<td><%= book[1] %></td>
						<td><%= book[2] %></td>
						<td><%= book[3] %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div class="text-center">
				<input type="submit" class="btn btn-success"
					value="Add Selected to Cart" />
			</div>
		</form>
		<% } else { %>
		<div class="alert alert-warning text-center">No books found for
			your skill.</div>
		<% } %>

		<div class="text-center mt-4">
			<a href="index.jsp" class="btn btn-primary">⬅ Back to Home</a>
		</div>
	</div>
</body>
</html>
