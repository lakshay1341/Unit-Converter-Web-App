package com.bank.controller;

import com.bank.dao.CustomerDAO;
import com.bank.dto.CustomerDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateBalance")
public class UpdateBalanceServlet extends HttpServlet {
    
    // Handle GET request to show the balance update form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("customer") != null) {
            // Retrieve the customer's account number from the session
            CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
            String accountNumber = customer.getAccountNumber();

            // Forward to the update balance page and pass the customer details
            CustomerDAO customerDAO = new CustomerDAO();
            try {
                CustomerDTO customerDetails = customerDAO.getCustomerByAccountNumber(accountNumber);
                if (customerDetails != null) {
                    // Set the customer details as a request attribute
                    request.setAttribute("customer", customerDetails);
                    request.getRequestDispatcher("/views/updateBalance.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/views/login.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Error fetching customer details.");
            }
        } else {
            response.sendRedirect("/views/login.jsp");
        }
    }
    
    // Handle POST request to update the balance
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        double amount = Double.parseDouble(request.getParameter("amount"));

        CustomerDAO customerDAO = new CustomerDAO();
        try {
            CustomerDTO customer = customerDAO.getCustomerByAccountNumber(accountNumber);
            if (customer != null) {
                double newBalance = customer.getBalance() + amount; // Update balance with the transaction amount
                
                // Update the balance in the database
                if (customerDAO.updateCustomerBalance(accountNumber, newBalance)) {
                    // Update the session with the new balance
                    customer.setBalance(newBalance);
                    HttpSession session = request.getSession();
                    session.setAttribute("customer", customer); // Save updated customer to session
                    
                    response.sendRedirect("dashboard"); // Redirect to dashboard after successful update
                } else {
                    request.setAttribute("errorMessage", "Error updating balance.");
                    request.getRequestDispatcher("/views/updateBalance.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Customer not found.");
                request.getRequestDispatcher("/views/updateBalance.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching customer details.");
            request.getRequestDispatcher("/views/updateBalance.jsp").forward(request, response);
        }
    }
}
