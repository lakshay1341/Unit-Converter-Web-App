package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImpl;
import com.student.dto.Student;


@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Collect the data from the user
        String phoneNumber = req.getParameter("phone");
        String mail = req.getParameter("mail");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm");

        // Convert phone number to long
        long phone = Long.parseLong(phoneNumber);
        PrintWriter out = resp.getWriter();

        // JDBC Implementation
        StudentDAO sdao = new StudentDAOImpl();
        Student s1 = sdao.getStudent(phone, mail);

        if (s1 != null && password.equals(confirmPassword)) {
            s1.setPass(confirmPassword);
            boolean result = sdao.updateStudent(s1);

            if (result) {
                out.println("<h1>Password updated successfully</h1>");
            } else {
                out.println("<h1>Failed to update the password</h1>");
            }
        } else {
            out.println("<h1>Invalid phone number or email, or passwords do not match</h1>");
        }
    }
}
