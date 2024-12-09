package com.student.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImpl;
import com.student.dto.Student;



@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String phonenumber = req.getParameter("phone");
        String mail = req.getParameter("mail");
        String branch = req.getParameter("branch");
        String loc = req.getParameter("loc");
        String password = req.getParameter("password");
        String confirmpassword = req.getParameter("confirm");

        long phone = Long.parseLong(phonenumber);

        StudentDAO sdao = new StudentDAOImpl();
        Student s = new Student();

        if (password.equals(confirmpassword)) {
            s.setName(name);
            s.setPhone(phone);
            s.setMail(mail);
            s.setBranch(branch);
            s.setLocation(loc);
            s.setPass(password);

            boolean result = sdao.insertStudent(s);

            if (result) {
                req.setAttribute("success", "Signup successful");
                RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
                rd.forward(req, resp);
            } else {
                req.setAttribute("failure", "Signup failed");
                RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
                rd.forward(req, resp);
            }
        } else {
            req.setAttribute("failure", "Passwords do not match");
            RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
            rd.forward(req, resp);
        }
    }
}
