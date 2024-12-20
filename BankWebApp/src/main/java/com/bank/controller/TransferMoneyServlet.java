package com.bank.controller;

import com.bank.dao.TransactionDAO;
import com.bank.dto.CustomerDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/transferMoney")
public class TransferMoneyServlet extends HttpServlet {

    // GET method to show the transfer money form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
            return;
        }

        // Retrieve the customer from session
        CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");

        // Retrieve receiver account from customer object (could be modified logic based on your model)
        String receiverAccount = customer.getAccountNumber(); // Replace with actual logic

        // Set receiver account in the request so it can be displayed on the form
        request.setAttribute("receiverAccount", receiverAccount);

        // Forward to the transfer money page (for the user to input transfer details)
        request.getRequestDispatcher("/views/transferMoney.jsp").forward(request, response);
    }

    // POST method to handle the transfer money logic
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("/views/login.jsp"); // Redirect to login if session is invalid
            return;
        }

        CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
        String senderAccount = customer.getAccountNumber();
        String receiverAccount = request.getParameter("receiverAccount");
        double amount = Double.parseDouble(request.getParameter("amount"));

        TransactionDAO transactionDAO = new TransactionDAO();
        boolean success = transactionDAO.transferMoney(senderAccount, receiverAccount, amount);

        if (success) {
            // Update the balance in the session
            double currentBalance = customer.getBalance();
            customer.setBalance(currentBalance - amount);

            // Update the session with the modified customer object
            session.setAttribute("customer", customer);

            // Set success message and redirect to dashboard
            request.setAttribute("successMessage", "Transaction successful! Your balance has been updated.");
            request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
        } else {
            // Handle transfer failure and set error message
            request.setAttribute("errorMessage", "Transaction failed. Please try again.");
            request.getRequestDispatcher("/views/transferMoney.jsp").forward(request, response);
        }
    }
}
