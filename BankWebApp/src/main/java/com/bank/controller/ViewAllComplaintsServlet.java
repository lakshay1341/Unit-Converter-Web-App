package com.bank.controller;

import com.bank.dao.ComplaintDAO;
import com.bank.dto.ComplaintDTO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/complaintList")
public class ViewAllComplaintsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Create an instance of ComplaintDAO
            ComplaintDAO complaintDAO = new ComplaintDAO();

            HttpSession session = request.getSession(false);

            // Fetch all complaints
            List<ComplaintDTO> complaintList = complaintDAO.getAllComplaints();

            session.setAttribute("complaintList", complaintList);

            // Set the complaints list as a request attribute
            request.setAttribute("complaintList", complaintList);

            // Forward to a JSP page to display the complaints
            request.getRequestDispatcher("/views/complaintList.jsp").forward(request, response);

        } catch (SQLException e) {
            // Handle SQL exception and show an error message
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch complaints.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String complaintNumber = request.getParameter("complaintNumber");

        try {
            // Resolve complaints for the given complaint number
            ComplaintDAO complaintDAO = new ComplaintDAO();
            boolean isResolved = complaintDAO.resolveComplaint(complaintNumber); // Assuming resolveComplaint returns true if successful

            // Fetch the updated complaint list
            List<ComplaintDTO> complaintList = complaintDAO.getAllComplaints();

            // Update the session and request with the new list
            HttpSession session = request.getSession(false);
            session.setAttribute("complaintList", complaintList);
            request.setAttribute("complaintList", complaintList);

            // Set the success or failure message based on the result
            if (isResolved) {
                request.setAttribute("message", "Complaint resolved successfully.");
            } else {
                request.setAttribute("message", "Failed to resolve the complaint.");
            }

            // Forward to the JSP page with the message
            request.getRequestDispatcher("/views/complaintList.jsp").forward(request, response);

        } catch (SQLException e) {
            // Handle SQL exception and show an error message
            e.printStackTrace();
            request.setAttribute("error", "Failed to resolve complaints.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

}
