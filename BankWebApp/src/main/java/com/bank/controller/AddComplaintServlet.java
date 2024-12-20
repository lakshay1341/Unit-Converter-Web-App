package com.bank.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.dao.ComplaintDAO;
import com.bank.dto.ComplaintDTO;
import com.bank.dto.CustomerDTO;

@WebServlet("/addComplaint")
public class AddComplaintServlet extends HttpServlet {

    // Handle GET request to display the Add Complaint form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("customer") != null) {
            // Forward to the Add Complaint JSP page
            request.getRequestDispatcher("/views/addComplaint.jsp").forward(request, response);
        } else {
            response.sendRedirect("/views/login.jsp");
        }
    }
    

    // Handle POST request to submit a new complaint
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("customer") != null) {
            String accountNumber = ((CustomerDTO) session.getAttribute("customer")).getAccountNumber();
            String subject = request.getParameter("subject");
            String description = request.getParameter("description");

            ComplaintDTO complaint = new ComplaintDTO();
            complaint.setAccountNumber(accountNumber);
            complaint.setComplaintDate(new java.util.Date());
            complaint.setSubject(subject);
            complaint.setDescription(description);
            complaint.setStatus("Pending");
            complaint.setClosed("No");

            ComplaintDAO complaintDAO = new ComplaintDAO();
            try {
                complaintDAO.addComplaint(complaint);
                response.sendRedirect("complaintHistory");  // Redirect to history
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error submitting complaint.");
                request.getRequestDispatcher("/views/addComplaint.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/views/login.jsp");
        }
    }

}
