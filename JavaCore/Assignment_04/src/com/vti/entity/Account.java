package com.vti.entity;

import java.time.LocalDate;

public class Account {
    private int id;
    private String email;
    public String userName;
    public String fullName;
    private Department department;
    private Group[] groups;
    private Position position;
    private LocalDate createdDate;

    public Account(){

    }
    public Account(int id, String email, String userName, String firstName, String lastName){
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = firstName + " " + lastName;
    }

    public Account(int id,String email, String userName, String firstName, String lastName, Position position){
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createdDate = LocalDate.now();
    }

    public Account(int id, String email, String userName, String firstName, String lastName, Position position, LocalDate createdDate) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createdDate = createdDate;
    }

    public void displayAccount() {
        System.out.println("ID: " + id);
        System.out.println("Email: " + email);
        System.out.println("Username: " + userName);
        System.out.println("Full Name: " + fullName);
        if (position == null){
            System.out.println("com.vti.entity.Position: chưa có");
        }else{
            System.out.println("com.vti.entity.Position: " + position.name);
        }
        if (createdDate == null){
            System.out.println("Create date: chưa có");
        }else {
            System.out.println("Create date: " + createdDate);
        }

    }
}
