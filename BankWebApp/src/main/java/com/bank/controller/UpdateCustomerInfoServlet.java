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

@WebServlet("/updateCustomerInfo")
public class UpdateCustomerInfoServlet extends HttpServlet {

    // Handle GET request (for displaying the update form)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        // Forward to the JSP for displaying the form
        request.getRequestDispatcher("/views/updateCustomerInfo.jsp").forward(request, response);
    }

    // Handle POST request (for processing the update)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        // Retrieve and update customer details
        CustomerDTO loggedInCustomer = (CustomerDTO) session.getAttribute("customer");

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");

        loggedInCustomer.setFname(fname);
        loggedInCustomer.setLname(lname);
        loggedInCustomer.setDob(dob);
        loggedInCustomer.setPassword(password);
        loggedInCustomer.setGender(gender);

        CustomerDAO customerDAO = new CustomerDAO();
        try {
            boolean isUpdated = customerDAO.updateCustomerInfo(loggedInCustomer);

            if (isUpdated) {
                session.setAttribute("customer", loggedInCustomer);
                request.setAttribute("successMessage", "Customer information updated successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to update customer information.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating information.");
        }

        request.getRequestDispatcher("/views/updateCustomerInfo.jsp").forward(request, response);
    }
}
