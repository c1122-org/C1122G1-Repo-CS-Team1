package com.traillermovie.service.homeService;

import com.traillermovie.model.Director;
import com.traillermovie.model.Movie;

import java.sql.SQLException;
import java.util.List;

public interface IHomeService {
    List<Movie> getListActionMovies();
    List<Movie> getListPopularMovies();
    List<Movie> getListAnimationMovies();
    List<Movie> getListNewMovies();
    Movie getMovieById(int id) throws SQLException;
    List<Director> getDirectorListByIdMovie(int id) throws SQLException;
}
