<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.login-container {
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

a.text-primary {
	color: #004085;
	text-decoration: none;
	font-weight: bold;
	transition: color 0.3s ease;
}

a.text-primary:hover {
	color: #002752;
}
</style>
</head>
<body>

	<div class="login-container">
		<div class="card">
			<div class="card-header">Login</div>
			<div class="card-body bg-light">
				<!-- Display error message if it exists -->
				<% String error = (String) request.getAttribute("error"); %>
				<% if (error != null) { %>
				<div class="alert alert-danger" role="alert">
					<%= error %>
				</div>
				<% } %>

				<!-- Login Form -->
				<form action="<%= request.getContextPath() %>/login" method="post">

					<div class="mb-3">
						<label for="userId" class="form-label">User ID</label> <input
							type="text" name="userId" id="userId" class="form-control"
							placeholder="Enter your User ID" required>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" name="password" id="password"
							class="form-control" placeholder="Enter your Password" required>
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>

				<div class="text-center mt-3">
					<p>
						Don't have an account? <a href="/BankWebApp/views/signup.jsp"
							class="text-primary">Sign up here</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
