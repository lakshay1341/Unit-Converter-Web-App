<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"
	import="com.bank.dto.ComplaintDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Complaint History</title>
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
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #004085;
	color: white;
	text-align: center;
	padding: 20px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	font-size: 1.5rem;
	font-weight: bold;
}

.table th, .table td {
	text-align: center;
}

.btn-primary {
	background-color: #004085;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 1rem;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #002752;
}

.text-primary {
	color: #004085;
	font-weight: bold;
}

.text-primary:hover {
	color: #002752;
}
</style>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-header">Complaint History</div>
			<div class="card-body bg-light">
				<!-- Link to Add New Complaint -->
				<a href="addComplaint" class="btn btn-primary mb-3">Add New
					Complaint</a>
				<hr>

				<% 
                    // Display the list of complaints if available
                    List<ComplaintDTO> complaints = (List<ComplaintDTO>) request.getAttribute("complaints");

                    if (complaints != null && !complaints.isEmpty()) {
                %>
				<h3>Your Complaints</h3>
				<table class="table table-bordered">
					<thead class="table-dark">
						<tr>
							<th>Complaint ID</th>
							<th>Date</th>
							<th>Subject</th>
							<th>Status</th>
							<th>Closed</th>
						</tr>
					</thead>
					<tbody>
						<% 
                                for (ComplaintDTO complaint : complaints) {
                            %>
						<tr>
							<td><%= complaint.getComplaintNo() %></td>
							<td><%= complaint.getComplaintDate() %></td>
							<td><%= complaint.getSubject() %></td>
							<td><%= complaint.getStatus() %></td>
							<td><%= complaint.getClosed() %></td>
						</tr>
						<% 
                                }
                            %>
					</tbody>
				</table>
				<% 
                    } else {
                %>
				<p>No complaints found.</p>
				<% 
                    }
                %>

				<br> <a href="dashboard" class="text-primary">Back to
					Dashboard</a>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
