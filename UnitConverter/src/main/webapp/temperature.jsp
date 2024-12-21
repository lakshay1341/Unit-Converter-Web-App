<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
    public double convertTemperature(double value, String fromUnit, String toUnit) {
        double result = 0.0;
        if (fromUnit.equals(toUnit)) {
            result = value; // No conversion needed
        } else {
            switch (fromUnit + "-" + toUnit) {
                case "Celsius-Fahrenheit":
                    result = (value * 9 / 5) + 32;
                    break;
                case "Celsius-Kelvin":
                    result = value + 273.15;
                    break;
                case "Fahrenheit-Celsius":
                    result = (value - 32) * 5 / 9;
                    break;
                case "Fahrenheit-Kelvin":
                    result = ((value - 32) * 5 / 9) + 273.15;
                    break;
                case "Kelvin-Celsius":
                    result = value - 273.15;
                    break;
                case "Kelvin-Fahrenheit":
                    result = ((value - 273.15) * 9 / 5) + 32;
                    break;
            }
        }
        return result;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Temperature Converter</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background: #eef2f3;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        max-width: 600px;
        background: #fff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    h1 {
        margin-bottom: 20px;
        font-size: 32px;
        color: #2980b9;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }
    input, select {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    button {
        background: #2980b9;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
    }
    button:hover {
        background: #1f6395;
    }
    .result {
        margin-top: 30px;
        font-size: 18px;
        color: #28a745;
    }
    .back-button {
        margin-top: 20px;
    }
    footer {
        margin-top: 20px;
        font-size: 14px;
        color: #777;
    }
    footer a {
        color: #2980b9;
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Temperature Converter</h1>
    <form action="temperature.jsp" method="POST">
        <input type="number" name="value" placeholder="Enter temperature" required>
        <select name="fromUnit">
            <option value="Celsius">Celsius</option>
            <option value="Fahrenheit">Fahrenheit</option>
            <option value="Kelvin">Kelvin</option>
        </select>
        <select name="toUnit">
            <option value="Celsius">Celsius</option>
            <option value="Fahrenheit">Fahrenheit</option>
            <option value="Kelvin">Kelvin</option>
        </select>
        <button type="submit">Convert</button>
    </form>

    <% 
        String valueStr = request.getParameter("value");
        String fromUnit = request.getParameter("fromUnit");
        String toUnit = request.getParameter("toUnit");

        if (valueStr != null && !valueStr.isEmpty()) {
            double value = Double.parseDouble(valueStr);
            double result = convertTemperature(value, fromUnit, toUnit);
            DecimalFormat df = new DecimalFormat("#.##");
    %>
    <div class="result">
        <p>Converted Value: <%= df.format(result) %> <%= toUnit %></p>
    </div>
    <% 
        }
    %>

    <div class="back-button">
        <button onclick="window.location.href='index.html';">Back to Home</button>
    </div>

    <footer>
        <p>&copy; 2024 <a href="#">Lakshay's Converter</a>. All rights reserved.</p>
    </footer>
</div>
</body>
</html>
