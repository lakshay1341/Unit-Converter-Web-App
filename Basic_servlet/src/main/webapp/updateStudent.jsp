<%@ page import="com.student.dto.Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Details</title>
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
        rel="stylesheet">
</head>
<body>
    <%
        // Retrieve the Student object from the session
        Student s = (Student) session.getAttribute("student");
        if (s == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
            return;
        }
    %>
    
    <div class="container mt-4">
        <h1 class="text-center mb-4">Update Your Details</h1>
        <form action="updateStudent" method="post" class="row g-3">
            <div class="col-md-6">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= s.getName() %>" required>
            </div>
            <div class="col-md-6">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= s.getPhone() %>" required>
            </div>
            <div class="col-md-6">
                <label for="mail" class="form-label">Email</label>
                <input type="email" class="form-control" id="mail" name="mail" value="<%= s.getMail() %>" required>
            </div>
            <div class="col-md-6">
                <label for="branch" class="form-label">Branch</label>
                <input type="text" class="form-control" id="branch" name="branch" value="<%= s.getBranch() %>" required>
            </div>
            <div class="col-md-6">
                <label for="location" class="form-label">Location</label>
                <input type="text" class="form-control" id="location" name="location" value="<%= s.getLocation() %>" required>
            </div>
            <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= s.getPass() %>" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="dashboard.jsp" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
        <% 
            String success = (String) request.getAttribute("success");
            String error = (String) request.getAttribute("error");
            if (success != null) { 
        %>
            <div class="alert alert-success mt-3"><%= success %></div>
        <% 
            } else if (error != null) { 
        %>
            <div class="alert alert-danger mt-3"><%= error %></div>
        <% 
            } 
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
