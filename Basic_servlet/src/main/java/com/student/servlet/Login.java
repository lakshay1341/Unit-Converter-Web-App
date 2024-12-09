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

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Collect data from the user
        String mail = req.getParameter("mail");
        String password = req.getParameter("password");

        // Authenticate user using your DAO (Data Access Object)
        StudentDAO sdao = new StudentDAOImpl();
        Student s = sdao.getStudent(mail, password);

        if (s != null) {
            // Create a new session and store the Student object
            HttpSession session = req.getSession();
            session.setAttribute("student", s);

            // Redirect to the dashboard
            resp.sendRedirect("dashboard.jsp");
        } else {
            // Failed login, set failure message and forward to login page
            req.setAttribute("failure", "Failed to login. Please check your credentials.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
