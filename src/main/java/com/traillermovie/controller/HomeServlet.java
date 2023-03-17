package com.traillermovie.controller;

import com.traillermovie.model.*;
import com.traillermovie.service.homeService.HomeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    private HomeServiceImpl homeService = new HomeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountUser accountUser = (AccountUser) session.getAttribute("account");
        if (accountUser == null) {
            response.sendRedirect("login");
        }
        else {
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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                showListSearchMovie(request, response);
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }

    private void showListMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> newMovieList = homeService.getListNewMovies();
        List<Movie> actionMovieList = homeService.getListActionMovies();
        List<Movie> popularMovieList = homeService.getListPopularMovies();
        List<Movie> animationMovieList = homeService.getListAnimationMovies();
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
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
        request.setAttribute("genreList", genreList);
        request.setAttribute("movie", movie);
        request.setAttribute("directorList", directorList);
        request.setAttribute("writerList", writerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("movies/detail.jsp");
        dispatcher.forward(request, response);
    }

    private void showListSearchMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
        List<Movie> movieList = homeService.getListMoviesByName(search);
            request.setAttribute("movieList", movieList);
            if (movieList.size() == 0) {
            request.setAttribute("message", "Không thể tìm thấy bộ phim có lên là \"" + search+ "\". Vui lòng thử lại.");
        }
        request.getRequestDispatcher("navigation/generalMovie/generalMovie.jsp").forward(request, response);
    }
}
