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

import com.bank.dao.ComplaintDAO;
import com.bank.dto.ComplaintDTO;
import com.bank.dto.CustomerDTO;

@WebServlet("/complaintHistory")
public class ComplaintHistoryServlet extends HttpServlet {

    // Handle GET request to display complaint history
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("customer") != null) {
            CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
            String accountNumber = customer.getAccountNumber();
            ComplaintDAO complaintDAO = new ComplaintDAO();
            List<ComplaintDTO> complaints = null;
            String adminAccountNo = "admin"; // Predefined admin account number

            try {
                if (accountNumber.equals(adminAccountNo)) {
                    // If admin, fetch all complaints and redirect to the admin dashboard
                    complaints = complaintDAO.getAllComplaints();
                    response.sendRedirect("/BankWebApp/adminDashboard");
                    return;  // Prevent further processing in the normal view
                } else {
                    // If normal user, fetch complaints related to their account
                    complaints = complaintDAO.getComplaintsByAccount(accountNumber);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error fetching complaint history.");
                request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
                return;
            }

            // Set complaints as a request attribute to be displayed in the JSP
            request.setAttribute("complaints", complaints);

            // Forward to the complaint history page
            request.getRequestDispatcher("/views/complaintHistory.jsp").forward(request, response);
        } else {
            response.sendRedirect("/views/login.jsp");
        }
    }
}
