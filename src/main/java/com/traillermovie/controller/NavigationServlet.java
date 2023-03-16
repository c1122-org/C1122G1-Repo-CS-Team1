package com.traillermovie.controller;

import com.traillermovie.model.AccountUser;
import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.service.homeService.HomeServiceImpl;
import com.traillermovie.service.navigationService.NavigationServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NavigationServlet", value = "/navigation")
public class NavigationServlet extends HttpServlet {
    private static NavigationServiceImpl navigationService = new NavigationServiceImpl();
    private HomeServiceImpl homeService = new HomeServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountUser accountUser = (AccountUser) session.getAttribute("account");
        if (accountUser == null) {
            response.sendRedirect("/login");
        }
        else {
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
                default:
                    response.sendRedirect("home");
                    break;
            }
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
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
        request.setAttribute("movieList", movieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("navigation/generalMovie/generalMovie.jsp");
        dispatcher.forward(request, response);
    }
    private void gotoTypeMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int genre = Integer.parseInt(request.getParameter("genre"));
        String indexPage = request.getParameter("page");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Movie> genreMovieList = navigationService.getMovieListByPageTypeMovie(index, genre);
        String nameGenre = navigationService.getNameGenreById(genre);
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
        request.setAttribute("genreMovieList", genreMovieList);
        request.setAttribute("nameGenre", nameGenre);
        request.setAttribute("id_genre", genre);
        RequestDispatcher dispatcher = request.getRequestDispatcher("navigation/typeMovie/typeMovie.jsp");
        dispatcher.forward(request, response);
    }
    private void gotoHotMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("navigation/hotMovie/hotMovie.jsp");
        dispatcher.forward(request, response);
    }
}
