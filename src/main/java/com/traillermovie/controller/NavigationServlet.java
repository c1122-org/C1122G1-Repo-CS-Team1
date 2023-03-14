package com.traillermovie.controller;

import com.traillermovie.model.Movie;
import com.traillermovie.service.navigationService.NavigationServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NavigationServlet", value = "/navigation")
public class NavigationServlet extends HttpServlet {
    private static NavigationServiceImpl navigationService = new NavigationServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        if (path == null) {
            path = "";
        }
        switch (path) {
            case "general":
                gotoGeneralMovie(request, response);
                break;
            case "type":
                gotoTypeMovie(request, response);
                break;
            case "hot-movie":
                gotoHotMovie(request, response);
                break;
            default:
                response.sendRedirect("home");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void gotoGeneralMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indexPage = request.getParameter("page");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Movie> movieList = navigationService.getMovieListByPage(index);
        request.setAttribute("movieList", movieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("navigation/generalMovie/generalMovie.jsp");
        dispatcher.forward(request, response);
    }
    private void gotoTypeMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("navigation/typeMovie/typeMovie.jsp");
        dispatcher.forward(request, response);
    }
    private void gotoHotMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("navigation/hotMovie/hotMovie.jsp");
        dispatcher.forward(request, response);
    }
}
