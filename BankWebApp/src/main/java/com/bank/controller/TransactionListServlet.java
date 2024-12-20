package com.bank.controller;

import com.bank.dao.TransactionDAO;
import com.bank.dto.TransactionDTO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/transactionList")
public class TransactionListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Create an instance of TransactionDAO
            TransactionDAO transactionDAO = new TransactionDAO();
            
            // Fetch all transactions
            List<TransactionDTO> transactions = transactionDAO.getAllTransactions();
            
            // Set the transactions list as an attribute in the request
            request.setAttribute("transactions", transactions);
            
            // Forward to the JSP for rendering
            request.getRequestDispatcher("/views/transactionList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch transactions.");
        }
    }
}
