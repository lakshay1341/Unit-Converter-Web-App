<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"
	import="com.bank.dto.TransactionDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transaction History</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	max-width: 900px;
	margin: auto;
	padding: 40px 20px;
}

h1 {
	color: #004085;
	font-weight: bold;
}

.table {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table th, .table td {
	padding: 12px;
	text-align: center;
}

.table th {
	background-color: #004085;
	color: white;
}

.table td {
	font-size: 1rem;
}

.no-data {
	text-align: center;
	font-size: 1.2rem;
	color: #777;
}

.back-btn {
	margin-top: 20px;
	display: inline-block;
	padding: 10px 20px;
	background-color: #004085;
	color: white;
	text-decoration: none;
	font-size: 1rem;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.back-btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="container mt-5">
		<h1>Transaction History</h1>

		<% 
            // Retrieve the list of transactions passed as a session attribute
            List<TransactionDTO> transactions = (List<TransactionDTO>) session.getAttribute("transactionHistory");
            
            if (transactions != null && !transactions.isEmpty()) {
        %>
		<!-- Transaction Table -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>Date</th>
					<th>Description</th>
					<th>Status</th>
					<th>Remarks</th>
				</tr>
			</thead>
			<tbody>
				<% 
                        for (TransactionDTO transaction : transactions) {
                    %>
				<tr>
					<td><%= transaction.getTransactionId() %></td>
					<td><%= transaction.getTransactionDate() %></td>
					<td><%= transaction.getDescription() %></td>
					<td><%= transaction.getStatus() %></td>
					<td><%= transaction.getRemarks() %></td>
				</tr>
				<% 
                        }
                    %>
			</tbody>
		</table>
		<% 
            } else {
        %>
		<p class="no-data">No transactions found.</p>
		<% 
            }
        %>

		<a href="dashboard" class="back-btn">Back to Dashboard</a>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
