package com.bank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.dto.CustomerDTO;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("dashboard servlet initiated");
    	HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("customer") != null) {
            CustomerDTO customer = (CustomerDTO) session.getAttribute("customer");
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
        } else {
            response.sendRedirect("/views/login.jsp");
        }
    }
}
