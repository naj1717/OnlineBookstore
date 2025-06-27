<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page session="true"%>

<%
    if(session.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    List<String[]> bookList = (List<String[]>) request.getAttribute("bookList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Books</title>

<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-image: url('img/bg4.jpg');
	/* 📷 Add this image in WebContent/images/ */
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: 'Segoe UI', sans-serif;
	color: white;
}

.container {
	background-color: rgba(0, 0, 0, 0.7);
	border-radius: 15px;
	padding: 30px;
	margin-top: 50px;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

.table th, .table td {
	color: green;
}

.btn-buy {
	color: #fff;
	background-color: #28a745;
	border: none;
}
</style>
</head>

<body>
	<div class="container">
		<h2>📘 Available Books</h2>

		<%
            if(bookList != null && !bookList.isEmpty()) {
        %>
		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author</th>
					<th>Price ₹</th>
					<th>Quantity</th>
					<th>Category</th>

				</tr>
			</thead>
			<tbody>
				<%
                    for(String[] book : bookList){
                %>
				<tr>
					<td><%= book[0] %></td>
					<td><%= book[1] %></td>
					<td><%= book[2] %></td>
					<td><%= book[3] %></td>
					<td><%= book[4] %></td>
					<td><%= book[5] %></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<%
            } else {
        %>
		<p class="text-warning text-center">No books available.</p>
		<%
            }
        %>

		<div class="text-center mt-4">
			<a href="index.jsp"
				class="btn btn-outline-danger px-4 py-2 rounded-pill fw-bold shadow-sm">
				⬅ Go to Home </a>
		</div>
	</div>

</body>
</html>
