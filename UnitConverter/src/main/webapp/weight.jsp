<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    public double convertWeight(double value, String fromUnit, String toUnit) {
        double result = 0.0;
        if (fromUnit.equals("Kilogram") && toUnit.equals("Gram")) {
            result = value * 1000;
        } else if (fromUnit.equals("Gram") && toUnit.equals("Kilogram")) {
            result = value / 1000;
        }
        // Add more conversion logic here as needed
        return result;
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weight Conversion</title>
    <style>
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Global styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9; /* Soft light background */
            color: #333;
            line-height: 1.6;
        }

        /* Main container styling */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Header styles */
        h1 {
            text-align: center;
            font-size: 36px;
            color: #2c3e50; /* Darker color for consistency */
            margin-bottom: 20px;
        }

        /* Form styles */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input, select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            background-color: #2980b9; /* Consistent blue */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1f6395;
        }

        /* Result section */
        .result {
            margin-top: 20px;
            text-align: center;
            font-size: 18px;
            color: #333;
        }

        .result p {
            font-size: 20px;
            font-weight: bold;
            color: #28a745; /* Consistent green */
        }

        /* Footer styling */
        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
            color: #777;
        }

        /* Back button styling */
        .back-button {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .back-button button {
            padding: 10px 20px;
            background-color: #2980b9; /* Consistent blue */
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button button:hover {
            background-color: #1f6395;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Weight Conversion</h1>
        <form action="weight.jsp" method="POST">
            <input type="number" name="value" placeholder="Enter value" required>
            <div>
                <select name="fromUnit">
                    <option value="Kilogram">Kilogram</option>
                    <option value="Gram">Gram</option>
                    <!-- Add more units as needed -->
                </select>
                <span>to</span>
                <select name="toUnit">
                    <option value="Kilogram">Kilogram</option>
                    <option value="Gram">Gram</option>
                    <!-- Add more units as needed -->
                </select>
            </div>
            <button type="submit">Convert</button>
        </form>

        <% 
            String valueStr = request.getParameter("value");
            String fromUnit = request.getParameter("fromUnit");
            String toUnit = request.getParameter("toUnit");

            if (valueStr != null && !valueStr.isEmpty()) {
                double value = Double.parseDouble(valueStr);
                double result = convertWeight(value, fromUnit, toUnit);
                DecimalFormat df = new DecimalFormat("#.##");
        %>
            <div class="result">
                <p>Converted value: <%= df.format(result) %> <%= toUnit %></p>
            </div>
        <% } %>

        <!-- Back Button -->
        <div class="back-button">
            <button onclick="window.location.href='index.html';">Back to Home</button>
        </div>
    </div>
    <footer>
        <p>Weight Converter | Created by Lakshay</p>
    </footer>
</body>
</html>
