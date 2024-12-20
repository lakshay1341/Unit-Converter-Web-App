<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.bank.dto.TransactionDTO" import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction List</title>
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
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #004085;
            font-weight: bold;
        }
        .table {
            background-color: white;
            border-radius: 8px;
        }
        .table th, .table td {
            padding: 12px;
            text-align: center;
        }
        .table th {
            background-color: #004085;
            color: white;
        }
        .table td {
            font-size: 1rem;
        }
        .no-data {
            text-align: center;
            font-size: 1.2rem;
            color: #777;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #004085;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .back-link:hover {
            background-color: #002752;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Transaction List</h1>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Account Number</th>
                    <th>Transaction Date</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Remarks</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Fetch the transactions attribute from the request
                    List<TransactionDTO> transactions = (List<TransactionDTO>) request.getAttribute("transactions");
                    if (transactions != null && !transactions.isEmpty()) {
                        for (TransactionDTO transaction : transactions) {
                %>
                <tr>
                    <td><%= transaction.getTransactionId() %></td>
                    <td><%= transaction.getAccountNumber() %></td>
                    <td><%= transaction.getTransactionDate() %></td>
                    <td><%= transaction.getDescription() %></td>
                    <td><%= transaction.getStatus() %></td>
                    <td><%= transaction.getRemarks() %></td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" class="no-data">No transactions found.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <!-- Back Button -->
        <a href="adminDashboard" class="back-link">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
