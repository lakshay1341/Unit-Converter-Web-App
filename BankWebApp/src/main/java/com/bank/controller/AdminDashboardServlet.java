package com.bank.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.dao.ComplaintDAO;
import com.bank.dao.TransactionDAO;
import com.bank.dto.ComplaintDTO;
import com.bank.dto.TransactionDTO;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TransactionDAO transactionDAO = new TransactionDAO();
        ComplaintDAO complaintDAO = new ComplaintDAO();

        try {
            // Fetch latest transactions and complaints
            List<TransactionDTO> latestTransactions = transactionDAO.getLatestTransactions(); // Fetch the last 5 transactions
            List<ComplaintDTO> recentComplaints = complaintDAO.getRecentComplaints(); // Fetch the last 5 complaints

            // Set them as request attributes
            request.setAttribute("latestTransactions", latestTransactions);
            request.setAttribute("recentComplaints", recentComplaints);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching recent data.");
        }

        // Forward to the admin dashboard JSP
        request.getRequestDispatcher("/views/adminDashboard.jsp").forward(request, response);
    }
}
