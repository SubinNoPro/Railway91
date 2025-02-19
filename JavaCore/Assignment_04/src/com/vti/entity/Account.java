package com.vti.entity;

import java.time.LocalDate;

public class Account {
    private int accountId;
    private String email;
    private String userName;
    private String fullName;
    private Department department;
    private Group[] groups;
    private Position position;
    private LocalDate createdDate;

    public Account(){

    }
    public Account(int accountId, String email, String userName, String firstName, String lastName){
        this.accountId = accountId;
        this.email = email;
        this.userName = userName;
        this.fullName = firstName + " " + lastName;
    }

    public Account(int accountId, String email, String userName, String firstName, String lastName, Position position){
        this.accountId = accountId;
        this.email = email;
        this.userName = userName;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createdDate = LocalDate.now();
    }

    public Account(int accountId, String email, String userName, String firstName, String lastName, Position position, LocalDate createdDate) {
        this.accountId = accountId;
        this.email = email;
        this.userName = userName;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createdDate = createdDate;
    }

    public void displayAccount() {
        System.out.println("ID: " + accountId);
        System.out.println("Email: " + email);
        System.out.println("Username: " + userName);
        System.out.println("Full Name: " + fullName);
        if (position == null){
            System.out.println("com.vti.entity.Position: chưa có");
        }else{
            System.out.println("com.vti.entity.Position: " + position.getPositionName());
        }
        if (createdDate == null){
            System.out.println("Create date: chưa có");
        }else {
            System.out.println("Create date: " + createdDate);
        }

    }

    public int getAccountId() {
        return accountId;
    }

    public String getEmail() {
        return email;
    }

    public String getUserName() {
        return userName;
    }

    public String getFullName() {
        return fullName;
    }

    public Department getDepartment() {
        return department;
    }

    public Group[] getGroups() {
        return groups;
    }

    public Position getPosition() {
        return position;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setGroups(Group[] groups) {
        this.groups = groups;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }
}
