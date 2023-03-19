package com.traillermovie.service.loginService;

import com.traillermovie.model.AccountUser;
import com.traillermovie.repository.loginRepository.LoginRepositoryImpl;

import java.util.List;

public class LoginServiceImpl implements ILoginService{
    private LoginRepositoryImpl loginRepository = new LoginRepositoryImpl();
    @Override
    public List<AccountUser> getListAccountUser() {
        return loginRepository.getListAccountUser();
    }

    @Override
    public AccountUser checkAccountUser(String username, String password) {
        return loginRepository.checkAccountUser(username, password);
    }

    @Override
    public int checkUsernameRetrive(String name) {
        return loginRepository.checkUsernameRetrive(name);
    }

    @Override
    public void saveAccountRegister(String name, String password) {
        loginRepository.saveAccountRegister(name, password);
    }
}
