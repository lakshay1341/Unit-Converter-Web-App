<%@ page import="java.util.List" %>
<%@ page import="com.bank.dto.CustomerDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            max-width: 900px;
            margin: auto;
            padding: 40px 20px;
        }
        .table th, .table td {
            text-align: center;
        }
        .table thead {
            background-color: #004085;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #e9ecef;
        }
        h2 {
            font-weight: bold;
            color: #004085;
            margin-bottom: 20px;
        }
        .btn-danger {
            padding: 5px 10px;
            font-size: 0.9rem;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #004085;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-link:hover {
            background-color: #002752;
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <h2>Customer List</h2>

        <!-- Table for Customers -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Account No</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Balance</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Retrieve the list of customers from request attributes
                    List<CustomerDTO> customerList = (List<CustomerDTO>) request.getAttribute("customerList");

                    // Check if customerList is available and not empty
                    if (customerList != null && !customerList.isEmpty()) {
                        for (CustomerDTO customer : customerList) {
                %>
                <tr>
                    <td><%= customer.getAccountNumber() %></td>
                    <td><%= customer.getFname() %></td>
                    <td><%= customer.getLname() %></td>
                    <td><%= customer.getGender() %></td>
                    <td><%= customer.getDob() %></td>
                    <td><%= customer.getBalance() %></td>
                    <td>
                        <!-- Delete Form -->
                        <form action="<%= request.getContextPath() %>/deleteUser" method="post">
                            <input type="hidden" name="accountNumber" value="<%= customer.getAccountNumber() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No customers found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Back Button -->
        <a href="adminDashboard" class="back-link">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
