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

    private static final String UPDATE_ACCOUNT_USER="update account set password= ?  where id_acc = ?";

    private final String SELECT_BY_ID = "select id_acc,username,password,isClient,isAdmin from account where id_acc =?";
    private final static String SET_FOREIGN_KEY_0 = "SET FOREIGN_KEY_CHECKS=0";
    private final static String SET_FOREIGN_KEY_1 = "SET FOREIGN_KEY_CHECKS=1";
    private static final String DELETE_ACCOUNT_USER = "delete from account where id_acc = ?";
    private static final String SELECT_ALL_ACCOUNT_USER = "select * from account where isAdmin = 0;";



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
        for (AccountUser accountUser : accountUserList) {
            if (name.equals(accountUser.getUsername())) {
                return 0;
            }
        }
        return 1;
    }

    @Override
    public void saveAccountRegister(String name, String password) {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_ACCOUNT_REGISTER)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            preparedStatement.executeUpdate();
            DBConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean updateUser(int id ,AccountUser accountUser) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACCOUNT_USER);
            preparedStatement.setString(1, accountUser.getPassword());
            preparedStatement.setInt(2, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public int deleteUser(int id) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ACCOUNT_USER)) {
            preparedStatement.setInt(1, id);
            int result = preparedStatement.executeUpdate();
            DBConnection.close();
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public AccountUser selectById(int id) {
        AccountUser accountUser = null;
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("username");
                String passWord = resultSet.getString("password");
                boolean isClient = resultSet.getBoolean("isClient");
                boolean isAdmin = resultSet.getBoolean("isAdmin");
                accountUser = new AccountUser(id, name, passWord, isClient, isClient);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accountUser;
    }
    public List<AccountUser> getListAccountUserInAdmin() {
        List<AccountUser> accountUserList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACCOUNT_USER)) {
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
}
