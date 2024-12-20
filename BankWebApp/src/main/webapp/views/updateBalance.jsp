<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.bank.dto.CustomerDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Balance</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
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
        <h1>Add Balance to Your Account</h1>

        <!-- Display error message if available -->
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) { 
        %>
        <div class="error-message">
            <p><%= errorMessage %></p>
        </div>
        <% } %>

        <!-- Get customer from request attribute -->
        <% 
            CustomerDTO customer = (CustomerDTO) request.getAttribute("customer");
            if (customer != null) {
        %>

        <form action="<%= request.getContextPath() %>/updateBalance" method="post">
            <!-- Account Number (readonly field to display the logged-in user's account) -->
            <div class="mb-3">
                <label for="accountNumber" class="form-label">Account Number:</label>
                <input type="text" class="form-control" id="accountNumber" name="accountNumber" value="<%= customer.getAccountNumber() %>" readonly/>
            </div>

            <!-- Amount to Add or Withdraw -->
            <div class="mb-3">
                <label for="amount" class="form-label">Amount to Add/Withdraw:</label>
                <input type="number" class="form-control" id="amount" name="amount" required/>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Update Balance</button>
        </form>

        <% 
            } else {
        %>
        <p>Customer not found. Please login again.</p>
        <% 
            }
        %>

        <!-- Back to Dashboard Link -->
        <a href="dashboard" class="back-link">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
