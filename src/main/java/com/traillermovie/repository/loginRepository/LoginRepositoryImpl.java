package com.traillermovie.repository.loginRepository;

import com.traillermovie.model.AccountUser;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginRepositoryImpl implements ILoginRepository {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/trailler_movie";
    private String jdbcUserName = "root";
    private String jdbcPassword = "chinh@240203";
    private static final String SELECT_ALL_ACCOUNT = "select * from account;";

    private Connection getConnection() {
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
    public List<AccountUser> getListAccountUser() {
        List<AccountUser> accountUserList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACCOUNT)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_acc");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                boolean isClient = resultSet.getBoolean("isClient");
                boolean isAdmin = resultSet.getBoolean("isAdmin");
                accountUserList.add(new AccountUser(id, username, password, isClient, isAdmin));
            }
            connection.close();
            return accountUserList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public AccountUser checkAccountUser(String username, String password) {
        List<AccountUser> accountUserList = getListAccountUser();
        for (AccountUser account : accountUserList) {
            if (username.equals(account.getUsername()) && password.equals(account.getPassword())) {
                return account;
            }
        }
        return null;
    }
}
