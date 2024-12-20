package com.bank.controller;

import com.bank.dao.CustomerDAO;
import com.bank.dto.CustomerDTO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewAllCustomers")
public class ViewAllCustomersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Create an instance of CustomerDAO
            CustomerDAO customerDAO = new CustomerDAO();

            // Fetch all customer records
            List<CustomerDTO> customerList = customerDAO.getAllCustomers();

            // Set the customer list as a request attribute
            request.setAttribute("customerList", customerList);

            // Forward to the JSP page to display the customers
            request.getRequestDispatcher("/views/customerList.jsp").forward(request, response);

        } catch (SQLException e) {
            // Handle the exception (e.g., log it and show an error message)
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch customer records.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }
}
