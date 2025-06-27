<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<html>
<head>
<title>Your Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background: url('img/bg5.jpg'); background-size: cover;">
	<div class="container mt-5 p-4 bg-light rounded shadow">
		<h2 class="text-center mb-4">🛒 Your Cart</h2>

		<%
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");
        if(cart != null && !cart.isEmpty()){
    %>
		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<% for(int i = 0; i < cart.size(); i++) {
                String[] book = cart.get(i);
        %>
				<tr>
					<td><%= book[0] %></td>
					<td><%= book[1] %></td>
					<td>₹<%= book[2] %></td>
					<td><a href="RemoveFromCartServlet?index=<%= i %>"
						class="btn btn-sm btn-danger">Remove</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<!-- Pay Now Button Form -->
		<form action="PayNowServlet" method="post" class="text-center mt-5">
			<!-- Pay Now Button -->
			<button type="submit"
				class="btn custom-outline-pink shadow rounded-pill text-center fs-5 fw-bold">
				💳 Pay Now</button>
		</form>
		<!-- Custom CSS -->
		<style>
.custom-outline-pink {
	background-color: transparent;
	color: #6a1b9a; /* Deep Purple */
	border: 2px solid #c2185b; /* Dark Pink Outline */
	padding: 10px 28px;
	transition: all 0.3s ease-in-out;
}

.custom-outline-pink:hover {
	background-color: #c2185b;
	color: white;
	box-shadow: 0 4px 12px rgba(194, 24, 91, 0.4);
}
</style>






		<% } else { %>
		<div class="alert alert-warning text-center">Your cart is empty.</div>
		<% } %>

		<a href="index.jsp"
			class="btn btn-outline-dark btn-sm rounded-pill fw-bold position-fixed bottom-0 start-50 translate-middle-x mb-3">
			⬅ Back to Home </a>



	</div>
</body>
</html>

