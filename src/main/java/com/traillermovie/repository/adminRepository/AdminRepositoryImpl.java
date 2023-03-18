package com.traillermovie.repository.adminRepository;

import com.traillermovie.model.Director;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;
import com.traillermovie.repository.DBConnecttion.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminRepositoryImpl implements IAdminRepository {
    private final static String SAVE_MOVIE = "insert into movies(title_movie,rating_movie,rank_movie, year_movie, image_movie, description_movie, traller_movie, id_genre) values (?,?,?,?,?,?,?,?)";
    private final static String UPDATE_MOVIE = "update movies set title_movie = ?,rating_movie = ?,rank_movie = ?, year_movie = ?, image_movie = ?, description_movie = ?, traller_movie = ?, id_genre = ? where id_movie = ?";
    private final static String DELETE_MOVIE = "delete from movies where id_movie = ?";
    private final static String SELECT_ALL_DIRECTORS = "select * from directors;";
    private final static String SELECT_ALL_WRITERS = "select * from writers;";
    private final static String SAVE_DIRECTOR = "insert into movie_director(id_movie, id_director) values (?, ?);";
    private final static String SAVE_WRITER = "insert into movie_writer(id_movie, id_writer) values (?, ?);";
    private final static String SET_FOREIGN_KEY_0 = "SET FOREIGN_KEY_CHECKS=0";
    private final static String SET_FOREIGN_KEY_1 = "SET FOREIGN_KEY_CHECKS=1";
    private final static String GET_ID_MOVIE_LATEST_VERSION = "SELECT AUTO_INCREMENT \n" +
            "FROM information_schema.tables\n" +
            "WHERE table_name = 'movies'\n" +
            "     and table_schema = database();";

    @Override
    public int saveMovie(Movie movie) {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_MOVIE)) {
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setDouble(2, movie.getRating());
            preparedStatement.setInt(3, movie.getRank());
            preparedStatement.setInt(4, movie.getYearPublic());
            preparedStatement.setString(5, movie.getImage());
            preparedStatement.setString(6, movie.getDescription());
            preparedStatement.setString(7, movie.getTrailer());
            preparedStatement.setInt(8, movie.getGenre());
            int result = preparedStatement.executeUpdate();
            DBConnection.close();
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int updateMovie(Movie movie) {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MOVIE)) {
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setDouble(2, movie.getRating());
            preparedStatement.setInt(3, movie.getRank());
            preparedStatement.setInt(4, movie.getYearPublic());
            preparedStatement.setString(5, movie.getImage());
            preparedStatement.setString(6, movie.getDescription());
            preparedStatement.setString(7, movie.getTrailer());
            preparedStatement.setInt(8, movie.getGenre());
            preparedStatement.setInt(9, movie.getId());
            int result = preparedStatement.executeUpdate();
            DBConnection.close();
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int deleteMovieById(int id) {
        String query = "{call delete_movie(?)}";
        try (Connection connection = DBConnection.getConnection(); CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            int result = callableStatement.executeUpdate();
            DBConnection.close();
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Director> getListDirector() {
        List<Director> directorList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIRECTORS)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_director");
                String name = resultSet.getString("name_director");
                String image = resultSet.getString("image_director");
                directorList.add(new Director(id, name, image));
            }
            DBConnection.close();
            return directorList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Writer> getListWriter() {
        List<Writer> writerList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_WRITERS)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_writer");
                String name = resultSet.getString("name_writer");
                String image = resultSet.getString("image_writer");
                writerList.add(new Writer(id, name, image));
            }
            DBConnection.close();
            return writerList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void saveDirectorListByIdMovie(int id_movie, int[] directors) {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_DIRECTOR)) {
            PreparedStatement setForeignKey0 = connection.prepareStatement(SET_FOREIGN_KEY_0);
            setForeignKey0.executeUpdate();
            for (int i = 0; i < directors.length; i++) {
                preparedStatement.setInt(1, id_movie);
                preparedStatement.setInt(2, directors[i]);
                preparedStatement.executeUpdate();
            }
            PreparedStatement setForeignKey1 = connection.prepareStatement(SET_FOREIGN_KEY_1);
            setForeignKey1.executeUpdate();
            DBConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void saveWriterListByIdMovie(int id_movie, int[] writers) {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_WRITER)) {
            PreparedStatement setForeignKey0 = connection.prepareStatement(SET_FOREIGN_KEY_0);
            setForeignKey0.executeUpdate();
            for (int i = 0; i < writers.length; i++) {
                preparedStatement.setInt(1, id_movie);
                preparedStatement.setInt(2, writers[i]);
                preparedStatement.executeUpdate();
            }
            PreparedStatement setForeignKey1 = connection.prepareStatement(SET_FOREIGN_KEY_1);
            setForeignKey1.executeUpdate();
            DBConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getIdMovieLatestVersion() {
        try(Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(GET_ID_MOVIE_LATEST_VERSION)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            int idLatest = 0;
            while (resultSet.next()) {
                idLatest = resultSet.getInt(1);
            }
            return idLatest;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
