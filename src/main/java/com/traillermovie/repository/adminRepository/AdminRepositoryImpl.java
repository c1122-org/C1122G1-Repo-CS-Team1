package com.traillermovie.repository.adminRepository;

import com.traillermovie.model.Movie;

import java.sql.*;

public class AdminRepositoryImpl implements IAdminRepository {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/trailler_movie";
    private String jdbcUserName = "root";
    private String jdbcPassword = "chinh@240203";
    private final static String SAVE_MOVIE = "insert into movies(title_movie,rating_movie,rank_movie, year_movie, image_movie, description_movie, traller_movie, id_genre) values (?,?,?,?,?,?,?,?)";
    private final static String UPDATE_MOVIE = "update movies set title_movie = ?,rating_movie = ?,rank_movie = ?, year_movie = ?, image_movie = ?, description_movie = ?, traller_movie = ?, id_genre = ? where id_movie = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    @Override
    public int saveMovie(Movie movie) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_MOVIE)) {
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setDouble(2, movie.getRating());
            preparedStatement.setInt(3, movie.getRank());
            preparedStatement.setInt(4, movie.getYearPublic());
            preparedStatement.setString(5, movie.getImage());
            preparedStatement.setString(6, movie.getDescription());
            preparedStatement.setString(7, movie.getTrailer());
            preparedStatement.setInt(8, movie.getGenre());
            int result = preparedStatement.executeUpdate();
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int updateMovie(Movie movie) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MOVIE)) {
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
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
