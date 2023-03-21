package com.traillermovie.controller;

import com.traillermovie.model.*;
import com.traillermovie.service.adminService.AdminServiceImpl;
import com.traillermovie.service.homeService.HomeServiceImpl;
import com.traillermovie.service.loginService.LoginServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig()
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
                    handleSubmitFromUser(request, response);
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
            case "update":
                showFormUpdateAccountUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                showListUser(request, response);
                break;
        }
    }
    public void handleSubmitFromUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateFormMovie(request, response);
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        loginService.deleteUser(id);
        response.sendRedirect("admin?path=user");

    }

    public void showListMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movieList = homeService.getAllMovie();
        request.setAttribute("movieList", movieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/listMovie.jsp");
        dispatcher.forward(request, response);
    }

    public void showListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AccountUser> accountUserList = loginService.getListAccountUserInAdmin();
        request.setAttribute("accountUserList", accountUserList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/listUser.jsp");
        dispatcher.forward(request, response);
    }
    public void showFormUpdateAccountUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AccountUser accountUser = adminService.getAccountUserById(id);
        request.setAttribute("accountUser", accountUser);
        request.getRequestDispatcher("admin/formUser.jsp").forward(request, response);
    }
    //    SHOW FORM CRUD MOVIE
    public void showCreateFormMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Genre> genreList = homeService.getAllGenre();
        List<Director> directorList = adminService.getListDirector();
        List<Writer> writerList = adminService.getListWriter();
        request.setAttribute("directorList", directorList);
        request.setAttribute("writerList", writerList);
        request.setAttribute("genreList", genreList);
        request.setAttribute("message", "Add new movie");
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
        request.setAttribute("message", "Movie Editing");
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

    public void createNewMovie(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = adminService.getIdMovieLatestVersion();
        String title = request.getParameter("title");
        if (!isNumeric(request.getParameter("rating")) || !isNumeric(request.getParameter("rank")) || !isNumeric(request.getParameter("yearPublic"))) {
            response.sendRedirect("admin?path=movie&action=create&status=false");
            return;
        }
        double rating = Double.parseDouble(request.getParameter("rating"));
        int rank = Integer.parseInt(request.getParameter("rank"));
        int yearPublic = Integer.parseInt(request.getParameter("yearPublic"));
        Part part = request.getPart("img");
        String imageFileName = part.getSubmittedFileName();
        String uploadPath = "C:/Users/ADMIN/Desktop/TraillerMovie/src/main/webapp/files/" + imageFileName;
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String image = "/files/" + imageFileName;
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
        response.sendRedirect("admin?path=movie&action=create&status=true");
    }

    public void updateMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (request.getParameter("title").equals("") || request.getParameter("description").equals("") || request.getParameter("trailer").equals("")) {
            response.sendRedirect("admin?path=movie&action=update&id=" + id + "&status=false&error=required");
            return;
        }
        if (!isNumeric(request.getParameter("rating")) || !isNumeric(request.getParameter("rank")) || !isNumeric(request.getParameter("yearPublic"))) {
            response.sendRedirect("admin?path=movie&action=update&id=" + id + "&status=false&error=number");
            return;
        }
        double rating = Double.parseDouble(request.getParameter("rating"));
        int rank = Integer.parseInt(request.getParameter("rank"));
        int yearPublic = Integer.parseInt(request.getParameter("yearPublic"));
        String title = request.getParameter("title");
        Part part = request.getPart("img");
        String imageFileName = part.getSubmittedFileName();
        String uploadPath = "C:/Users/ADMIN/Desktop/TraillerMovie/src/main/webapp/files/" + imageFileName;
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String image = "/files/" + imageFileName;
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
        response.sendRedirect("admin?path=movie&action=update&id=" + id + "&status=true");
    }
    public void updateFormMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("admin?path=user&action=update&id=" + id + "&status=false");
            return;
        }
        else {
            adminService.updateAccountUser(id, newPassword);
            response.sendRedirect("admin?path=user&action=update&id=" + id + "&status=true");
        }
    }
    public void deleteMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminService.deleteMovieById(id);
        response.sendRedirect("admin");
    }

    public boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Double.parseDouble(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }
    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[is.available()];
            is.read();
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
}
