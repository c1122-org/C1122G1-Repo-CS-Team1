package com.traillermovie.repository.navigationRepository;

import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.repository.DBConnecttion.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NavigationRepositoryImpl implements INavigationRepository {
<<<<<<< HEAD
    private String jdbcUrl = "jdbc:mysql://localhost:3306/trailler_movie";
//    3307
    private String jdbcUserName = "root";
    private String jdbcPassword = "chinh@240203";
//    123456
=======
>>>>>>> a36cfb4cbc9b7fd054620fe686fc9de22640585a
    private static final String SELECT_ALL_MOVIE = "select * from movies;";
    private static final String SELECT_GENRE_MOVIE = "select * from movies where id_genre = ?;";
    private static final String SELECT_NAME_GENRE = "select name_genre from genres where id_genre = ?;";

    @Override
    public List<Movie> getAllMovie() {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MOVIE)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_movie");
                String title = resultSet.getString("title_movie");
                double rating = resultSet.getDouble("rating_movie");
                int rank = resultSet.getInt("rank_movie");
                int yearPublic = resultSet.getInt("year_movie");
                String image = resultSet.getString("image_movie");
                String description = resultSet.getString("description_movie");
                String trailer = resultSet.getString("traller_movie");
                int genre = resultSet.getInt("id_genre");
                movieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer, genre));
            }
            DBConnection.close();
            return movieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getNumberPage() {
        String query = "select count(*) from movies;";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int total = resultSet.getInt(1);
                int countPage = total / 15;
                if (total % 15 != 0) countPage++;
                return countPage;
            }
            DBConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int getNumberPageTypeMovie(int id_genre) {
        String query = "select count(*) from movies where id_genre = ?;";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id_genre);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int total = resultSet.getInt(1);
                int countPage = total / 10;
                if (total % 10 != 0) countPage++;
                System.out.println(countPage);
                return countPage;
            }
            DBConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    @Override
    public List<Movie> getMovieListByPage(int index) {
        String query = "SELECT * FROM movies LIMIT ?, 15;";
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, (index-1)*15);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_movie");
                String title = resultSet.getString("title_movie");
                double rating = resultSet.getDouble("rating_movie");
                int rank = resultSet.getInt("rank_movie");
                int yearPublic = resultSet.getInt("year_movie");
                String image = resultSet.getString("image_movie");
                String description = resultSet.getString("description_movie");
                String trailer = resultSet.getString("traller_movie");
                int genre = resultSet.getInt("id_genre");
                movieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer, genre));
            }
            DBConnection.close();
            return movieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public List<Movie> getMovieListByPageTypeMovie(int index, int id_genre) {
        String query = "SELECT * FROM movies where id_genre = ? LIMIT ?, 10;";
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id_genre);
            preparedStatement.setInt(2, (index - 1) * 10);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_movie");
                String title = resultSet.getString("title_movie");
                double rating = resultSet.getDouble("rating_movie");
                int rank = resultSet.getInt("rank_movie");
                int yearPublic = resultSet.getInt("year_movie");
                String image = resultSet.getString("image_movie");
                String description = resultSet.getString("description_movie");
                String trailer = resultSet.getString("traller_movie");
                int genre = resultSet.getInt("id_genre");
                movieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer, genre));
            }
            DBConnection.close();
            return movieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public List<Movie> getMovieListByGenre(int genre) {
        List<Movie> movieList = new ArrayList<>();
        try(Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GENRE_MOVIE)) {
            preparedStatement.setInt(1, genre);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_movie");
                String title = resultSet.getString("title_movie");
                double rating = resultSet.getDouble("rating_movie");
                int rank = resultSet.getInt("rank_movie");
                int yearPublic = resultSet.getInt("year_movie");
                String image = resultSet.getString("image_movie");
                String description = resultSet.getString("description_movie");
                String trailer = resultSet.getString("traller_movie");
                movieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer, genre));
            }
            DBConnection.close();
            return movieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getNameGenreById(int genre) {
        try(Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NAME_GENRE)) {
            preparedStatement.setInt(1, genre);
            ResultSet resultSet = preparedStatement.executeQuery();
            String name = null;
            while (resultSet.next()) {
                name = resultSet.getString(1);
            }
            DBConnection.close();
            return name;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
