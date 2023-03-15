package com.traillermovie.controller;

import com.traillermovie.model.Director;
import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;
import com.traillermovie.service.homeService.HomeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    private HomeServiceImpl homeService = new HomeServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "detail":
                try {
                    showDetailMovie(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void showListMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> newMovieList = homeService.getListNewMovies();
        List<Movie> actionMovieList = homeService.getListActionMovies();
        List<Movie> popularMovieList = homeService.getListPopularMovies();
        List<Movie> animationMovieList = homeService.getListAnimationMovies();
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList",genreList);
        request.setAttribute("newMovieList", newMovieList);
        request.setAttribute("actionMovieList", actionMovieList);
        request.setAttribute("popularMovieList", popularMovieList);
        request.setAttribute("animationMovieList", animationMovieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        dispatcher.forward(request, response);
    }
    private void showDetailMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Movie movie = homeService.getMovieById(id);
        List<Director> directorList = homeService.getDirectorListByIdMovie(id);
        List<Writer> writerList = homeService.getWriterListByIdMovie(id);
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList",genreList);
        request.setAttribute("movie", movie);
        request.setAttribute("directorList", directorList);
        request.setAttribute("writerList", writerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("movies/detail.jsp");
        dispatcher.forward(request, response);
    }
}
