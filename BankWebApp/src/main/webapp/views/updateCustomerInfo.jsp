<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.bank.dto.CustomerDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Customer Information</title>
<!-- Bootstrap CSS for styling -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f7fc;
	margin: 0;
	padding: 0;
}

.container {
	margin-top: 40px;
	padding: 30px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #004085;
	font-weight: bold;
}

.form-label {
	font-size: 1.1rem;
	font-weight: 600;
}

.form-control {
	border-radius: 8px;
}

.error-message, .success-message {
	font-weight: bold;
	margin-bottom: 15px;
}

.error-message {
	color: red;
}

.success-message {
	color: green;
}

.btn-primary {
	background-color: #004085;
	border: none;
}

.btn-primary:hover {
	background-color: #003366;
}

.back-link {
	margin-top: 20px;
	display: inline-block;
}
</style>
</head>
<body>

	<div class="container">
		<h1>Update Your Information</h1>

		<% 
            CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
            if (customer == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Display success or error message
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");

            if (successMessage != null) { 
        %>
		<div class="success-message"><%= successMessage %></div>
		<% } else if (errorMessage != null) { %>
		<div class="error-message"><%= errorMessage %></div>
		<% } %>

		<!-- Update Form -->
		<form action="<%= request.getContextPath() %>/updateCustomerInfo"
			method="post">
			<!-- First Name -->
			<div class="mb-3">
				<label for="fname" class="form-label">First Name:</label> <input
					type="text" class="form-control" id="fname" name="fname"
					value="<%= customer.getFname() %>" required>
			</div>

			<!-- Last Name -->
			<div class="mb-3">
				<label for="lname" class="form-label">Last Name:</label> <input
					type="text" class="form-control" id="lname" name="lname"
					value="<%= customer.getLname() %>" required>
			</div>

			<!-- Date of Birth -->
			<div class="mb-3">
				<label for="dob" class="form-label">Date of Birth:</label> <input
					type="date" class="form-control" id="dob" name="dob"
					value="<%= customer.getDob() %>" required>
			</div>

			<!-- Password -->
			<div class="mb-3">
				<label for="password" class="form-label">Password:</label> <input
					type="password" class="form-control" id="password" name="password"
					value="<%= customer.getPassword() %>" required>
			</div>

			<!-- Gender -->
			<div class="mb-3">
				<label for="gender" class="form-label">Gender:</label> <select
					class="form-control" name="gender" required>
					<option value="Male"
						<%= "Male".equals(customer.getGender()) ? "selected" : "" %>>Male</option>
					<option value="Female"
						<%= "Female".equals(customer.getGender()) ? "selected" : "" %>>Female</option>
				</select>
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary">Update</button>
		</form>

		<!-- Back to Dashboard Link -->
		<a href="dashboard" class="back-link">Back to Dashboard</a>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
