package com.traillermovie.service.adminService;

import com.traillermovie.model.Movie;

import java.sql.SQLException;

public interface IAdminService {
    int saveMovie(Movie movie);
    int updateMovie(Movie movie);
    int deleteMovieById(int id);
}
