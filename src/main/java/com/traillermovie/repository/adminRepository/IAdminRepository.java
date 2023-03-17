package com.traillermovie.repository.adminRepository;

import com.traillermovie.model.Movie;

import java.sql.SQLException;

public interface IAdminRepository {
    int saveMovie(Movie movie) throws SQLException;
    int updateMovie(Movie movie);
    int deleteMovieById(int id);
}
