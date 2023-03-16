package com.traillermovie.repository.homeRepository;

import com.traillermovie.model.Director;
import com.traillermovie.model.Genre;
import com.traillermovie.model.Movie;
import com.traillermovie.model.Writer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HomeRepositoryImpl implements IHomeRepository {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/trailler_movie";
    private String jdbcUserName = "root";
    private String jdbcPassword = "chinh@240203";
    private static final String SELECT_ALL_MOVIES = "select * from movies;";
    private static final String SELECT_ALL_ACTION_MOVIES = "select * from movies where id_genre = 3;";
    private static final String SELECT_ALL_POPULAR_MOVIES = "select * from movies where rating_movie between 8.8 and 10;";
    private static final String SELECT_ALL_ANIMATION_MOVIES = "select * from movies where id_genre = 4;";
    private static final String SELECT_ALL_NEW_MOVIES = "select * from movies where year_movie > 2004 order by year_movie desc;";
    private static final String SELECT_MOVIE_BY_ID = "select * from movies where id_movie = ?;";
    private static final String SELECT_DIRECTOR_BY_ID_MOVIE = "select dr.id_director, dr.name_director, image_director from directors as dr\n" +
            "join movie_director as md on dr.id_director = md.id_director\n" +
            "where md.id_movie = ?;";
    private static final String SELECT_WRITER_BY_ID_MOVIE = "select wr.id_writer, wr.name_writer, wr.image_writer from writers as wr\n" +
            "join movie_writer as mw on wr.id_writer = mw.id_writer\n" +
            "where mw.id_movie = ?;";

    private static final String SELECT_ALL_TYPE_MOVIE = "select * from genres;";
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
    public List<Movie> getAllMovie() {
        List<Movie> actionMovieList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MOVIES)) {
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
                actionMovieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer));
            }
            connection.close();
            return actionMovieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Movie> getListActionMovies() {
        List<Movie> actionMovieList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACTION_MOVIES)) {
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
                actionMovieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer));
            }
            connection.close();
            return actionMovieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Movie> getListPopularMovies() {
        List<Movie> popularMovieList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POPULAR_MOVIES)) {
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
                popularMovieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer));
            }
            connection.close();
            return popularMovieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Movie> getListAnimationMovies() {
        List<Movie> animationMovieList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ANIMATION_MOVIES)) {
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
                animationMovieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer));
            }
            connection.close();
            return animationMovieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Movie> getListNewMovies() {
        List<Movie> newMovieList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_NEW_MOVIES)) {
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
                newMovieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer));
            }
            connection.close();
            return newMovieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Movie> getListMoviesByName(String name) {
        String query = "select * from movies where title_movie like ?;";
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, name + "%");
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
                movieList.add(new Movie(id, title, rating, rank, yearPublic, image, description, trailer));
            }
            System.out.println(movieList);
            connection.close();
            return movieList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Movie getMovieById(int id) throws SQLException {
        Movie movie = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOVIE_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String title = resultSet.getString("title_movie");
                double rating = resultSet.getDouble("rating_movie");
                int rank = resultSet.getInt("rank_movie");
                int yearPublic = resultSet.getInt("year_movie");
                String image = resultSet.getString("image_movie");
                String description = resultSet.getString("description_movie");
                String trailer = resultSet.getString("traller_movie");
                movie = new Movie(id, title, rating, rank, yearPublic, image, description, trailer);
            }
            connection.close();
            return movie;
        }
    }

    @Override
    public List<Director> getDirectorListByIdMovie(int id) throws SQLException {
        List<Director> directorList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DIRECTOR_BY_ID_MOVIE)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_director = resultSet.getInt("dr.id_director");
                String name = resultSet.getString("dr.name_director");
                String image = resultSet.getString("dr.image_director");
                directorList.add(new Director(id_director, name, image));
            }
            connection.close();
            return directorList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Writer> getWriterListByIdMovie(int id) throws SQLException {
        List<Writer> writerList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_WRITER_BY_ID_MOVIE)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_writer = resultSet.getInt("wr.id_writer");
                String name = resultSet.getString("wr.name_writer");
                String image = resultSet.getString("wr.image_writer");
                writerList.add(new Writer(id_writer, name, image));
            }
            connection.close();
            return writerList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Genre> getAllGenre() {
        List<Genre> genreList = new ArrayList<>();
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE_MOVIE)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_genre");
                String name = resultSet.getString("name_genre");
                genreList.add(new Genre(id, name));
            }
            connection.close();
            return genreList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
