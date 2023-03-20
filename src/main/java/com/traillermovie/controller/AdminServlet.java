package com.traillermovie.controller;

import com.traillermovie.model.*;
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
            case "update":
                showupdateUser(request,response);
                break;
            case "list":
                updateUser(request,response);
                break;
            case "delete":
                break;
            default:
                showListUSer(request, response);
                break;
        }
    }

    private void showupdateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        AccountUser accountUser =loginService.selectById(id);
        request.setAttribute("account", accountUser);

        RequestDispatcher dispatcherType = request.getRequestDispatcher("admin/update.jsp");

        try {
            dispatcherType.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String pass = request.getParameter("password");
        boolean client = Boolean.parseBoolean(request.getParameter("client"));
        boolean admin = Boolean.parseBoolean(request.getParameter("admin"));
        AccountUser accountUser = new AccountUser(id,name,pass,client,admin);
        RequestDispatcher dispatcher;
        loginService.updateUserRegister(id, accountUser);
        request.setAttribute("account", accountUser);
        dispatcher = request.getRequestDispatcher("admin/update.jsp");
        dispatcher.forward(request,response);
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
        List<Director> directorList = adminService.getListDirector();
        List<Writer> writerList = adminService.getListWriter();
        request.setAttribute("directorList", directorList);
        request.setAttribute("writerList", writerList);
        request.setAttribute("genreList", genreList);
        request.setAttribute("message", "Thêm mới phim");
        request.getRequestDispatcher("admin/formMovie.jsp").forward(request, response);
    }

    public void showUpdateFormMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Movie movie = homeService.getMovieById(id);
        List<Genre> genreList = homeService.getAllGenre();
        List<Director> directorList = adminService.getListDirector();
        List<Writer> writerList = adminService.getListWriter();
        List<Director> directorListSelected = homeService.getDirectorListByIdMovie(id);
        List<Writer> writerListSelected = homeService.getWriterListByIdMovie(id);
        request.setAttribute("directorList", directorList);
        request.setAttribute("writerList", writerList);
        request.setAttribute("directorListSelected", directorListSelected);
        request.setAttribute("writerListSelected", writerListSelected);
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
        int id = adminService.getIdMovieLatestVersion();
        String title = request.getParameter("title");
        double rating = Double.parseDouble(request.getParameter("rating"));
        int rank = Integer.parseInt(request.getParameter("rank"));
        int yearPublic = Integer.parseInt(request.getParameter("yearPublic"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String trailer = request.getParameter("trailer");
        int id_genre = Integer.parseInt(request.getParameter("type"));

//        GET LIST DIRECTORS AND WRITERS SELECTED TO SAVE DATABASE BY ID MOVIE

        String[] directors = request.getParameterValues("director");
        String[] writers = request.getParameterValues("writer");
        int[] id_directors = new int[directors.length];
        int[] id_writers = new int[writers.length];
        for (int i = 0; i < directors.length; i++) {
            id_directors[i] = Integer.parseInt(directors[i]);
        }
        for (int i = 0; i < writers.length; i++) {
            id_writers[i] = Integer.parseInt(writers[i]);
        }
        adminService.saveDirectorListByIdMovie(id, id_directors);
        adminService.saveWriterListByIdMovie(id, id_writers);
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
        //        GET LIST DIRECTORS AND WRITERS SELECTED TO SAVE DATABASE BY ID MOVIE

        String[] directors = request.getParameterValues("directorSelected");
        String[] writers = request.getParameterValues("writerSelected");
        int[] id_directors = new int[directors.length];
        int[] id_writers = new int[writers.length];
        for (int i = 0; i < directors.length; i++) {
            id_directors[i] = Integer.parseInt(directors[i]);
        }
        for (int i = 0; i < writers.length; i++) {
            id_writers[i] = Integer.parseInt(writers[i]);
        }
        adminService.removeOldDirectorByIdMovie(id);
        adminService.removeOldWriterByIdMovie(id);
        adminService.saveDirectorListByIdMovie(id, id_directors);
        adminService.saveWriterListByIdMovie(id, id_writers);
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
