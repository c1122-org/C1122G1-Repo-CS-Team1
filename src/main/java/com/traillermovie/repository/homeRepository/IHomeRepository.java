package com.traillermovie.repository.homeRepository;

import com.traillermovie.model.Director;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;

import java.sql.SQLException;
import java.util.List;

public interface IHomeRepository {
    List<Movie> getListActionMovies();

    List<Movie> getListPopularMovies();

    List<Movie> getListAnimationMovies();

    List<Movie> getListNewMovies();

    Movie getMovieById(int id) throws SQLException;

    List<Director> getDirectorListByIdMovie(int id) throws SQLException;

    List<Writer> getWriterListByIdMovie(int id) throws SQLException;
}
