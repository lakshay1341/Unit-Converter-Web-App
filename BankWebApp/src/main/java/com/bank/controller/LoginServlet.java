package com.bank.controller;

import com.bank.dao.CustomerDAO; 
import com.bank.dto.CustomerDTO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet { 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        try {
            CustomerDAO dao = new CustomerDAO();
            CustomerDTO customer = dao.loginCustomer(userId, password);

            if (customer != null) {
                // Store customer data in session
                HttpSession session = request.getSession();
                session.setAttribute("customer", customer);

                // Check if the user is the admin
                String adminAccountNo = "admin"; // Predefined admin account number
                if (userId.equals(adminAccountNo)) {
                    // Redirect to the admin dashboard if admin account
                    response.sendRedirect("/BankWebApp/adminDashboard");
                } else {
                    // Redirect to the customer dashboard for regular users
                    response.sendRedirect("/BankWebApp/dashboard");
                }

            } else {
                // Invalid credentials
                request.setAttribute("error", "Invalid credentials");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
