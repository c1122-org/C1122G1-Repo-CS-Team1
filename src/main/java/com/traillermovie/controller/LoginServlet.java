package com.traillermovie.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login/form-login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("chinh") && password.equals("chinh")) {
            response.sendRedirect("/home" + "?role=admin");
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login/form-login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
