<%@page import="com.student.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%
	// Retrieve the Student object from the session
	Student s = (Student) session.getAttribute("student");
	if (s == null) {
		response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
		return;
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Welcome, <%=s.getName()%>!
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="forgotPassword.jsp">Reset Password</a></li>
					<li class="nav-item"><a class="nav-link" href="updateStudent.jsp">Update
							Data</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<h1 class="text-center mb-4">Dashboard</h1>
		<div class="row">
			<div class="col-md-12">
				<h3>Your Details</h3>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Mail ID</th>
							<th>Branch</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=s.getId()%></td>
							<td><%=s.getName()%></td>
							<td><%=s.getPhone()%></td>
							<td><%=s.getMail()%></td>
							<td><%=s.getBranch()%></td>
							<td><%=s.getLocation()%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
