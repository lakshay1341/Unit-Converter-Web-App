package com.bank.controller;

import com.bank.dao.CustomerDAO; 
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    private CustomerDAO customerDAO=new CustomerDAO();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve account number from the request parameter
        String accountNumber = request.getParameter("accountNumber");
        
        try {
            // Call DAO method to delete the customer
            boolean isDeleted = customerDAO.deleteCustomerByAccountNumber(accountNumber);

            if (isDeleted) {
                // Redirect back to admin dashboard with success message
                response.sendRedirect("adminDashboard?success=UserDeleted");
            } else {
                // Redirect with an error message
                response.sendRedirect("adminDashboard?error=UserNotFound");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect with error message if SQL exception occurs
            response.sendRedirect("adminDashboard?error=DatabaseError");
        }
    }
}
