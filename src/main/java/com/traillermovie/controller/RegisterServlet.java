package com.traillermovie.controller;

import com.traillermovie.service.loginService.LoginServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private LoginServiceImpl loginService = new LoginServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("register/register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        if (loginService.checkUsernameRetrive(username) == 0) {
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("usernameMessage","Username is already exists.");
            request.getRequestDispatcher("register/register.jsp?status=0").forward(request, response);
        }
        if (!password.equals(confirmPassword)) {
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("passwordMessage","Password not match.");
            request.getRequestDispatcher("register/register.jsp?status=0").forward(request, response);
        }
        else {
            loginService.saveAccountRegister(username, password);
            response.sendRedirect("login");
        }
    }
}
