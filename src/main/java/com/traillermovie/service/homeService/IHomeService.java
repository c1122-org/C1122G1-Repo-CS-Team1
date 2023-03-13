package com.traillermovie.service.homeService;

import com.traillermovie.model.Movie;

import java.util.List;

public interface IHomeService {
    List<Movie> getListActionMovies();
    List<Movie> getListPopularMovies();
    List<Movie> getListAnimationMovies();
    List<Movie> getListNewMovies();
}
