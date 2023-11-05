package com.example.edit.beans;

import java.time.LocalDate;

public class User {
    private int user_id;
    private String username;
    private String password;
    private String name;
    private LocalDate issue_at;
    private int expiration;
    private int role_id;
    private String second_name;
    private LocalDate date_of_Birth;
    private String email;
    private int otp;
    private int otp_exp;

    private  boolean premium;


    public User() {     }

    public User(int user_id, String username, String password, String name, LocalDate issue_at, int expiration,
                int role_id, String second_name, LocalDate dateOfBirth, String email, int otp, int otp_exp) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.issue_at = issue_at;
        this.expiration = expiration;
        this.role_id = role_id;
        this.second_name = second_name;
        this.date_of_Birth = dateOfBirth;
        this.email = email;
        this.otp = otp;
        this.otp_exp = otp_exp;
    }

    public User(int user_id, String username, String password, String name, LocalDate issue_at, int expiration,
                int role_id, String second_name, LocalDate dateOfBirth, String email, int otp, int otp_exp, boolean premium) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.issue_at = issue_at;
        this.expiration = expiration;
        this.role_id = role_id;
        this.second_name = second_name;
        this.date_of_Birth = dateOfBirth;
        this.email = email;
        this.otp = otp;
        this.otp_exp = otp_exp;
        this.premium = premium;
    }

    public int getUserId() {
        return user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getIssueAt() {
        return issue_at;
    }

    public void setIssueAt(LocalDate issue_at) {
        this.issue_at = issue_at;
    }

    public int getExpiration() {
        return expiration;
    }

    public void setExpiration(int expiration) {
        this.expiration = expiration;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public LocalDate getDateOfBirth() {
        return date_of_Birth;
    }

    public void setDateOfBirth(LocalDate date_of_Birth) {
        this.date_of_Birth = date_of_Birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }

    public int getOtp_exp() {
        return otp_exp;
    }

    public void setOtp_exp(int otp_exp) {
        this.otp_exp = otp_exp;
    }

    public boolean isPremium() {
        return premium;
    }

    public void setPremium(boolean premium) {
        this.premium = premium;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", issue_at=" + issue_at +
                ", expiration=" + expiration +
                ", role_id=" + role_id +
                ", second_name='" + second_name + '\'' +
                ", date_of_Birth=" + date_of_Birth +
                ", email='" + email + '\'' +
                ", otp=" + otp +
                ", otp_exp=" + otp_exp +
                ", premium=" + premium +
                '}';
    }
}