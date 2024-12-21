<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    public double convertLength(double value, String fromUnit, String toUnit) {
        double result = 0.0;
        switch (fromUnit) {
            case "Meter":
                if (toUnit.equals("Kilometer")) result = value / 1000;
                else if (toUnit.equals("Centimeter")) result = value * 100;
                else if (toUnit.equals("Inch")) result = value * 39.37;
                else if (toUnit.equals("Foot")) result = value * 3.281;
                break;
            case "Kilometer":
                if (toUnit.equals("Meter")) result = value * 1000;
                else if (toUnit.equals("Centimeter")) result = value * 100000;
                break;
            case "Centimeter":
                if (toUnit.equals("Meter")) result = value / 100;
                else if (toUnit.equals("Kilometer")) result = value / 100000;
                break;
            case "Inch":
                if (toUnit.equals("Meter")) result = value / 39.37;
                break;
            case "Foot":
                if (toUnit.equals("Meter")) result = value / 3.281;
                break;
            // Additional cases for other units can be added here
        }
        return result;
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Length Conversion</title>
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
            background-color: #f4f6f9;
            color: #333;
            line-height: 1.6;
        }

        /* Main container styling */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Header styles */
        h1 {
            text-align: center;
            font-size: 40px;
            color: #34495e;
            margin-bottom: 20px;
        }

        /* Form styles */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input, select {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        button {
            padding: 12px 20px;
            background-color: #2980b9;
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
            font-size: 22px;
            font-weight: bold;
            color: #28a745;
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
            background-color: #7f8c8d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button button:hover {
            background-color: #2c3e50;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Length Conversion</h1>
        <form action="length.jsp" method="POST">
            <input type="number" name="value" placeholder="Enter value" required>
            <div>
                <select name="fromUnit">
                    <option value="Meter">Meter</option>
                    <option value="Kilometer">Kilometer</option>
                    <option value="Centimeter">Centimeter</option>
                    <option value="Inch">Inch</option>
                    <option value="Foot">Foot</option>
                    <!-- Additional units can be added here -->
                </select>
                <span>to</span>
                <select name="toUnit">
                    <option value="Meter">Meter</option>
                    <option value="Kilometer">Kilometer</option>
                    <option value="Centimeter">Centimeter</option>
                    <option value="Inch">Inch</option>
                    <option value="Foot">Foot</option>
                    <!-- Additional units can be added here -->
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
                double result = convertLength(value, fromUnit, toUnit);
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
        <p>Unit Converter | Created by Lakshay</p>
    </footer>
</body>
</html>
