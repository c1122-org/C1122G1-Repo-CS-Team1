package com.traillermovie.service.homeService;

import com.traillermovie.model.*;

import java.sql.SQLException;
import java.util.List;

public interface IHomeService {
    List<Movie> getAllMovie();
    List<Movie> getListActionMovies();

    List<Movie> getListPopularMovies();

    List<Movie> getListAnimationMovies();

    List<Movie> getListNewMovies();

    Movie getMovieById(int id) throws SQLException;

    List<Director> getDirectorListByIdMovie(int id) throws SQLException;

    List<Writer> getWriterListByIdMovie(int id) throws SQLException;
    List<Genre> getAllGenre();
    List<Movie> getListMoviesByName(String name);
}
