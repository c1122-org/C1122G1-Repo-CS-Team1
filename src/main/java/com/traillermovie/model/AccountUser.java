package com.traillermovie.model;

public class AccountUser {
    private int id;
    private String username;
    private String password;
    private boolean isClient;
    private boolean isAdmin;

    public AccountUser(int id, String username, String password, boolean isClient, boolean isAdmin) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.isClient = isClient;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isClient() {
        return isClient;
    }

    public void setClient(boolean client) {
        isClient = client;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }
}
