package com.traillermovie.service.homeService;

import com.traillermovie.model.Director;
import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;
import com.traillermovie.repository.homeRepository.HomeRepositoryImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HomeServiceImpl implements IHomeService {
    private static HomeRepositoryImpl homeRepository = new HomeRepositoryImpl();

    public List<Movie> getListActionMovies() {
        return homeRepository.getListActionMovies();
    }

    public List<Movie> getListPopularMovies() {
        return homeRepository.getListPopularMovies();
    }

    public List<Movie> getListAnimationMovies() {
        return homeRepository.getListAnimationMovies();
    }

    @Override
    public List<Movie> getListNewMovies() {
        return homeRepository.getListNewMovies();
    }

    @Override
    public Movie getMovieById(int id) throws SQLException {
        return homeRepository.getMovieById(id);
    }

    public List<Director> getDirectorListByIdMovie(int id) throws SQLException {
        return homeRepository.getDirectorListByIdMovie(id);
    }

    @Override
    public List<Writer> getWriterListByIdMovie(int id) throws SQLException {
        return homeRepository.getWriterListByIdMovie(id);
    }

    @Override
    public List<Genre> getAllGenre() {
        return homeRepository.getAllGenre();
    }
}
