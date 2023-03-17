package com.traillermovie.controller;

import com.traillermovie.model.AccountUser;
import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.service.adminService.AdminServiceImpl;
import com.traillermovie.service.homeService.HomeServiceImpl;
import com.traillermovie.service.loginService.LoginServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    private HomeServiceImpl homeService = new HomeServiceImpl();
    private LoginServiceImpl loginService = new LoginServiceImpl();
    private AdminServiceImpl adminService = new AdminServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        if (path == null) {
            path = "";
        }
        switch (path) {
            case "movie":
                try {
                    handlePathMovie(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "user":
                try {
                    handlePathUser(request, response);
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
        String path = request.getParameter("path");
        if (path == null) {
            path = "";
        }
        switch (path) {
            case "movie":
                handleSubmitFormMovie(request, response);
                break;
            case "user":
                try {
                    handlePathUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }
    public void handlePathMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateFormMovie(request, response);
                break;
            case "update":
                showUpdateFormMovie(request, response);
                break;
            case "delete":
                deleteMovie(request, response);
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }
    public void handlePathUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateFormMovie(request, response);
                break;
            case "update":
                showUpdateFormMovie(request, response);
                break;
            case "delete":
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }
    public void showListMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movieList = homeService.getAllMovie();
        request.setAttribute("movieList", movieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/listMovie.jsp");
        dispatcher.forward(request, response);
    }
    public void showListUSer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AccountUser> accountUserList = loginService.getListAccountUser();
        request.setAttribute("accountUserList", accountUserList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/listUser.jsp");
        dispatcher.forward(request, response);
    }

//    SHOW FORM CRUD MOVIE
    public void showCreateFormMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
        request.setAttribute("message", "Thêm mới phim");
        request.getRequestDispatcher("admin/formMovie.jsp").forward(request, response);
    }
    public void showUpdateFormMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Movie movie = homeService.getMovieById(id);
        List<Genre> genreList = homeService.getAllGenre();
        request.setAttribute("genreList", genreList);
        request.setAttribute("message", "Chỉnh sửa phim");
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("admin/formMovie.jsp").forward(request, response);
    }

//    HANDLE ACTION WHEN SUBMIT FORM
    public void handleSubmitFormMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewMovie(request, response);
                break;
            case "update":
                updateMovie(request, response);
                break;
            case "delete":
                deleteMovie(request, response);
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }
    public void createNewMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = homeService.getAllMovie().size() + 1;
        String title = request.getParameter("title");
        double rating = Double.parseDouble(request.getParameter("rating"));
        int rank = Integer.parseInt(request.getParameter("rank"));
        int yearPublic = Integer.parseInt(request.getParameter("yearPublic"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String trailer = request.getParameter("trailer");
        int id_genre = Integer.parseInt(request.getParameter("type"));
        Movie movie = new Movie(id, title, rating, rank, yearPublic, image, description, trailer, id_genre);
        adminService.saveMovie(movie);
        response.sendRedirect("admin?path=movie&action=create");
    }
    public void updateMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        double rating = Double.parseDouble(request.getParameter("rating"));
        int rank = Integer.parseInt(request.getParameter("rank"));
        int yearPublic = Integer.parseInt(request.getParameter("yearPublic"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String trailer = request.getParameter("trailer");
        int id_genre = Integer.parseInt(request.getParameter("type"));
        Movie movie = new Movie(id, title, rating, rank, yearPublic, image, description, trailer, id_genre);
        adminService.updateMovie(movie);
        response.sendRedirect("admin?path=movie&action=update&id=" + id);
    }
    public void deleteMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminService.deleteMovieById(id);
        response.sendRedirect("admin");
    }
}
