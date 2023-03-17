package com.traillermovie.service.adminService;

import com.traillermovie.model.Movie;
import com.traillermovie.repository.adminRepository.AdminRepositoryImpl;

public class AdminServiceImpl implements IAdminService{
    private AdminRepositoryImpl adminRepository = new AdminRepositoryImpl();
    @Override
    public int saveMovie(Movie movie) {
        return adminRepository.saveMovie(movie);
    }

    @Override
    public int updateMovie(Movie movie) {
        return adminRepository.updateMovie(movie);
    }

    @Override
    public int deleteMovieById(int id) {
        return adminRepository.deleteMovieById(id);
    }
}
