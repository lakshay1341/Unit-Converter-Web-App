package com.bank.controller;

import com.bank.dao.CustomerDAO; 
import com.bank.dto.CustomerDTO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println("Servlet invoked");

        // Retrieve form parameters
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        double balance = Double.parseDouble(request.getParameter("balance"));

        // Generate unique account number
        String accountNumber = generateAccountNumber();

        // Create CustomerDTO
        CustomerDTO customer = new CustomerDTO(fname, lname, dob, userId, password, accountNumber, gender, balance);

        try {
            boolean isRegistered = customerDAO.registerCustomer(customer);
           // System.out.println(isRegistered);

            if (isRegistered) {
                request.setAttribute("successMessage", "Account created successfully! Your Account Number is: " + accountNumber);
               // System.out.println("Signup successful with account number: " + accountNumber);
                //System.out.println("Forwarding to signup.jsp...");
                request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to create account. Try again.");
                //System.out.println("Signup failed.");
                request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
           // System.out.println("Error during signup process.");
            request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
        }
    }

    /**
     * Generates a unique account number.
     * @return A unique 10-digit account number as a String.
     */
    private String generateAccountNumber() {
        Random random = new Random();
        StringBuilder accountNumber = new StringBuilder("10"); // Start with a bank-specific prefix
        for (int i = 0; i < 8; i++) {
            accountNumber.append(random.nextInt(10)); // Append random digits
        }
        return accountNumber.toString();
    }
}
