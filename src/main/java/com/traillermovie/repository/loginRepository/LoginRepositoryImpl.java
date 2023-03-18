package com.traillermovie.repository.loginRepository;

import com.traillermovie.model.AccountUser;
import com.traillermovie.repository.DBConnecttion.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginRepositoryImpl implements ILoginRepository {
    private static final String SELECT_ALL_ACCOUNT = "select * from account;";
    private static final String SAVE_ACCOUNT_REGISTER = "insert into account(username, password, isClient, isAdmin) \n" +
            "values (?,?,1,0);";

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

    @Override
    public int checkUsernameRetrive(String name) {
        List<AccountUser> accountUserList = getListAccountUser();
        for (AccountUser accountUser: accountUserList) {
            if (name.equals(accountUser.getUsername())) {
                return 0;
            }
        }
        return 1;
    }

    @Override
    public void saveAccountRegister(String name, String password) {
        try(Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_ACCOUNT_REGISTER)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            preparedStatement.executeUpdate();
            DBConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
