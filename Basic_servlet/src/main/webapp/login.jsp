<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .heading { color: #000080; }
        .sub { color: #1e90ff; }
        .failure { color: red; }
        .form-container { max-width: 400px; margin: auto; padding: 20px; }
        .card { border-radius: 15px; }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5 form-container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-body">
                        <h1 class="heading text-center">Pentagon Space</h1>
                        <h3 class="sub text-center mb-4">Login</h3>

                        <% String failure = (String) request.getAttribute("failure");
                           if (failure != null) { %>
                            <div class="alert alert-danger text-center"><%= failure %></div>
                        <% } %>

                        <form action="login" method="post">
                            <div class="mb-3">
                                <label for="mail" class="form-label"><b>Enter your Mail ID:</b></label>
                                <input type="email" class="form-control" id="mail" name="mail" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><b>Enter the Password:</b></label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <button onclick="window.location.href='forgotPassword.jsp'" class="btn btn-warning w-100 mb-3">Forgot Password?</button>
                        </div>

                        <div class="text-center mt-2">
                            <b>Don't have an account?</b> <a href="signup.jsp" class="btn btn-link">Signup</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
