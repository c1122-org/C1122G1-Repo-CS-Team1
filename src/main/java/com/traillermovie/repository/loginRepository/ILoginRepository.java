package com.traillermovie.repository.loginRepository;

import com.traillermovie.model.AccountUser;

import java.util.List;

public interface ILoginRepository {
    List<AccountUser> getListAccountUser();
    AccountUser checkAccountUser(String username, String password);
}
