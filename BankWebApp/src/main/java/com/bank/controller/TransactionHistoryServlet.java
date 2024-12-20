package com.bank.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.dao.TransactionDAO;
import com.bank.dto.CustomerDTO;
import com.bank.dto.TransactionDTO;

@WebServlet("/transactionHistory")
public class TransactionHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        

        if (session != null && session.getAttribute("customer") != null) {
            String accountNumber = ((CustomerDTO) session.getAttribute("customer")).getAccountNumber();
            
            session.setAttribute("customer", session.getAttribute("customer"));
            
            // Get the transaction history from the session
            List<TransactionDTO> transactions = (List<TransactionDTO>) session.getAttribute("transactionHistory");

            // If transactions are not stored in the session, fetch from the database
            if (transactions == null) {
                TransactionDAO transactionDAO = new TransactionDAO();
                try {
                    transactions = transactionDAO.getTransactionsByAccount(accountNumber);
                    session.setAttribute("transactionHistory", transactions); // Store in session
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Error fetching transaction history.");
                    request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
                    return;
                }
            }

            request.setAttribute("transactions", transactions);  // Send to JSP
            request.getRequestDispatcher("/views/history.jsp").forward(request, response);
        } else {
            response.sendRedirect("/views/login.jsp");  // Redirect if not logged in
        }
    }
}
