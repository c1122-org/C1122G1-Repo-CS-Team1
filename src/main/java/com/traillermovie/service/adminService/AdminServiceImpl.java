package com.traillermovie.service.adminService;

import com.traillermovie.model.AccountUser;
import com.traillermovie.model.Director;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;
import com.traillermovie.repository.adminRepository.AdminRepositoryImpl;

import java.util.List;

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

    @Override
    public List<Director> getListDirector() {
        return adminRepository.getListDirector();
    }

    @Override
    public List<Writer> getListWriter() {
        return adminRepository.getListWriter();
    }

    @Override
    public void saveDirectorListByIdMovie(int id_movie, int[] directors) {
        adminRepository.saveDirectorListByIdMovie(id_movie, directors);
    }

    @Override
    public void saveWriterListByIdMovie(int id_movie, int[] writers) {
        adminRepository.saveWriterListByIdMovie(id_movie, writers);
    }

    @Override
    public int getIdMovieLatestVersion() {
        return adminRepository.getIdMovieLatestVersion();
    }

    @Override
    public void removeOldDirectorByIdMovie(int id_movie) {
        adminRepository.removeOldDirectorByIdMovie(id_movie);
    }

    @Override
    public void removeOldWriterByIdMovie(int id_movie) {
        adminRepository.removeOldWriterByIdMovie(id_movie);
    }

    @Override
    public void updateAccountUser(int id_account, String password) {
        adminRepository.updatePasswordAccountUser(id_account, password);
    }

    @Override
    public AccountUser getAccountUserById(int id_account) {
        return adminRepository.getAccountUserById(id_account);
    }

}
