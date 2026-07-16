package com.library.dto;

import java.security.Timestamp;

public class Users {
	private int userId;
    private String uName;
    private String email;
    private String uPhone;
    private String address;
    private String password;
    private Timestamp registeredDate;

    public Users() {
    }

    public Users(int userId, String uName, String email, String uPhone,
                String address, String password, Timestamp registeredDate) {
        this.userId = userId;
        this.uName = uName;
        this.email = email;
        this.uPhone = uPhone;
        this.address = address;
        this.password = password;
        this.registeredDate = registeredDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(Timestamp registeredDate) {
        this.registeredDate = registeredDate;
    }
}
