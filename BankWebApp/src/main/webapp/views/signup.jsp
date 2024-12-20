<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.signup-container {
	max-width: 600px;
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

.form-label {
	font-weight: bold;
	color: #333;
}

.form-control {
	border-radius: 5px;
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

.alert {
	border-radius: 5px;
	font-size: 0.9rem;
}

a.btn-link {
	color: #004085;
	text-decoration: none;
	font-weight: bold;
	transition: color 0.3s ease;
}

a.btn-link:hover {
	color: #002752;
}
</style>
</head>
<body>
	<div class="signup-container">
		<div class="card">
			<div class="card-header">Create Account</div>
			<div class="card-body">
				<form action="<%= request.getContextPath() %>/signup" method="post">


					<div class="row mb-3">
						<div class="col-md-6">
							<label for="fname" class="form-label">First Name</label> <input
								type="text" class="form-control" id="fname" name="fname"
								placeholder="Enter first name" required>
						</div>
						<div class="col-md-6">
							<label for="lname" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lname" name="lname"
								placeholder="Enter last name" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="dob" class="form-label">Date of Birth</label> <input
							type="date" class="form-control" id="dob" name="dob" required>
					</div>
					<div class="mb-3">
						<label for="userId" class="form-label">User ID</label> <input
							type="text" class="form-control" id="userId" name="userId"
							placeholder="Choose a user ID" required>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Choose a password" required>
					</div>
					<div class="mb-3">
						<label for="gender" class="form-label">Gender</label> <select
							class="form-select" id="gender" name="gender" required>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="balance" class="form-label">Initial Balance</label> <input
							type="number" class="form-control" id="balance" name="balance"
							step="0.01" placeholder="Enter initial balance" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary w-100">Sign
							Up</button>
					</div>
				</form>
				<%
				if (request.getAttribute("errorMessage") != null) {
				%>
				<div class="alert alert-danger mt-3" role="alert">
					<%=request.getAttribute("errorMessage")%>
				</div>
				<%
				}
				%>
				<%
				if (request.getAttribute("successMessage") != null) {
				%>
				<div class="alert alert-success mt-3" role="alert">
					<%=request.getAttribute("successMessage")%>
				</div>
				<%
				}
				%>
				<div class="text-center mt-3">
					<a href="/BankWebApp/views/login.jsp" class="btn-link">Back to
						Login</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS (Optional for interactive components) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
