<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%@ page session="true"%>

<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    List<String[]> cart = (List<String[]>) session.getAttribute("cart");
    Double paymentAmount = (Double) session.getAttribute("paymentAmount");

    if (name == null || email == null || cart == null || cart.isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }

    String dateTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Bill</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: url('img/bg6.jpg') no-repeat center center fixed;
	background-size: cover;
}

.bill-container {
	background-color: rgba(255, 255, 255, 0.95);
	margin-top: 5%;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<div class="container bill-container">
		<h2 class="text-center text-success mb-4">🧾 Payment Bill</h2>

		<p>
			<strong>Name:</strong>
			<%= name %></p>
		<p>
			<strong>Email:</strong>
			<%= email %></p>
		<p>
			<strong>Date & Time:</strong>
			<%= dateTime %></p>

		<table class="table table-bordered table-hover mt-4">
			<thead class="table-dark">
				<tr>
					<th>Book Title</th>
					<th>Author</th>
					<th>Price ₹</th>
				</tr>
			</thead>
			<tbody>
				<%
            double total = 0;
            for (String[] book : cart) {
                total += Double.parseDouble(book[2]);
        %>
				<tr>
					<td><%= book[0] %></td>
					<td><%= book[1] %></td>
					<td><%= book[2] %></td>
				</tr>
				<% } %>
				<tr class="table-secondary">
					<td colspan="2" class="text-end"><strong>Total</strong></td>
					<td><strong>₹ <%= total %></strong></td>
				</tr>
			</tbody>
		</table>
		<div
			class="alert alert-success shadow rounded-pill text-center fs-5 fw-bold">
			🎉 Payment completed successfully! Thank you for your purchase.</div>

		<div class="text-center mt-4">
			<a href="index.jsp" class="btn btn-outline-primary">Back to Home</a>
		</div>
	</div>

	<%
    // ✅ Clear cart after showing the bill
    session.removeAttribute("cart");
%>

</body>
</html>
