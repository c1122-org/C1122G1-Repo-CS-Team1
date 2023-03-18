package com.traillermovie.repository.loginRepository;

import com.traillermovie.model.AccountUser;
import com.traillermovie.repository.DBConnecttion.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginRepositoryImpl implements ILoginRepository {
<<<<<<< HEAD
    private String jdbcUrl = "jdbc:mysql://localhost:3307/trailler_movie";
    private String jdbcUserName = "root";
    private String jdbcPassword = "123456";
=======
>>>>>>> a36cfb4cbc9b7fd054620fe686fc9de22640585a
    private static final String SELECT_ALL_ACCOUNT = "select * from account;";

    @Override
    public List<AccountUser> getListAccountUser() {
        List<AccountUser> accountUserList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACCOUNT)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_acc");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                boolean isClient = resultSet.getBoolean("isClient");
                boolean isAdmin = resultSet.getBoolean("isAdmin");
                accountUserList.add(new AccountUser(id, username, password, isClient, isAdmin));
            }
            DBConnection.close();
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
