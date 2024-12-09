<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .heading {
            color: #000080;
        }
        .sub {
            color: #1e90ff;
        }
        .success {
            color: green;
        }
        .failure {
            color: red;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-body">
                        <h1 class="heading text-center">Pentagon Space</h1>
                        <h3 class="sub text-center mb-4">Application Form</h3>

                        <% String success = (String) request.getAttribute("success"); 
                           if (success != null) { %>
                            <div class="alert alert-success text-center"><%= success %></div>
                        <% } %>
                        <% String failure = (String) request.getAttribute("failure"); 
                           if (failure != null) { %>
                            <div class="alert alert-danger text-center"><%= failure %></div>
                        <% } %>

                        <form action="signup" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label"><b>Enter your Name:</b></label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label"><b>Enter the Phone number:</b></label>
                                <input type="tel" class="form-control" id="phone" name="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="mail" class="form-label"><b>Enter the Mail ID:</b></label>
                                <input type="email" class="form-control" id="mail" name="mail" required>
                            </div>
                            <div class="mb-3">
                                <label for="branch" class="form-label"><b>Enter the Branch:</b></label>
                                <input type="text" class="form-control" id="branch" name="branch" required>
                            </div>
                            <div class="mb-3">
                                <label for="loc" class="form-label"><b>Enter the Location:</b></label>
                                <input type="text" class="form-control" id="loc" name="loc" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><b>Enter the Password:</b></label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="confirm" class="form-label"><b>Confirm the Password:</b></label>
                                <input type="password" class="form-control" id="confirm" name="confirm" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-primary">Create Account</button>
                                <span><b>Already have an account?</b> <a href="/Basic_servlet/login.jsp" class="btn btn-link">Login</a></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
