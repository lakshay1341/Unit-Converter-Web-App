package com.student.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImpl;
import com.student.dto.Student;

@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the session
        HttpSession session = req.getSession();
        Student currentStudent = (Student) session.getAttribute("student");

        if (currentStudent == null) {
            // Redirect to login if session is invalid
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            // Collect updated data from the form
            String name = req.getParameter("name");
            long phone = Long.parseLong(req.getParameter("phone"));
            String mail = req.getParameter("mail");
            String branch = req.getParameter("branch");
            String location = req.getParameter("location");
            String password = req.getParameter("password");

            // Update the Student object
            currentStudent.setName(name);
            currentStudent.setPhone(phone);
            currentStudent.setMail(mail);
            currentStudent.setBranch(branch);
            currentStudent.setLocation(location);
            currentStudent.setPass(password);

            // Update the database
            StudentDAO studentDAO = new StudentDAOImpl();
            boolean isUpdated = studentDAO.updateStudent(currentStudent);

            if (isUpdated) {
                // Update session with new data
                session.setAttribute("student", currentStudent);

                // Redirect to dashboard with success message
                req.setAttribute("success", "Details updated successfully!");
                RequestDispatcher dispatcher = req.getRequestDispatcher("dashboard.jsp");
                dispatcher.forward(req, resp);
            } else {
                // Forward to updateStudent.jsp with error message
                req.setAttribute("error", "Failed to update details. Please try again.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("updateStudent.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred while updating details. Please check your inputs.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("updateStudent.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
