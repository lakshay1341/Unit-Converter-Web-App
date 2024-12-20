<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.bank.dto.CustomerDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
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

.card {
	margin-top: 30px;
	border: none;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #004085;
	color: white;
	font-size: 1.5rem;
}

.card-body {
	background-color: white;
	padding: 20px;
}

h1 {
	font-weight: bold;
	color: #004085;
}

h2 {
	color: #004085;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

.account-info {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #e9ecef;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 30px;
}

.account-info h3 {
	margin: 0;
}

.account-info .info-item {
	font-size: 1.2rem;
	font-weight: bold;
	color: #004085;
}

.account-info .info-value {
	font-size: 1.3rem;
	color: #28a745;
}

.action-btns {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.action-btns a {
	display: block;
	width: 45%;
	margin-bottom: 15px;
	text-decoration: none;
	font-size: 1.2rem;
	background-color: #004085;
	color: white;
	padding: 15px;
	text-align: center;
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.action-btns a:hover {
	background-color: #0056b3;
	transform: translateY(-5px);
}

.action-btns a:active {
	transform: translateY(0);
}

.logout-btn {
	background-color: #d9534f;
}

.logout-btn:hover {
	background-color: #c9302c;
}
</style>
</head>
<body>

	<div class="container mt-5">
		<%
            session = request.getSession(false); // Get existing session, if any
            if (session != null) {
                CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
                if (customer != null) {
        %>

		<!-- Welcome Card -->
		<div class="card">
			<div class="card-header">
				Welcome,
				<%= customer.getFname() %>!
			</div>
			<div class="card-body">
				<!-- Account Information -->
				<div class="account-info">
					<div>
						<h3 class="info-item">Account Number:</h3>
						<p class="info-value"><%= customer.getAccountNumber() %></p>
					</div>
					<div>
						<h3 class="info-item">Current Balance:</h3>
						<p class="info-value">
							₹
							<%= customer.getBalance() %></p>
					</div>
				</div>

				<h2>What would you like to do?</h2>

				<!-- Action Buttons -->
				<div class="action-btns">
					<a href="updateBalance">Add/Withdraw Balance</a> <a
						href="transferMoney">Transfer Money</a> <a href="complaintHistory">View
						Complaint History</a> <a href="transactionHistory">View
						Transaction History</a> <a href="updateCustomerInfo">Update
						Personal Information</a> <a href="logout" class="logout-btn">Logout</a>
				</div>
			</div>
		</div>

		<%
                } else {
                    response.sendRedirect(request.getContextPath() + "/views/login");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/views/login");
            }
        %>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
