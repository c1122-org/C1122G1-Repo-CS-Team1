package com.traillermovie.repository.navigationRepository;

import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;

import java.sql.SQLException;
import java.util.List;

public interface INavigationRepository {
    List<Movie> getAllMovie() throws SQLException;
    int getNumberPage();
    List<Movie> getMovieListByPage(int index);
    List<Movie> getMovieListByGenre(int genre);
    String getNameGenreById(int genre);
}
