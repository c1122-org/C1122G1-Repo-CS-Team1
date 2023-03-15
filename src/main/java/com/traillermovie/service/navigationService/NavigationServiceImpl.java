package com.traillermovie.service.navigationService;

import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.repository.navigationRepository.NavigationRepositoryImpl;

import java.util.List;

public class NavigationServiceImpl implements INavigationService{
    private static NavigationRepositoryImpl navigationRepository = new NavigationRepositoryImpl();
    @Override
    public List<Movie> getAllMovie() {
        return navigationRepository.getAllMovie();
    }


    public int getNumberPage() {
        return navigationRepository.getNumberPage();
    }

    @Override
    public int getNumberPageTypeMovie(int id_genre) {
        return navigationRepository.getNumberPageTypeMovie(id_genre);
    }

    @Override
    public List<Movie> getMovieListByPageTypeMovie(int index, int id_genre) {
        return navigationRepository.getMovieListByPageTypeMovie(index, id_genre);
    }

    @Override
    public List<Movie> getMovieListByPage(int index) {
        return navigationRepository.getMovieListByPage(index);
    }

    @Override
    public List<Movie> getMovieListByGenre(int genre) {
        return navigationRepository.getMovieListByGenre(genre);
    }

    @Override
    public String getNameGenreById(int genre) {
        return navigationRepository.getNameGenreById(genre);
    }

    ;
}
