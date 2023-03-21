package com.traillermovie.service.adminService;

import com.traillermovie.model.AccountUser;
import com.traillermovie.model.Director;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;

import java.sql.SQLException;
import java.util.List;

public interface IAdminService {
    int saveMovie(Movie movie);
    int updateMovie(Movie movie);
    int deleteMovieById(int id);
    List<Director> getListDirector();
    List<Writer> getListWriter();
    void saveDirectorListByIdMovie(int id_movie, int[] directors);
    void saveWriterListByIdMovie(int id_movie, int[] writers);
    int getIdMovieLatestVersion();
    void removeOldDirectorByIdMovie(int id_movie);
    void removeOldWriterByIdMovie(int id_movie);
    void updateAccountUser(int id_account, String password);
    AccountUser getAccountUserById(int id_account);
}
