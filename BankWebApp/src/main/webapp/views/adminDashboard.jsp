<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="java.util.List" import="com.bank.dto.TransactionDTO"
	import="com.bank.dto.ComplaintDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f6f9;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.dashboard-container {
	margin: auto;
	padding: 30px;
}

.card {
	border: none;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #004085;
	color: white;
	text-align: center;
	font-size: 1.5rem;
	font-weight: bold;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	padding: 15px;
}

.btn-custom {
	background-color: #004085;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 1rem;
	color: white;
	display: inline-block;
	margin-bottom: 15px;
	width: 100%;
	text-decoration: none;
	transition: background-color 0.3s ease;
	text-align: center; /* Center-aligns the text */
	line-height: 1.5; /* Ensures proper vertical alignment */
}

.btn-custom:hover {
	background-color: #002752;
}

.section-header {
	font-size: 1.25rem;
	font-weight: bold;
	color: #004085;
	margin-bottom: 20px;
}

.list-group-item {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 10px;
	padding: 12px 15px;
	transition: background-color 0.3s ease;
}

.list-group-item:hover {
	background-color: #f1f1f1;
}

/* New Style Improvements */
.recent-section {
	margin-bottom: 30px;
}

.recent-section .card {
	border: 2px solid #004085; /* Dark border to highlight the cards */
	background-color: #ffffff; /* White background for better contrast */
}

.recent-section .card-header {
	font-size: 1.25rem; /* Larger header font size */
	text-align: left; /* Align text to the left */
	padding: 20px 15px; /* More padding for better visual separation */
}

.recent-section .list-group-item {
	font-size: 1rem; /* Slightly larger text for better readability */
	padding: 15px 20px; /* Increased padding for better spacing */
}
</style>
</head>
<body>

	<div class="container dashboard-container">
		<!-- Admin Dashboard Card -->
		<div class="card mb-4">
			<div class="card-header">Admin Dashboard</div>
			<div class="card-body">
				<h2>Welcome, Admin</h2>
				<p class="mb-4">Manage transactions, complaints, and users from
					this dashboard.</p>
				<div class="d-grid gap-2">
					<a href="/BankWebApp/transactionList" class="btn-custom">View
						All Transactions</a> <a href="/BankWebApp/complaintList"
						class="btn-custom">View Complaints</a> <a
						href="/BankWebApp/viewAllCustomers" class="btn-custom">Manage
						Users</a> <a href="/BankWebApp/logout" class="btn-custom">Logout</a>
				</div>
			</div>
		</div>

		<!-- Row for Recent Transactions and Complaints -->
		<div class="row">
			<!-- Recent Transactions (First Card) -->
			<div class="col-md-6 recent-section">
				<div class="card">
					<div class="card-header">Recent Transactions</div>
					<div class="card-body">
						<ul class="list-group">
							<% 
                                List<TransactionDTO> latestTransactions = (List<TransactionDTO>) request.getAttribute("latestTransactions");
                                if (latestTransactions != null && !latestTransactions.isEmpty()) {
                                    for (TransactionDTO transaction : latestTransactions) {
                            %>
							<li class="list-group-item">Transaction ID: <%= transaction.getTransactionId() %>
								| Amount: <%= transaction.getRemarks() %> | Date: <%= transaction.getTransactionDate() %>
							</li>
							<% 
                                    }
                                } else { 
                            %>
							<li class="list-group-item">No recent transactions
								available.</li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>

			<!-- Recent Complaints (Second Card) -->
			<div class="col-md-6 recent-section">
				<div class="card">
					<div class="card-header">Recent Complaints</div>
					<div class="card-body">
						<ul class="list-group">
							<% 
                                List<ComplaintDTO> recentComplaints = (List<ComplaintDTO>) request.getAttribute("recentComplaints");
                                if (recentComplaints != null && !recentComplaints.isEmpty()) {
                                    for (ComplaintDTO complaint : recentComplaints) {
                            %>
							<li class="list-group-item">Complaint ID: <%= complaint.getComplaintNo() %>
								| Subject: <%= complaint.getSubject() %> | Date: <%= complaint.getComplaintDate() %>
							</li>
							<% 
                                    }
                                } else { 
                            %>
							<li class="list-group-item">No recent complaints available.</li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
