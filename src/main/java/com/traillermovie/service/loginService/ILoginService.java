package com.traillermovie.service.loginService;

import com.traillermovie.model.AccountUser;

import java.util.List;

public interface ILoginService {
    List<AccountUser> getListAccountUser();
    AccountUser checkAccountUser(String username, String password);
}
