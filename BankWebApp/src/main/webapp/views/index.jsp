<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Bank</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7fa; /* Light grey background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333; /* Dark grey text for readability */
        }
        .container {
            text-align: center;
            padding: 40px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 6px 16px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 100%;
        }
        h1 {
            color: #1a1a1a; /* Dark text color for the heading */
            font-size: 2.4rem;
            margin-bottom: 20px;
            font-weight: 500;
        }
        p {
            color: #777; /* Lighter grey for paragraph */
            font-size: 1rem;
            margin-bottom: 25px;
        }
        .btn-primary {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 1.1rem;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin: 10px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #004085; /* Darker blue on hover */
        }
        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to My Bank</h1>
        <p>Please log in to access your account or sign up for a new one.</p>
        <a href="<%= request.getContextPath() %>/views/login.jsp" class="btn-primary">Login</a>
        <a href="<%= request.getContextPath() %>/views/signup.jsp" class="btn-primary">Signup</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
