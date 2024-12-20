<%@ page import="java.util.List"%>
<%@ page import="com.bank.dto.ComplaintDTO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Complaint List</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f9f9f9;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #2c3e50;
}

.container {
	max-width: 1200px;
	margin: auto;
	padding: 40px 20px;
}

h2 {
	font-size: 2.5rem;
	font-weight: 600;
	color: #34495e;
	margin-bottom: 30px;
	text-align: center;
}

.table-wrapper {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
	padding: 30px;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 15px;
	text-align: center;
	font-size: 1.1rem;
}

.table th {
	background-color: #0056b3; /* Darker blue */
	color: white;
	font-weight: 600;
}

.table tbody tr:nth-child(odd) {
	background-color: #f4f4f4;
}

.table tbody tr:hover {
	background-color: #ecf0f1;
	cursor: pointer;
}

.table tbody td {
	border-top: 1px solid #ddd;
}

.table .action-btn {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 4px;
	transition: background-color 0.3s ease;
	cursor: pointer;
}

.table .action-btn:hover {
	background-color: #218838;
}

.back-link {
	display: inline-block;
	margin-top: 30px;
	padding: 12px 30px;
	background-color: #0056b3; /* Darker blue */
	color: white;
	text-decoration: none;
	border-radius: 5px;
	font-size: 1.1rem;
	transition: background-color 0.3s ease;
}

.back-link:hover {
	background-color: #003f7f; /* Darker shade for hover */
}

.text-center {
	font-size: 1.1rem;
	color: #7f8c8d;
}
</style>
</head>
<body>

	<div class="container mt-5">
		<h2>Complaint List</h2>

		<%-- Display success or error message --%>
		<% if (request.getAttribute("message") != null) { %>
		<div class="alert alert-info">
			<%= request.getAttribute("message") %>
		</div>
		<% } %>

		<div class="table-wrapper">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Complaint No</th>
						<th>Account Number</th>
						<th>Complaint Date</th>
						<th>Subject</th>
						<th>Description</th>
						<th>Status</th>
						<th>Closed</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<% 
                        List<ComplaintDTO> complaintList = (List<ComplaintDTO>) session.getAttribute("complaintList");

                        if (complaintList != null && !complaintList.isEmpty()) {
                            for (ComplaintDTO complaint : complaintList) {
                    %>
					<tr>
						<td><%= complaint.getComplaintNo() %></td>
						<td><%= complaint.getAccountNumber() %></td>
						<td><%= complaint.getComplaintDate() %></td>
						<td><%= complaint.getSubject() %></td>
						<td><%= complaint.getDescription() %></td>
						<td><%= complaint.getStatus() %></td>
						<td><%= complaint.getClosed() %></td>
						<td>
							<form action="complaintList" method="post">
								<input type="hidden" name="complaintNumber"
									value="<%= complaint.getComplaintNo() %>">
								<button type="submit" class="action-btn">Resolve</button>
							</form>
						</td>
					</tr>
					<% 
                            }
                        } else {
                    %>
					<tr>
						<td colspan="8" class="text-center">No complaints found.</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>

		<a href="adminDashboard" class="back-link">Back to Dashboard</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
