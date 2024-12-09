<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
        rel="stylesheet">
    <style>
        .heading {
            color: #000080;
        }
        .sub {
            color: #1e90ff;
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
                        <h3 class="sub text-center mb-4">Update your password here</h3>
                        <form action="forgotPassword" method="post">
                            <div class="mb-3">
                                <label for="phone" class="form-label"><b>Enter the Phone number:</b></label>
                                <input type="tel" class="form-control" id="phone" name="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="mail" class="form-label"><b>Enter the Mail ID:</b></label>
                                <input type="email" class="form-control" id="mail" name="mail" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><b>Enter a new password:</b></label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="confirm" class="form-label"><b>Confirm the password:</b></label>
                                <input type="password" class="form-control" id="confirm" name="confirm" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-primary">Update Password</button>
                                <a href="login.jsp" class="btn btn-secondary">Back</a>
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
