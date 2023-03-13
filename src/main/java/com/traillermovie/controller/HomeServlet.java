package com.traillermovie.controller;

import com.traillermovie.model.Movie;
import com.traillermovie.service.homeService.HomeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    private HomeServiceImpl homeService = new HomeServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> newMovieList = homeService.getListNewMovies();
        List<Movie> actionMovieList = homeService.getListActionMovies();
        List<Movie> popularMovieList = homeService.getListPopularMovies();
        List<Movie> animationMovieList = homeService.getListAnimationMovies();
        System.out.println(popularMovieList);
        request.setAttribute("newMovieList", newMovieList);
        request.setAttribute("actionMovieList", actionMovieList);
        request.setAttribute("popularMovieList", popularMovieList);
        request.setAttribute("animationMovieList", animationMovieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
