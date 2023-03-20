package com.traillermovie.service.loginService;

import com.traillermovie.model.AccountUser;

import java.util.List;

public interface ILoginService {
    List<AccountUser> getListAccountUser();
    AccountUser checkAccountUser(String username, String password);
    int checkUsernameRetrive(String name);
    void saveAccountRegister(String name, String password);
    boolean updateUser(int id ,AccountUser accountUser);
    AccountUser selectById(int id);
    int deleteUser(int id);
    List<AccountUser> getListAccountUserInAdmin();
}
