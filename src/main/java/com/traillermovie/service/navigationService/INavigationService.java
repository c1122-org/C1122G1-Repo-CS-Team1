package com.traillermovie.service.navigationService;

import com.traillermovie.model.Movie;

import java.util.List;

public interface INavigationService {
    List<Movie> getAllMovie();
    int getNumberPage();
    List<Movie> getMovieListByPage(int index);
}
